import { numeric } from "drizzle-orm/pg-core";
import {
  boolean,
  integer,
  pgTable,
  text,
  timestamp,
  uuid,
  varchar,
  json,
} from "drizzle-orm/pg-core";

// ========================================================================
// ============================= AUDIT FIELDS =============================

const auditFields_i = {
  createdAt: timestamp("createdAt", {
    mode: "string",
    withTimezone: true,
  }),
  updatedAt: timestamp("updatedAt", {
    mode: "string",
    withTimezone: true,
  }),
};

const auditFields_ii = {
  createdBy: uuid("createdBy").references(() => UserTable.id),
  updatedBy: uuid("updatedBy").references(() => UserTable.id),
  deletedBy: uuid("deletedBy").references(() => UserTable.id),
};

const auditFields_iii = {
  isDeleted: boolean("isDeleted").notNull().default(false),
  ...auditFields_i,
  deletedAt: timestamp("deletedAt", {
    mode: "string",
    withTimezone: true,
  }),
};

const auditFields_iv = {
  isDeleted: boolean("isDeleted").notNull().default(false),
  ...auditFields_i,
  deletedAt: timestamp("deletedAt", {
    mode: "string",
    withTimezone: true,
  }),
  ...auditFields_ii,
};

const auditFields_v = {
  createdAt: timestamp("createdAt", {
    mode: "string",
    withTimezone: true,
  }),
  isDeleted: boolean("isDeleted").notNull().default(false),
  deletedAt: timestamp("deletedAt", {
    mode: "string",
    withTimezone: true,
  }),
};

// ========================================================================
// ========================== ALL UPLOADED FILES ==========================

export const AllFilesTable = pgTable("all_files", {
  id: uuid("id").primaryKey().defaultRandom(),
  url: varchar("url", { length: 255 }).notNull(),
  name: varchar("name", { length: 255 }).notNull(),
  type: varchar("type", { length: 255 }).notNull(),
  size: integer("size").notNull(),
  cloudinaryPublicId: varchar("cloudinaryPublicId", { length: 255 }),
  ...auditFields_v,
});

// ========================================================================
// ========================== MEETING =====================================

export const MeetingTable = pgTable("meeting", {
  id: uuid("id").primaryKey().defaultRandom(),
  date: timestamp("date", { mode: "string", withTimezone: true }).notNull(),
  title: varchar("title", { length: 255 }).notNull(),
  description: text("description"),
  status: varchar("status", { length: 255 }).notNull(),
  notes: text("notes"),
  ...auditFields_iv,
});

// =============================================================================
// ====================== GOOGLE OAUTH SESSION =================================

export const SessionTable = pgTable("session", {
  sid: varchar("sid", { length: 255 }).primaryKey(),
  sess: json("sess"),
  expire: timestamp("expire", { mode: "string", withTimezone: true }),
});

// ===========================================================================
// ================================ USER ROLE ================================

export const UserRoleTable = pgTable("user_role", {
  id: uuid("id").primaryKey().defaultRandom(),
  role: varchar("role", { length: 255 }).notNull(),
  publicId: varchar("publicId", { length: 4 }).unique(),
});

// ======================================================================
// ================================ USER ================================

export const UserTable: any = pgTable("user", {
  id: uuid("id").primaryKey().defaultRandom(),
  roleId: uuid("roleId").references(() => UserRoleTable.id),
  recruitmentDriveId: uuid("recruitmentDriveId").references(
    () => CandidateRecruitmentDriveTable.id,
  ),
  email: varchar("email", { length: 100 }).notNull().unique(),
  username: varchar("username", { length: 18 }),
  password: varchar("password", { length: 64 }),
  firstName: varchar("firstName", { length: 20 }).notNull(),
  middleName: varchar("middleName", { length: 20 }),
  lastName: varchar("lastName", { length: 20 }),
  gender: varchar("gender", { length: 255 }),
  dateOfBirth: varchar("dateOfBirth", { length: 255 }),
  mobileNumber: varchar("mobileNumber", { length: 20 }),
  nationality: varchar("nationality", { length: 255 }),
  identificationType: varchar("identificationType", {
    length: 255,
  }),
  identificationNumber: varchar("identificationNumber", {
    length: 255,
  }),
  address: varchar("address", { length: 255 }),
  location: varchar("location", { length: 255 }),
  avatarId: uuid("avatarId").references(() => AllFilesTable.id),
  meetingId: uuid("meetingId").references(() => MeetingTable.id),
  isVerified: boolean("isVerified").notNull().default(false),
  isActive: boolean("isActive").notNull().default(true),
  isLocked: boolean("isLocked").notNull().default(false),
  lastLogin: timestamp("lastLogin", { mode: "string", withTimezone: true }),
  lockedAt: timestamp("lockedAt", { mode: "string", withTimezone: true }),
  resetToken: varchar("resetToken", { length: 64 }),
  verificationToken: varchar("verificationToken", { length: 64 }),
  passwordResetToken: varchar("passwordResetToken", { length: 64 }),
  tokenExpiresAt: varchar("tokenExpiresAt", { length: 64 }),
  createdBy: varchar("createdBy", { length: 255 }),
  ...auditFields_iii,
});

