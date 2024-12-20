import type { Request, Response } from "express";
import { db } from "@/drizzle/db";
import {
  candidateEvaluationRemarksTable,
  CandidateRecruitmentDriveTable,
  JobApplicationTable,
  UserTable,
} from "@/drizzle/schema";
import { and, eq, inArray, isNotNull } from "drizzle-orm";
import { asyncHandler } from "./asyncHandler";
import { ApiError } from "./ApiError";
import { ApiResponse } from "./ApiResponse";
import { sendError } from "./sendError";
import {
  CandidateEvaluationRemarks,
  CandidateRecruitmentDriveWithAudit,
} from "@/types";
import { sendMail_HR, sendMail_TESTING } from "../services/email.service";
import { getCandidateRoleId } from "./getUserRoleId";
import { getUserId } from "./getUserId";

export const fetchAllRecruitmentCandidates = asyncHandler(
  async (req: Request, res: Response) => {
    try {
      const candidateRoleId = getCandidateRoleId();

      // Fetch all users against 'candidateRoleId', who also have the 'createdBy' field
      const candidates: any = await db
        .select({
          id: UserTable.id,
          roleId: UserTable.roleId,
          recruitmentDriveId: UserTable.recruitmentDriveId,
          email: UserTable.email,
          firstName: UserTable.firstName,
          lastName: UserTable.lastName,
          createdBy: UserTable.createdBy, // Adding createdBy to select fields
        })
        .from(UserTable)
        .where(
          and(
            eq(UserTable.roleId, candidateRoleId),
            isNotNull(UserTable.createdBy), // Ensure createdBy is not null
          ),
        );

      return res
        .status(200)
        .json(
          new ApiResponse(
            200,
            candidates,
            `${candidates.length} Candidates successfully`,
          ),
        );
    } catch (error) {
      sendError(res, error);
    }
  },
);

export const updateUsersInBulk = asyncHandler(
  async (req: Request, res: Response) => {
    const { emails } = req.body;

    try {
      const updatedUsers = [];

      for (const email of emails) {
        const [updatedUser]: any = await db
          .update(UserTable)
          .set({
            recruitmentDriveId: "c30a18cc-fb7f-47e1-8f58-a9f9017be299",
            updatedAt: new Date().toISOString(),
          })
          .where(eq(UserTable.email, email))
          .returning({
            id: UserTable.id,
            roleId: UserTable.roleId,
            recruitmentDriveId: UserTable.recruitmentDriveId,
            email: UserTable.email,
            firstName: UserTable.firstName,
            lastName: UserTable.lastName,
          });

        if (!updatedUser) {
          throw new ApiError(
            500,
            `Failed to update the User with email: ${email}`,
          );
        }

        updatedUsers.push(updatedUser);
      }

      return res
        .status(200)
        .json(
          new ApiResponse(
            200,
            updatedUsers,
            `${updatedUsers.length} Users updated successfully`,
          ),
        );
    } catch (error) {
      sendError(res, error);
    }
  },
);

export const createBulkJobApplications = asyncHandler(
  async (req: Request, res: Response) => {
    const { jobPostingId } = req.params;
    const { emails } = req.body;

    try {
      if (!jobPostingId) {
        throw new ApiError(400, "jobPostingId is required");
      }

      const candidates = await db
        .select()
        .from(UserTable)
        .where(inArray(UserTable.email, emails));

      const results: any[] = [];

      for (const candidate of candidates) {
        const createdAt = new Date().toISOString();
        const status = "new";

        // Inserting the Job Application
        const [createdJobApplication]: any = await db
          .insert(JobApplicationTable)
          .values({
            userId: candidate.id,
            jobPostingId,
            status,
            createdAt,
          })
          .returning({
            id: JobApplicationTable.id,
            userId: JobApplicationTable.userId,
            jobPostingId: JobApplicationTable.jobPostingId,
            status: JobApplicationTable.status,
          });

        results.push(createdJobApplication);
      }

      // Send response with results
      return res
        .status(201)
        .json(
          new ApiResponse(
            201,
            results,
            `${results.length} Bulk Job Applications processed`,
          ),
        );
    } catch (error) {
      sendError(res, error);
    }
  },
);

