-- -- DROP TABLE "user_permissions_job_posting";--> statement-breakpoint
-- -- DROP TABLE "user_permissions_quiz";--> statement-breakpoint
-- -- ALTER TABLE "candidate_evaluation_remarks" RENAME COLUMN "HRRemarks" TO "HRAndFinanceRemarks";--> statement-breakpoint
-- -- ALTER TABLE "candidate_evaluation_remarks" RENAME COLUMN "ITRemarks" TO "professionalismRemarks";--> statement-breakpoint
-- ALTER TABLE "all_files" ALTER COLUMN "createdAt" DROP NOT NULL;--> statement-breakpoint
-- ALTER TABLE "attempted_answer" ALTER COLUMN "createdAt" DROP NOT NULL;--> statement-breakpoint
-- ALTER TABLE "candidate_education" ALTER COLUMN "createdAt" DROP NOT NULL;--> statement-breakpoint
-- ALTER TABLE "candidate_experience" ALTER COLUMN "createdAt" DROP NOT NULL;--> statement-breakpoint
-- ALTER TABLE "candidate_personal_detail" ALTER COLUMN "createdAt" DROP NOT NULL;--> statement-breakpoint
-- ALTER TABLE "candidate_recruitment_drive" ALTER COLUMN "createdAt" DROP NOT NULL;--> statement-breakpoint
-- ALTER TABLE "candidate_recruitment_drive" ALTER COLUMN "createdBy" DROP NOT NULL;--> statement-breakpoint
-- ALTER TABLE "candidate_skill" ALTER COLUMN "createdAt" DROP NOT NULL;--> statement-breakpoint
-- ALTER TABLE "company_department" ALTER COLUMN "createdAt" DROP NOT NULL;--> statement-breakpoint
-- ALTER TABLE "customer_bank_information" ALTER COLUMN "createdAt" DROP NOT NULL;--> statement-breakpoint
-- ALTER TABLE "customer_isip_calculator" ALTER COLUMN "createdAt" DROP NOT NULL;--> statement-breakpoint
-- ALTER TABLE "customer_nominee" ALTER COLUMN "name" DROP NOT NULL;--> statement-breakpoint
-- ALTER TABLE "customer_nominee" ALTER COLUMN "relationship" DROP NOT NULL;--> statement-breakpoint
-- ALTER TABLE "customer_nominee" ALTER COLUMN "CNICOrFormBNumber" DROP NOT NULL;--> statement-breakpoint
-- ALTER TABLE "customer_nominee" ALTER COLUMN "createdAt" DROP NOT NULL;--> statement-breakpoint
-- ALTER TABLE "customer_payment_details" ALTER COLUMN "createdAt" DROP NOT NULL;--> statement-breakpoint
-- ALTER TABLE "customer_personal_information" ALTER COLUMN "dependency" DROP NOT NULL;--> statement-breakpoint
-- ALTER TABLE "customer_personal_information" ALTER COLUMN "nearestLandmark" DROP NOT NULL;--> statement-breakpoint
-- -- ALTER TABLE "customer_personal_information" ALTER COLUMN "notifyThrough" SET DATA TYPE varchar(255)[] USING string_to_array("notifyThrough", ',');--> statement-breakpoint
-- ALTER TABLE "customer_personal_information" ALTER COLUMN "createdAt" DROP NOT NULL;--> statement-breakpoint
-- ALTER TABLE "customer_verification_data" ALTER COLUMN "identificationImageOneId" DROP NOT NULL;--> statement-breakpoint
-- ALTER TABLE "customer_verification_data" ALTER COLUMN "createdAt" DROP NOT NULL;--> statement-breakpoint
-- ALTER TABLE "customer_verification_otp" ALTER COLUMN "createdAt" DROP NOT NULL;--> statement-breakpoint
-- ALTER TABLE "fill_in_the_blank" ALTER COLUMN "createdAt" DROP NOT NULL;--> statement-breakpoint
-- ALTER TABLE "job_application" ALTER COLUMN "createdAt" DROP NOT NULL;--> statement-breakpoint
-- ALTER TABLE "job_posting_custom_question_attempt" ALTER COLUMN "createdAt" DROP NOT NULL;--> statement-breakpoint
-- ALTER TABLE "job_posting_custom_question" ALTER COLUMN "createdAt" DROP NOT NULL;--> statement-breakpoint
-- ALTER TABLE "job_posting_custom_question" ALTER COLUMN "createdBy" DROP NOT NULL;--> statement-breakpoint
-- ALTER TABLE "job_posting" ALTER COLUMN "createdAt" DROP NOT NULL;--> statement-breakpoint
-- ALTER TABLE "job_posting" ALTER COLUMN "createdBy" DROP NOT NULL;--> statement-breakpoint
-- ALTER TABLE "mcq" ALTER COLUMN "createdAt" DROP NOT NULL;--> statement-breakpoint
-- ALTER TABLE "meeting" ALTER COLUMN "createdAt" DROP NOT NULL;--> statement-breakpoint
-- ALTER TABLE "meeting" ALTER COLUMN "createdBy" DROP NOT NULL;--> statement-breakpoint
-- ALTER TABLE "open_question" ALTER COLUMN "createdAt" DROP NOT NULL;--> statement-breakpoint
-- ALTER TABLE "quiz_attempt" ALTER COLUMN "createdAt" DROP NOT NULL;--> statement-breakpoint
-- ALTER TABLE "quiz" ALTER COLUMN "createdAt" DROP NOT NULL;--> statement-breakpoint
-- ALTER TABLE "quiz" ALTER COLUMN "createdBy" DROP NOT NULL;--> statement-breakpoint
-- ALTER TABLE "user" ALTER COLUMN "createdAt" DROP NOT NULL;--> statement-breakpoint
-- ALTER TABLE "candidate_evaluation_remarks" ALTER COLUMN "salesAndMarketingRemarks" TYPE integer USING "salesAndMarketingRemarks"::integer;--> statement-breakpoint
-- ALTER TABLE "candidate_evaluation_remarks" ALTER COLUMN "HRAndFinanceRemarks" TYPE integer USING "HRAndFinanceRemarks"::integer;--> statement-breakpoint
-- ALTER TABLE "candidate_evaluation_remarks" ALTER COLUMN "professionalismRemarks" TYPE integer USING "professionalismRemarks"::integer;--> statement-breakpoint
-- ALTER TABLE "candidate_evaluation_remarks" ALTER COLUMN "generalRemarks" TYPE integer USING "generalRemarks"::integer;--> statement-breakpoint
-- ALTER TABLE "candidate_evaluation_remarks" ALTER COLUMN "createdAt" DROP NOT NULL;--> statement-breakpoint
-- -- ALTER TABLE "candidate_personal_detail" ADD COLUMN "trainingMode" varchar(255);--> statement-breakpoint
-- -- ALTER TABLE "candidate_recruitment_drive" ADD COLUMN "trainingTime" varchar(255);--> statement-breakpoint
-- -- ALTER TABLE "candidate_recruitment_drive" ADD COLUMN "trainingDate" varchar(255);--> statement-breakpoint
-- -- ALTER TABLE "candidate_recruitment_drive" ADD COLUMN "trainingDuration" varchar(255);--> statement-breakpoint
-- -- ALTER TABLE "candidate_recruitment_drive" ADD COLUMN "trainingLocation" varchar(255);--> statement-breakpoint
-- -- ALTER TABLE "candidate_recruitment_drive" ADD COLUMN "isEmailSent" boolean DEFAULT false NOT NULL;--> statement-breakpoint
-- -- ALTER TABLE "customer_isip_calculator" ADD COLUMN "folioNumber" varchar(255) NOT NULL;--> statement-breakpoint
-- ALTER TABLE "customer_payment_details" ADD COLUMN "transactionAmount" integer NOT NULL DEFAULT 0;--> statement-breakpoint
-- -- ALTER TABLE "customer_payment_details" ADD COLUMN "transactionDate" timestamp with time zone NOT NULL DEFAULT CURRENT_TIMESTAMP;--> statement-breakpoint
-- -- ALTER TABLE "customer_payment_details" ADD COLUMN "installmentForMonth" varchar(255) NOT NULL DEFAULT 'default_value';--> statement-breakpoint
-- -- ALTER TABLE "customer_personal_information" ADD COLUMN "installmentDate" varchar(255) NOT NULL;--> statement-breakpoint
-- -- ALTER TABLE "candidate_evaluation_remarks" ADD COLUMN "evaluationStatus" varchar(255) NOT NULL;
-- =========================================================================================================================================================
-- DROP TABLE "user_permissions_job_posting";--> statement-breakpoint
-- DROP TABLE "user_permissions_quiz";--> statement-breakpoint
ALTER TABLE "candidate_evaluation_remarks" RENAME COLUMN "HRRemarks" TO "HRAndFinanceRemarks";--> statement-breakpoint
ALTER TABLE "candidate_evaluation_remarks" RENAME COLUMN "ITRemarks" TO "professionalismRemarks";--> statement-breakpoint
ALTER TABLE "all_files" ALTER COLUMN "createdAt" DROP NOT NULL;--> statement-breakpoint
ALTER TABLE "attempted_answer" ALTER COLUMN "createdAt" DROP NOT NULL;--> statement-breakpoint
ALTER TABLE "candidate_education" ALTER COLUMN "createdAt" DROP NOT NULL;--> statement-breakpoint
ALTER TABLE "candidate_experience" ALTER COLUMN "createdAt" DROP NOT NULL;--> statement-breakpoint
ALTER TABLE "candidate_personal_detail" ALTER COLUMN "createdAt" DROP NOT NULL;--> statement-breakpoint
ALTER TABLE "candidate_recruitment_drive" ALTER COLUMN "createdAt" DROP NOT NULL;--> statement-breakpoint
ALTER TABLE "candidate_recruitment_drive" ALTER COLUMN "createdBy" DROP NOT NULL;--> statement-breakpoint
ALTER TABLE "candidate_skill" ALTER COLUMN "createdAt" DROP NOT NULL;--> statement-breakpoint
ALTER TABLE "company_department" ALTER COLUMN "createdAt" DROP NOT NULL;--> statement-breakpoint
ALTER TABLE "customer_bank_information" ALTER COLUMN "createdAt" DROP NOT NULL;--> statement-breakpoint
ALTER TABLE "customer_isip_calculator" ALTER COLUMN "createdAt" DROP NOT NULL;--> statement-breakpoint
ALTER TABLE "customer_nominee" ALTER COLUMN "name" DROP NOT NULL;--> statement-breakpoint
ALTER TABLE "customer_nominee" ALTER COLUMN "relationship" DROP NOT NULL;--> statement-breakpoint
ALTER TABLE "customer_nominee" ALTER COLUMN "CNICOrFormBNumber" DROP NOT NULL;--> statement-breakpoint
ALTER TABLE "customer_nominee" ALTER COLUMN "createdAt" DROP NOT NULL;--> statement-breakpoint
ALTER TABLE "customer_payment_details" ALTER COLUMN "createdAt" DROP NOT NULL;--> statement-breakpoint
ALTER TABLE "customer_personal_information" ALTER COLUMN "dependency" DROP NOT NULL;--> statement-breakpoint
ALTER TABLE "customer_personal_information" ALTER COLUMN "nearestLandmark" DROP NOT NULL;--> statement-breakpoint
-- ALTER TABLE "customer_personal_information" ALTER COLUMN "notifyThrough" SET DATA TYPE varchar(255)[] USING string_to_array("notifyThrough", ',');--> statement-breakpoint
ALTER TABLE "customer_personal_information" ALTER COLUMN "createdAt" DROP NOT NULL;--> statement-breakpoint
ALTER TABLE "customer_verification_data" ALTER COLUMN "identificationImageOneId" DROP NOT NULL;--> statement-breakpoint
ALTER TABLE "customer_verification_data" ALTER COLUMN "createdAt" DROP NOT NULL;--> statement-breakpoint
ALTER TABLE "customer_verification_otp" ALTER COLUMN "createdAt" DROP NOT NULL;--> statement-breakpoint
ALTER TABLE "fill_in_the_blank" ALTER COLUMN "createdAt" DROP NOT NULL;--> statement-breakpoint
ALTER TABLE "job_application" ALTER COLUMN "createdAt" DROP NOT NULL;--> statement-breakpoint
ALTER TABLE "job_posting_custom_question_attempt" ALTER COLUMN "createdAt" DROP NOT NULL;--> statement-breakpoint
ALTER TABLE "job_posting_custom_question" ALTER COLUMN "createdAt" DROP NOT NULL;--> statement-breakpoint
ALTER TABLE "job_posting_custom_question" ALTER COLUMN "createdBy" DROP NOT NULL;--> statement-breakpoint
ALTER TABLE "job_posting" ALTER COLUMN "createdAt" DROP NOT NULL;--> statement-breakpoint
ALTER TABLE "job_posting" ALTER COLUMN "createdBy" DROP NOT NULL;--> statement-breakpoint
ALTER TABLE "mcq" ALTER COLUMN "createdAt" DROP NOT NULL;--> statement-breakpoint
ALTER TABLE "meeting" ALTER COLUMN "createdAt" DROP NOT NULL;--> statement-breakpoint
ALTER TABLE "meeting" ALTER COLUMN "createdBy" DROP NOT NULL;--> statement-breakpoint
ALTER TABLE "open_question" ALTER COLUMN "createdAt" DROP NOT NULL;--> statement-breakpoint
ALTER TABLE "quiz_attempt" ALTER COLUMN "createdAt" DROP NOT NULL;--> statement-breakpoint
ALTER TABLE "quiz" ALTER COLUMN "createdAt" DROP NOT NULL;--> statement-breakpoint
ALTER TABLE "quiz" ALTER COLUMN "createdBy" DROP NOT NULL;--> statement-breakpoint
ALTER TABLE "user" ALTER COLUMN "createdAt" DROP NOT NULL;--> statement-breakpoint
ALTER TABLE "candidate_evaluation_remarks" ALTER COLUMN "salesAndMarketingRemarks" TYPE integer USING "salesAndMarketingRemarks"::integer;--> statement-breakpoint
ALTER TABLE "candidate_evaluation_remarks" ALTER COLUMN "HRAndFinanceRemarks" TYPE integer USING "HRAndFinanceRemarks"::integer;--> statement-breakpoint
ALTER TABLE "candidate_evaluation_remarks" ALTER COLUMN "professionalismRemarks" TYPE integer USING "professionalismRemarks"::integer;--> statement-breakpoint
ALTER TABLE "candidate_evaluation_remarks" ALTER COLUMN "generalRemarks" TYPE integer USING "generalRemarks"::integer;--> statement-breakpoint
ALTER TABLE "candidate_evaluation_remarks" ALTER COLUMN "createdAt" DROP NOT NULL;--> statement-breakpoint
ALTER TABLE "candidate_personal_detail" ADD COLUMN "trainingMode" varchar(255);--> statement-breakpoint
ALTER TABLE "candidate_recruitment_drive" ADD COLUMN "trainingTime" varchar(255);--> statement-breakpoint
ALTER TABLE "candidate_recruitment_drive" ADD COLUMN "trainingDate" varchar(255);--> statement-breakpoint
ALTER TABLE "candidate_recruitment_drive" ADD COLUMN "trainingDuration" varchar(255);--> statement-breakpoint
ALTER TABLE "candidate_recruitment_drive" ADD COLUMN "trainingLocation" varchar(255);--> statement-breakpoint
ALTER TABLE "candidate_recruitment_drive" ADD COLUMN "isEmailSent" boolean DEFAULT false NOT NULL;--> statement-breakpoint
ALTER TABLE "customer_isip_calculator" ADD COLUMN "folioNumber" varchar(255) NOT NULL;--> statement-breakpoint
ALTER TABLE "customer_payment_details" ADD COLUMN "transactionAmount" integer NOT NULL DEFAULT 0;--> statement-breakpoint
ALTER TABLE "customer_payment_details" ADD COLUMN "transactionDate" timestamp with time zone NOT NULL DEFAULT CURRENT_TIMESTAMP;--> statement-breakpoint
ALTER TABLE "customer_payment_details" ADD COLUMN "installmentForMonth" varchar(255) NOT NULL DEFAULT 'default_value';--> statement-breakpoint
ALTER TABLE "customer_personal_information" ADD COLUMN "installmentDate" varchar(255) NOT NULL;--> statement-breakpoint
ALTER TABLE "candidate_evaluation_remarks" ADD COLUMN "evaluationStatus" varchar(255) NOT NULL;