// // ==================================================================================
// // ================================ USER PERMISSIONS ================================

// export const UserPermissionsJobPosting = pgTable(
//   "user_permissions_job_posting",
//   {
//     id: uuid("id").primaryKey().defaultRandom(),
//     userId: uuid("userId")
//       .notNull()
//       .references(() => UserTable.id),
//     canCreateJobPosting: boolean("canCreateJobPosting")
//       .notNull()
//       .default(false),
//     canEditJobPosting: boolean("canEditJobPosting").notNull().default(false),
//     canViewJobPosting: boolean("canViewJobPosting").notNull().default(false),
//     canDeleteJobPosting: boolean("canDeleteJobPosting")
//       .notNull()
//       .default(false),
//     canPublishJobPosting: boolean("canPublishJobPosting")
//       .notNull()
//       .default(false),
//     canCloseJobPosting: boolean("canCloseJobPosting").notNull().default(false),
//     canViewApplication: boolean("canViewApplication").notNull().default(false),
//     canManageApplication: boolean("canManageApplication")
//       .notNull()
//       .default(false),
//     canDownloadResume: boolean("canDownloadResume").notNull().default(false),
//     canViewJobAnalytics: boolean("canViewJobAnalytics")
//       .notNull()
//       .default(false),
//   },
// );

// export const UserPermissionsQuiz = pgTable("user_permissions_quiz", {
//   id: uuid("id").primaryKey().defaultRandom(),
//   userId: uuid("userId")
//     .notNull()
//     .references(() => UserTable.id),
//   canCreateQuiz: boolean("canCreateQuiz").notNull().default(false),
//   canEditQuiz: boolean("canEditQuiz").notNull().default(false),
//   canDeleteQuiz: boolean("canDeleteQuiz").notNull().default(false),
//   canPublishQuiz: boolean("canPublishQuiz").notNull().default(false),
//   canUnPublishQuiz: boolean("canUnPublishQuiz").notNull().default(false),
//   canViewQuizResults: boolean("canViewQuizResults").notNull().default(false),
//   canDoQuizMarking: boolean("canDoQuizMarking").notNull().default(false),
// });

// ========================================================================
// ========================== CANDIDATE PROFILE ===========================

export const CandidatePersonalDetailTable = pgTable(
  "candidate_personal_detail",
  {
    id: uuid("id").primaryKey().defaultRandom(),
    userId: uuid("userId")
      .notNull()
      .references(() => UserTable.id),
    preferredJobLocation: varchar("preferredJobLocation", { length: 255 }),
    resumeOneId: uuid("resumeOneId").references(() => AllFilesTable.id),
    resumeTwoId: uuid("resumeTwoId").references(() => AllFilesTable.id),
    resumeThreeId: uuid("resumeThreeId").references(() => AllFilesTable.id),
    trainingMode: varchar("trainingMode", { length: 255 }),
    ...auditFields_iii,
  },
);

export const CandidateExperienceTable = pgTable("candidate_experience", {
  id: uuid("id").primaryKey().defaultRandom(),
  userId: uuid("userId")
    .notNull()
    .references(() => UserTable.id),
  companyName: varchar("companyName", { length: 255 }).notNull(),
  startDate: varchar("startDate", { length: 255 }).notNull(),
  endDate: varchar("endDate", { length: 255 }),
  position: varchar("position", { length: 255 }).notNull(),
  description: text("description"),
  ...auditFields_iii,
});