export const assignBulkCandidateEvaluationRemarks = asyncHandler(
  async (req: Request, res: Response) => {
    const { evaluationData } = req.body;

    try {
      if (!evaluationData || !evaluationData.length) {
        throw new ApiError(400, "Evaluation data is required");
      }

      // Fetch all candidate records based on provided emails
      const emails = evaluationData.map((data: any) => data.email);
      const candidates = await db
        .select()
        .from(UserTable)
        .where(inArray(UserTable.email, emails));

      if (!candidates.length) {
        throw new ApiError(404, "No matching candidates found");
      }

      const results: any[] = [];

      for (const data of evaluationData) {
        const candidate = candidates.find(
          (candidate) => candidate.email === data.email,
        );

        if (!candidate) continue;

        const {
          salesAndMarketingRemarks,
          HRAndFinanceRemarks,
          professionalismRemarks,
          generalRemarks,
        } = data;

        const userId = candidate.id;

        // Checking if candidate evaluation remarks already exist
        const existingCandidateEvaluationRemarks: CandidateEvaluationRemarks[] =
          await db
            .select()
            .from(candidateEvaluationRemarksTable)
            .where(eq(candidateEvaluationRemarksTable.userId, userId));

        if (!existingCandidateEvaluationRemarks.length) {
          // If no record exists, create a new one
          const createdAt = new Date().toISOString();
          await db.insert(candidateEvaluationRemarksTable).values({
            userId,
            evaluationStatus: "Pending",
            createdAt,
          });
        }

        // Updating candidate evaluation remarks
        const updatedAt = new Date().toISOString();
        const updatedCandidateEvaluationRemarks: any = await db
          .update(candidateEvaluationRemarksTable)
          .set({
            salesAndMarketingRemarks,
            HRAndFinanceRemarks,
            professionalismRemarks,
            generalRemarks,
            updatedAt,
          })
          .where(eq(candidateEvaluationRemarksTable.userId, userId))
          .returning({
            id: candidateEvaluationRemarksTable.id,
            userId: candidateEvaluationRemarksTable.userId,
            salesAndMarketingRemarks:
              candidateEvaluationRemarksTable.salesAndMarketingRemarks,
            HRAndFinanceRemarks:
              candidateEvaluationRemarksTable.HRAndFinanceRemarks,
            professionalismRemarks:
              candidateEvaluationRemarksTable.professionalismRemarks,
            generalRemarks: candidateEvaluationRemarksTable.generalRemarks,
          });

        if (updatedCandidateEvaluationRemarks.length > 0) {
          // Calculate total marks and evaluation status if all marks are provided
          const allRemarksProvided =
            updatedCandidateEvaluationRemarks[0]?.salesAndMarketingRemarks !==
              null &&
            updatedCandidateEvaluationRemarks[0]?.HRAndFinanceRemarks !==
              null &&
            updatedCandidateEvaluationRemarks[0]?.professionalismRemarks !==
              null &&
            updatedCandidateEvaluationRemarks[0]?.generalRemarks !== null;

          const totalMarks =
            (updatedCandidateEvaluationRemarks[0]?.salesAndMarketingRemarks ??
              0) +
            (updatedCandidateEvaluationRemarks[0]?.HRAndFinanceRemarks ?? 0) +
            (updatedCandidateEvaluationRemarks[0]?.professionalismRemarks ??
              0) +
            (updatedCandidateEvaluationRemarks[0]?.generalRemarks ?? 0);

          const percentage = (totalMarks / 20) * 100;
          const evaluationStatus = percentage >= 60 ? "Passed" : "Failed";

          // Update evaluation status based on remarks
          const updatedCandidateEvaluationStatus = await db
            .update(candidateEvaluationRemarksTable)
            .set({
              evaluationStatus: !allRemarksProvided
                ? "Pending"
                : evaluationStatus,
            })
            .where(eq(candidateEvaluationRemarksTable.userId, userId))
            .returning({
              id: candidateEvaluationRemarksTable.id,
              userId: candidateEvaluationRemarksTable.userId,
              salesAndMarketingRemarks:
                candidateEvaluationRemarksTable.salesAndMarketingRemarks,
              HRAndFinanceRemarks:
                candidateEvaluationRemarksTable.HRAndFinanceRemarks,
              professionalismRemarks:
                candidateEvaluationRemarksTable.professionalismRemarks,
              generalRemarks: candidateEvaluationRemarksTable.generalRemarks,
              evaluationStatus:
                candidateEvaluationRemarksTable.evaluationStatus,
            });

          results.push(updatedCandidateEvaluationStatus);
        }
      }

      return res
        .status(200)
        .json(
          new ApiResponse(
            200,
            results,
            "Bulk candidate evaluation remarks assigned successfully",
          ),
        );
    } catch (error) {
      sendError(res, error);
    }
  },
);