export const CandidateEducationTable = pgTable("candidate_education", {
  id: uuid("id").primaryKey().defaultRandom(),
  userId: uuid("userId")
    .notNull()
    .references(() => UserTable.id),
  degree: varchar("degree", { length: 255 }).notNull(),
  marksOrGpaObtained: varchar("marksOrGpaObtained", {
    length: 5,
  }).notNull(),
  outOf: varchar("outOf", { length: 5 }).notNull(),
  boardOrInstituteName: varchar("boardOrInstituteName", {
    length: 255,
  }).notNull(),
  gradeOrDivision: varchar("gradeOrDivision", { length: 255 }),
  description: text("description"),
  ...auditFields_iii,
});

export const CandidateSkillTable = pgTable("candidate_skill", {
  id: uuid("id").primaryKey().defaultRandom(),
  userId: uuid("userId")
    .notNull()
    .references(() => UserTable.id),
  skills: varchar("skills", { length: 255 }).array().notNull(), // Array of skills
  languages: varchar("languages", { length: 255 }).array().notNull(), // Array of languages
  ...auditFields_iii,
});

export const candidateEvaluationRemarksTable = pgTable(
  "candidate_evaluation_remarks",
  {
    id: uuid("id").primaryKey().defaultRandom(),
    userId: uuid("userId")
      .notNull()
      .references(() => UserTable.id),
    salesAndMarketingRemarks: integer("salesAndMarketingRemarks"),
    HRAndFinanceRemarks: integer("HRAndFinanceRemarks"),
    professionalismRemarks: integer("professionalismRemarks"),
    generalRemarks: integer("generalRemarks"),
    evaluationStatus: varchar("evaluationStatus", { length: 255 })
      .notNull()
      .default("Pending"),
    ...auditFields_iii,
  },
);

// ========================================================================
// ============================= JOB POSTINGS =============================

export const CompanyDepartmentTable = pgTable("company_department", {
  id: uuid("id").primaryKey().defaultRandom(),
  publicId: varchar("publicId", { length: 10 }).unique(),
  departmentName: varchar("departmentName", { length: 255 }).notNull(),
  ...auditFields_iii,
});

export const JobPostingTable: any = pgTable("job_posting", {
  id: uuid("id").primaryKey().defaultRandom(),
  departmentId: uuid("departmentId").references(
    () => CompanyDepartmentTable.id,
  ),
  title: varchar("title", { length: 255 }).notNull(),
  status: varchar("status", { length: 255 }).notNull(),
  isFullTime: boolean("isFullTime").notNull(),
  nature: varchar("nature", { length: 20 }).notNull(),
  numberOfVacancies: integer("numberOfVacancies").notNull(),
  yearsOfExperience: integer("yearsOfExperience"),
  salaryRange: varchar("salaryRange", { length: 255 }),
  publishDate: timestamp("publishDate", {
    mode: "string",
    withTimezone: true,
  }),
  dueDate: timestamp("dueDate", {
    mode: "string",
    withTimezone: true,
  }).notNull(),
  location: varchar("location", { length: 255 }).notNull(),
  intro: text("intro").notNull(),
  description: text("description").notNull(),
  quiz: uuid("quiz").references(() => QuizTable.id),
  ...auditFields_iv,
});

export const JobPostingCustomQuestionTable = pgTable(
  "job_posting_custom_question",
  {
    id: uuid("id").primaryKey().defaultRandom(),
    jobPostingId: uuid("jobPostingId")
      .notNull()
      .references(() => JobPostingTable.id),
    content: varchar("content", { length: 255 }).notNull(),
    isRequired: boolean("isRequired").notNull().default(false),
    ...auditFields_iv,
  },
);

// ============================================================================
// ============================= JOB APPLICATIONS =============================

export const JobApplicationTable = pgTable("job_application", {
  id: uuid("id").primaryKey().defaultRandom(),
  jobPostingId: uuid("jobPostingId")
    .notNull()
    .references(() => JobPostingTable.id),
  userId: uuid("userId")
    .notNull()
    .references(() => UserTable.id),
  status: varchar("status", { length: 255 }).notNull(),
  interviewDateAndTime: timestamp("interviewDateAndTime", {
    mode: "string",
    withTimezone: true,
  }),
  quizStartDateAndTime: timestamp("quizStartDateAndTime", {
    mode: "string",
    withTimezone: true,
  }),
  quizEndDateAndTime: timestamp("quizEndDateAndTime", {
    mode: "string",
    withTimezone: true,
  }),
  quizAttemptId: uuid("quizAttemptId").references(() => QuizAttemptTable.id),
  ...auditFields_iii,
});

export const JobPostingCustomQuestionAttemptTable = pgTable(
  "job_posting_custom_question_attempt",
  {
    id: uuid("id").primaryKey().defaultRandom(),
    jobApplicationId: uuid("jobApplicationId")
      .notNull()
      .references(() => JobApplicationTable.id),
    questionId: uuid("questionId")
      .notNull()
      .references(() => JobPostingCustomQuestionTable.id),
    answer: text("answer").notNull(),
    ...auditFields_iii,
  },
);

// =============================================================================
// ============================= RECRUITMENT DRIVE =============================

export const CandidateRecruitmentDriveTable = pgTable(
  "candidate_recruitment_drive",
  {
    id: uuid("id").primaryKey().defaultRandom(),
    name: varchar("name", { length: 255 }).notNull(),
    startDate: timestamp("startDate", {
      mode: "string",
      withTimezone: true,
    }).notNull(),
    endDate: timestamp("endDate", {
      mode: "string",
      withTimezone: true,
    }).notNull(),
    description: varchar("description", { length: 255 }),
    trainingTime: varchar("trainingTime", { length: 255 }),
    trainingDate: timestamp("trainingDate", {
      mode: "string",
      withTimezone: true,
    }),
    trainingDuration: varchar("trainingDuration", { length: 255 }),
    trainingLocation: varchar("trainingLocation", { length: 255 }),
    isEmailSent: boolean("isEmailSent").notNull().default(false),
    isActive: boolean("isActive").notNull().default(false),
    ...auditFields_iv,
  },
);

// ===================================================================
// ============================= QUIZZES =============================

export const QuizTable = pgTable("quiz", {
  id: uuid("id").primaryKey().defaultRandom(),
  title: varchar("title", { length: 1000 }).notNull(),
  timeDuration: integer("timeDuration").notNull(),
  instructions: text("instructions").notNull(),
  ...auditFields_iv,
});

export const McqTable = pgTable("mcq", {
  id: uuid("id").primaryKey().defaultRandom(),
  quizId: uuid("quizId")
    .notNull()
    .references(() => QuizTable.id),
  statement: varchar("statement", { length: 1000 }).notNull(),
  options: varchar("options", { length: 255 }).array().notNull(),
  correctOption: varchar("correctOption", { length: 255 }).notNull(),
  marks: integer("marks").notNull(),
  ...auditFields_iii,
});

export const FillInTheBlankTable = pgTable("fill_in_the_blank", {
  id: uuid("id").primaryKey().defaultRandom(),
  quizId: uuid("quizId")
    .notNull()
    .references(() => QuizTable.id),
  statement: varchar("statement", { length: 1000 }).notNull(),
  marks: integer("marks").notNull(),
  ...auditFields_iii,
});

export const OpenQuestionTable = pgTable("open_question", {
  id: uuid("id").primaryKey().defaultRandom(),
  quizId: uuid("quizId")
    .notNull()
    .references(() => QuizTable.id),
  statement: varchar("statement", { length: 1000 }).notNull(),
  marks: integer("marks").notNull(),
  ...auditFields_iii,
});

export const QuizAttemptTable = pgTable("quiz_attempt", {
  id: uuid("id").primaryKey().defaultRandom(),
  userId: uuid("userId")
    .notNull()
    .references(() => UserTable.id),
  quizId: uuid("quizId")
    .notNull()
    .references(() => QuizTable.id),
  isClosed: boolean("isClosed").notNull().default(false),
  ...auditFields_iii,
});

export const AttemptedAnswerTable = pgTable("attempted_answer", {
  id: uuid("id").primaryKey().defaultRandom(),
  quizAttemptId: uuid("quizAttemptId")
    .notNull()
    .references(() => QuizAttemptTable.id),
  mcqId: uuid("mcqId").references(() => McqTable.id),
  fillInTheBlankId: uuid("fillInTheBlankId").references(
    () => FillInTheBlankTable.id,
  ),
  openQuestionId: uuid("openQuestionId").references(() => OpenQuestionTable.id),
  answer: text("answer"),
  isCorrect: boolean("isCorrect"),
  ...auditFields_iii,
});

// ==================================================================================
// ============================= CUSTOMER ACCOUNTS ==================================

// Table for sequential or auto incremented values
export const MetadataTable = pgTable("metadata", {
  id: uuid("id").primaryKey().defaultRandom(),
  ISIPFolioNumber: varchar("isipFolioNumber", { length: 255 })
    .notNull()
    .unique(), // Default: ISIP1300-0
});