export const sendBulkEmailToCandidatesOfRecruitmentDrive = asyncHandler(
  async (req: Request, res: Response) => {
    const token = req.header("Authorization")?.replace("Bearer ", "");
    const { recruitmentDriveId } = req.params as {
      recruitmentDriveId: string;
    };
    const { trainingTime, trainingDate, trainingDuration } = req.body;

    try {
      if (!token) {
        throw new ApiError(401, "Unauthorized Request");
      }
      const userId = getUserId(token);
      if (!userId) {
        throw new ApiError(401, "Invalid access token");
      }

      const missingFields = [];
      if (!recruitmentDriveId) missingFields.push("recruitmentDriveId");
      if (!trainingTime) missingFields.push("trainingTime");
      if (!trainingDate) missingFields.push("trainingDate");
      if (!trainingDuration) missingFields.push("trainingDuration");

      if (missingFields.length > 0) {
        throw new ApiError(
          400,
          `Following fields are required: ${missingFields.join(", ")}`,
        );
      }

      const passedCandidates: any = await db
        .select({
          id: UserTable.id,
          recruitmentDriveId: UserTable.recruitmentDriveId,
          email: UserTable.email,
          firstName: UserTable.firstName,
          lastName: UserTable.lastName,
          evaluationStatus: candidateEvaluationRemarksTable.evaluationStatus,
        })
        .from(candidateEvaluationRemarksTable)
        .leftJoin(
          UserTable,
          eq(candidateEvaluationRemarksTable.userId, UserTable.id),
        )
        .where(
          and(
            eq(candidateEvaluationRemarksTable.evaluationStatus, "Passed"),
            eq(UserTable.recruitmentDriveId, recruitmentDriveId),
          ),
        );

      if (passedCandidates[0].evaluationStatus !== "Passed") {
        return res
          .status(200)
          .json(
            new ApiResponse(
              200,
              null,
              "No candidates with Passed status found",
            ),
          );
      }

      const updatedAt = new Date().toISOString();

      const updatedCandidates: CandidateRecruitmentDriveWithAudit[] = [];
      for (const candidate of passedCandidates) {
        const updatedCandidate = await db
          .update(CandidateRecruitmentDriveTable)
          .set({
            trainingTime,
            trainingDate,
            trainingDuration,
            isEmailSent: true,
            updatedAt,
            updatedBy: userId,
          })
          .where(
            eq(CandidateRecruitmentDriveTable.id, candidate.recruitmentDriveId),
          )
          .returning({
            id: CandidateRecruitmentDriveTable.id,
            name: CandidateRecruitmentDriveTable.name,
            startDate: CandidateRecruitmentDriveTable.startDate,
            endDate: CandidateRecruitmentDriveTable.endDate,
            trainingTime: CandidateRecruitmentDriveTable.trainingTime,
            trainingDate: CandidateRecruitmentDriveTable.trainingDate,
            trainingDuration: CandidateRecruitmentDriveTable.trainingDuration,
            trainingLocation: CandidateRecruitmentDriveTable.trainingLocation,
            isEmailSent: CandidateRecruitmentDriveTable.isEmailSent,
            isActive: CandidateRecruitmentDriveTable.isActive,
          });

        if (updatedCandidate.length > 0) {
          updatedCandidates.push(
            updatedCandidate[0] as CandidateRecruitmentDriveWithAudit,
          );
        }
      }

      if (!updatedCandidates.length) {
        throw new ApiError(
          500,
          "Failed to send email to candidates of recruitment drive",
        );
      }

      for (const candidate of passedCandidates) {
        const fullName = `${candidate.firstName} ${candidate.lastName}`;

        const mailOptions = {
          from: `"Islamic Savings Center" <${process.env.MAIL_USERNAME_HR}>`,
          to: candidate.email,
          subject: "Job Training Details - Islamic Savings Center",
          templateName: "recruitment-drive-training-online.html",
          data: {
            fullName,
            trainingTime,
            trainingDate: new Date(trainingDate)
              .toLocaleDateString("en-GB")
              .split("T")[0],
            trainingDuration,
          },
        };

        if (process.env.NODE_ENV === "production") {
          await sendMail_HR(mailOptions);
        } else {
          await sendMail_TESTING(mailOptions);
        }
      }

      return res
        .status(200)
        .json(
          new ApiResponse(
            200,
            updatedCandidates,
            `Emails sent successfully to ${updatedCandidates.length} passed candidates`,
          ),
        );
    } catch (error) {
      sendError(res, error);
    }
  },
);