export const CustomerAccountsTable = pgTable("customer_accounts", {
  id: uuid("id").primaryKey().defaultRandom(),
  customerId: uuid("customerId")
    .notNull()
    .references(() => UserTable.id),
  accountStatus: varchar("accountStatus", { length: 255 })
    .notNull()
    .default("active"),
  accountNumber: varchar("accountNumber", { length: 255 }).notNull(),
  accountType: varchar("accountType", {
    length: 255,
  }).notNull(),
  accountSubTypes: varchar("accountSubTypes", { length: 255 })
    .array()
    .notNull(),
  currentBalance: numeric("currentBalance", { precision: 15, scale: 2 })
    .notNull()
    .default("0.00"),
  name: varchar("name", { length: 255 }).notNull(),
  dateOfBirth: varchar("dateOfBirth", { length: 255 }).notNull(),
  ...auditFields_iv,
});

export const CustomerPersonalInformationTable = pgTable(
  "customer_personal_information",
  {
    id: uuid("id").primaryKey().defaultRandom(),
    userId: uuid("userId").references(() => UserTable.id), // will be removed
    accountId: uuid("accountId")
      .notNull()
      .references(() => CustomerAccountsTable.id),
    fatherName: varchar("fatherName", { length: 255 }).notNull(),
    motherName: varchar("motherName", { length: 255 }).notNull(),
    placeOfBirth: varchar("placeOfBirth", { length: 255 }).notNull(),
    gender: varchar("gender", { length: 255 }).notNull(),
    resedentialStatus: varchar("resedentialStatus", { length: 255 }).notNull(),
    occupation: varchar("occupation", { length: 255 }).notNull(),
    dependency: varchar("dependency", { length: 255 }),
    holderOfAnyGovtOffice: boolean("holderOfAnyGovtOffice").notNull(),
    relationWithPolitician: boolean("relationWithPolitician").notNull(),
    permanentAddress: varchar("permanentAddress", { length: 255 }).notNull(),
    mailingAddress: varchar("mailingAddress", { length: 255 }).notNull(),
    nearestLandmark: varchar("nearestLandmark", { length: 255 }),
    notifyThrough: varchar("notifyThrough", { length: 255 }).array().notNull(),
    installmentDate: varchar("installmentDate", { length: 255 }), // will be removed
    zakatExemption: boolean("zakatExemption").notNull().default(false),
    ...auditFields_iv,
  },
);

export const CustomerVerificationOtpTable = pgTable(
  "customer_verification_otp",
  {
    id: uuid("id").primaryKey().defaultRandom(),
    userId: uuid("userId")
      .notNull()
      .references(() => UserTable.id),
    otp: varchar("otp", { length: 6 }).notNull(),
    otpExpiry: timestamp("otpExpiry", {
      mode: "string",
      withTimezone: true,
    }).notNull(),
    isVerified: boolean("isVerified").notNull().default(false),
  },
);

export const CustomerVerificationDataTable = pgTable(
  "customer_verification_data",
  {
    id: uuid("id").primaryKey().defaultRandom(),
    accountId: uuid("accountId").references(
      () => CustomerPersonalInformationTable.id,
    ),
    account_id: uuid("account_id")
      .notNull()
      .references(() => CustomerAccountsTable.id),
    identificationType: varchar("identificationType", {
      length: 50,
    }).notNull(),
    identificationNumber: varchar("identificationNumber", {
      length: 80,
    }).notNull(),
    identificationIssueDate: timestamp("identificationIssueDate", {
      mode: "string",
      withTimezone: true,
    }),
    identificationExpiryDate: timestamp("identificationExpiryDate", {
      mode: "string",
      withTimezone: true,
    }),
    identificationImageOneId: uuid("identificationImageOneId").references(
      () => AllFilesTable.id,
    ),
    identificationImageTwoId: uuid("identificationImageTwoId").references(
      () => AllFilesTable.id,
    ),
    country: varchar("country", { length: 50 }).notNull(),
    city: varchar("city", { length: 50 }).notNull(),
    mobileNetworkOperator: varchar("mobileNetworkOperator", {
      length: 50,
    }).notNull(),
    mobileNumber: varchar("mobileNumber", { length: 20 }).notNull(),
    ...auditFields_iv,
  },
);

export const CustomerNomineesTable = pgTable("customer_nominees", {
  id: uuid("id").primaryKey().defaultRandom(),
  accountId: uuid("accountId").references(
    () => CustomerPersonalInformationTable.id,
  ),
  account_id: uuid("account_id")
    .notNull()
    .references(() => CustomerAccountsTable.id),
  name: varchar("name", { length: 255 }).notNull(),
  relationship: varchar("relationship", { length: 255 }).notNull(),
  CNICOrFormBNumber: varchar("CNICOrFormBNumber", { length: 255 }).notNull(),
  ...auditFields_iv,
});

export const CustomerISIPAccountsTable = pgTable("customer_isip_accounts", {
  id: uuid("id").primaryKey().defaultRandom(),
  accountId: uuid("accountId").references(
    () => CustomerPersonalInformationTable.id,
  ), // will be removed
  account_id: uuid("account_id")
    .notNull()
    .references(() => CustomerAccountsTable.id),
  folioNumber: varchar("folioNumber", { length: 255 }), // will be removed
  valuesForCustomerAccountTypes: varchar("valuesForCustomerAccountTypes", {
    length: 255,
  }).array(), // will be removed
  valuesForCustomerAccountSubTypes: varchar(
    "valuesForCustomerAccountSubTypes",
    { length: 255 },
  ).array(), // will be removed
  applicantName: varchar("applicantName", { length: 255 }), // will be removed
  guardianName: varchar("guardianName", { length: 255 }),
  dateOfBirth: varchar("dateOfBirth", { length: 255 }), // will be removed
  futureGoal: varchar("futureGoal", { length: 255 }).array().notNull(),
  monthlyInvestmentAmount: varchar("monthlyInvestmentAmount", {
    length: 255,
  }).notNull(),
  durationOfInvestmentInYears: varchar("durationOfInvestmentInYears", {
    length: 255,
  }).notNull(),
  growthOrIncrementInInvestmentAmount: varchar(
    "growthOrIncrementInInvestmentAmount",
    { length: 255 },
  ),
  accountOpeningDate: timestamp("accountOpeningDate", {
    mode: "string",
    withTimezone: true,
  }).notNull(),
  installmentDate: integer("installmentDate"), // .notNull()
  averageAnnualRateOfReturn: varchar("averageAnnualRateOfReturn", {
    length: 255,
  }).notNull(),
  adjustedInflationOnPrincipalAmount: varchar(
    "adjustedInflationOnPrincipalAmount",
    { length: 255 },
  ),
  accumulatedInvestmentAmount: varchar("accumulatedInvestmentAmount", {
    length: 255,
  }).notNull(),
  grossAmountAtMaturity: varchar("grossAmountAtMaturity", {
    length: 255,
  }).notNull(),
  capitalGainTax: varchar("capitalGainTax", { length: 255 }).notNull(),
  managementFee: varchar("managementFee", { length: 255 }).notNull(),
  netAmountToBeWithdrawnOnMaturity: varchar(
    "netAmountToBeWithdrawnOnMaturity",
    { length: 255 },
  ).notNull(),
  isFiler: boolean("isFiler").notNull(),
  takafulCoverageCategory: varchar("takafulCoverageCategory", {
    length: 255,
  }),
  ...auditFields_iv,
});

export const CustomerRegularAccountsTable = pgTable(
  "customer_regular_accounts",
  {
    id: uuid("id").primaryKey().defaultRandom(),
    accountId: uuid("accountId")
      .notNull()
      .references(() => CustomerAccountsTable.id),
    guardianName: varchar("guardianName", { length: 255 }),
    initialInvestmentAmount: numeric("initialInvestmentAmount", {
      precision: 15,
      scale: 2, // Up to two decimal places
    }).notNull(),
    currentInvestmentAmount: numeric("currentInvestmentAmount", {
      precision: 15,
      scale: 2,
    }).notNull(),
    durationOfInvestment: varchar("durationOfInvestment", {
      length: 255,
    }).notNull(),
    investmentPlan: varchar("investmentPlan", { length: 255 })
      .notNull()
      .default("short term"), // open ended, short term, medium term, long term
    accountOpeningDate: timestamp("accountOpeningDate", {
      mode: "string",
      withTimezone: true,
    }).notNull(),
    realizationDate: timestamp("realizationDate", {
      mode: "string",
      withTimezone: true,
    }).notNull(),
    rateOfReturn: numeric("rateOfReturn", {
      precision: 10,
      scale: 2,
    }).notNull(),
    profitDistribution: varchar("profitDistribution", {
      length: 255,
    }).notNull(), // monthly | annually
    profitMode: varchar("profitMode", { length: 255 })
      .notNull()
      .default("simple"), // simple | compounded
    liquidity: varchar("liquidity", { length: 255 }).notNull(),
    noticePeriod: varchar("noticePeriod", { length: 255 }).notNull(),
    managementFee: varchar("managementFee", { length: 255 }).notNull(),
    loadAndCharges: numeric("loadAndCharges", { precision: 10, scale: 2 })
      .notNull()
      .default("0.00"),
    monthlyProfit: numeric("monthlyProfit", {
      precision: 15,
      scale: 2,
    }).notNull(),
    profitOnMaturity: numeric("profitOnMaturity", {
      precision: 15,
      scale: 2,
    }).notNull(),
    accountStatementFrequency: varchar("accountStatementFrequency", {
      length: 255,
    }).notNull(), // monthly | half yearly | annually | on request
    isFiler: boolean("isFiler").notNull().default(false),
    takafulCoverageCategory: varchar("takafulCoverageCategory", {
      length: 255,
    }),
    ...auditFields_iv,
  },
);

export const CustomerJointAccountsTable = pgTable("customer_joint_accounts", {
  id: uuid("id").primaryKey().defaultRandom(),
  accountId: uuid("accountId")
    .notNull()
    .references(() => CustomerAccountsTable.id),
  name: varchar("name", { length: 255 }).notNull(),
  fatherOrMotherName: varchar("fatherOrMotherName", {
    length: 255,
  }).notNull(),
  CNIC: varchar("cnic", { length: 255 }).notNull(),
  address: varchar("address", { length: 255 }).notNull(),
  relationWithAccountHolder: varchar("relationWithAccountHolder", {
    length: 255,
  }).notNull(),
  ...auditFields_iv,
});

export const CustomerBankInformationTable = pgTable(
  "customer_bank_information",
  {
    id: uuid("id").primaryKey().defaultRandom(),
    accountId: uuid("accountId").references(
      () => CustomerPersonalInformationTable.id,
    ), // will be removed
    account_id: uuid("account_id")
      .notNull()
      .references(() => CustomerAccountsTable.id),
    bankName: varchar("bankName", { length: 255 }).notNull(),
    branchCode: varchar("branchCode", { length: 255 }).notNull(),
    IBAN: varchar("IBAN", { length: 255 }).notNull(),
    accountType: varchar("accountType", { length: 255 }).notNull(),
    ...auditFields_iv,
  },
);

export const CustomerWithdrawalRequestsTable = pgTable(
  "customer_withdrawal_requests",
  {
    id: uuid("id").primaryKey().defaultRandom(),
    accountId: uuid("accountId")
      .notNull()
      .references(() => CustomerAccountsTable.id),
    requestStatus: varchar("requestStatus", { length: 255 })
      .notNull()
      .default("pending"), // pending | approved | rejected
    requestedAmount: numeric("requestedAmount", {
      precision: 15,
      scale: 2,
    }).notNull(),
    requestDate: timestamp("requestDate", {
      mode: "string",
      withTimezone: true,
    }).notNull(),
    withdrawalType: varchar("withdrawalType", { length: 255 }).notNull(), // profit withdrawal | redemption
    withdrawalReason: varchar("withdrawalReason", { length: 255 }),
    ...auditFields_iv,
  },
);

export const CustomerTransactionsTable = pgTable("customer_transactions", {
  id: uuid("id").primaryKey().defaultRandom(),
  accountId: uuid("accountId").references(
    () => CustomerPersonalInformationTable.id,
  ), // will be removed
  account_id: uuid("account_id")
    .notNull()
    .references(() => CustomerAccountsTable.id),
  transactionId: varchar("transactionId", { length: 255 }).unique(), // .notNull()
  status: varchar("status", { length: 255 }).notNull().default("pending"), // pending | processing | completed | failed
  type: varchar("type", { length: 255 }).notNull().default("credit"),
  purpose: varchar("purpose", { length: 255 }), //.notNull() // isip installment | investment | profit withdrawal | redemption
  amount: integer("amount").notNull(),
  date: timestamp("date", {
    mode: "string",
    withTimezone: true,
  }).notNull(),
  modeOfPayment: varchar("modeOfPayment", { length: 255 }).notNull(),
  referenceNumber: varchar("referenceNumber", { length: 255 }).notNull(),
  bankName: varchar("bankName", { length: 255 }),
  branchName: varchar("branchName", { length: 255 }),
  branchCode: varchar("branchCode", { length: 255 }),
  installmentMonth: varchar("installmentMonth", {
    length: 255,
  }),
  installmentPaidBy: varchar("installmentPaidBy", { length: 255 }),
  isTransactionOnly: boolean("isTransactionOnly").notNull().default(false),
  ...auditFields_iv,
});

// Table for saving Regular Accounts Profits history
export const CustomerProfitHistoryTable = pgTable("customer_profit_history", {
  id: uuid("id").primaryKey().defaultRandom(),
  accountId: uuid("accountId")
    .notNull()
    .references(() => CustomerAccountsTable.id),
  profitType: varchar("profitType", { length: 255 })
    .notNull()
    .default("credit"), // credit | reinvestment
  profitAmount: numeric("profitAmount", { precision: 15, scale: 2 }).notNull(),
  profitDate: timestamp("profitDate", {
    mode: "string",
    withTimezone: true,
  }).notNull(),
  withdrawalStatus: varchar("withdrawalStatus", { length: 255 })
    .notNull()
    .default("available"), // available | withdrawn | reinvested
});

// Table for ISIP Installments calculation
export const CustomerISIPInstallmentsTable = pgTable(
  "customer_isip_installments",
  {
    id: uuid("id").primaryKey().defaultRandom(),
    accountId: uuid("accountId")
      .notNull()
      .references(() => CustomerISIPAccountsTable.id),
    installmentAmount: integer("installmentAmount").notNull(),
    installmentDate: timestamp("installmentDate", {
      mode: "string",
      withTimezone: true,
    }).notNull(),
    installmentMonth: varchar("installmentMonth", { length: 255 }).notNull(),
    installmentPaidBy: varchar("installmentPaidBy", { length: 255 }),
    paymentStatus: varchar("paymentStatus", { length: 255 })
      .notNull()
      .default("pending"),
  },
);

// ==================================================================================
// ======================== CCS (Customer Care Support) =============================

export const CSRAccessLogsTable = pgTable("csr_access_logs", {
  id: uuid("id").primaryKey().defaultRandom(),
  csrId: uuid("csrId")
    .notNull()
    .references(() => UserTable.id), // CSR user
  customerAccountId: uuid("customerAccountId")
    .notNull()
    .references(() => CustomerAccountsTable.id), // Customer Account
  inquiryType: varchar("inquiryType", { length: 255 }).array().notNull(), // Type of inquiry
  accessedAt: timestamp("accessedAt", {
    mode: "string",
    withTimezone: true,
  }).notNull(),
  expiryAt: timestamp("expiryAt", {
    mode: "string",
    withTimezone: true,
  }).notNull(), // Time-restricted access
  ...auditFields_iv,
});

export const ComplaintsTable = pgTable("complaints", {
  id: uuid("id").primaryKey().defaultRandom(),
  accountId: uuid("accountId")
    .notNull()
    .references(() => CustomerAccountsTable.id), // Customer reference
  complaintId: varchar("complaintId", { length: 255 }).notNull().unique(),
  type: varchar("type", { length: 255 }).notNull(), // Transaction Issue, Document Delay, etc.
  summary: text("summary").notNull(),
  priority: varchar("priority", { length: 255 }).notNull(), // Low, Medium, High
  status: varchar("status", { length: 255 }).notNull().default("pending"),
  assignedDepartment: varchar("assignedDepartment", { length: 255 }), // Routed department
  customerFeedback: varchar("customerFeedback", { length: 255 }),
  ...auditFields_iv,
});

export const LeadsTable = pgTable("leads", {
  id: uuid("id").primaryKey().defaultRandom(),
  accountId: uuid("accountId")
    .notNull()
    .references(() => CustomerAccountsTable.id),
  name: varchar("name", { length: 255 }).notNull(),
  fatherOrHusbandName: varchar("fatherOrHusbandName", {
    length: 255,
  }),
  contactNumber: varchar("contactNumber", { length: 255 }).notNull(),
  address: text("address").notNull(),
  accountType: varchar("accountType", { length: 255 }),
  accountSubTypes: varchar("accountSubTypes", { length: 255 }).array(),
  occupation: varchar("occupation", { length: 255 }),
  source: varchar("source", { length: 255 }), // lead source like fb, website
  location: varchar("location", { length: 255 }),
  leadAssignedTo: varchar("leadAssignedTo", { length: 255 }), // lead assigned to employee's email
  status: varchar("status", { length: 255 }).notNull().default("pending"), // lead status pending , closed won or lost
  followUpNotes: text("followUpNotes"),
  ...auditFields_iv,
});
