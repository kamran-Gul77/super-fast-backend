CREATE TABLE IF NOT EXISTS "all_files" (
	"id" uuid PRIMARY KEY DEFAULT gen_random_uuid() NOT NULL,
	"url" varchar(255) NOT NULL,
	"name" varchar(255) NOT NULL,
	"type" varchar(255) NOT NULL,
	"size" integer NOT NULL,
	"cloudinaryPublicId" varchar(255),
	"createdAt" timestamp with time zone NOT NULL,
	"isDeleted" boolean DEFAULT false NOT NULL,
	"deletedAt" timestamp with time zone
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "attempted_answer" (
	"id" uuid PRIMARY KEY DEFAULT gen_random_uuid() NOT NULL,
	"quizAttemptId" uuid NOT NULL,
	"mcqId" uuid,
	"fillInTheBlankId" uuid,
	"openQuestionId" uuid,
	"answer" text,
	"isCorrect" boolean,
	"isDeleted" boolean DEFAULT false NOT NULL,
	"createdAt" timestamp with time zone NOT NULL,
	"updatedAt" timestamp with time zone,
	"deletedAt" timestamp with time zone
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "candidate_education" (
	"id" uuid PRIMARY KEY DEFAULT gen_random_uuid() NOT NULL,
	"userId" uuid NOT NULL,
	"degree" varchar(255) NOT NULL,
	"marksOrGpaObtained" varchar(5) NOT NULL,
	"outOf" varchar(5) NOT NULL,
	"boardOrInstituteName" varchar(255) NOT NULL,
	"gradeOrDivision" varchar(255),
	"description" text,
	"isDeleted" boolean DEFAULT false NOT NULL,
	"createdAt" timestamp with time zone NOT NULL,
	"updatedAt" timestamp with time zone,
	"deletedAt" timestamp with time zone
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "candidate_experience" (
	"id" uuid PRIMARY KEY DEFAULT gen_random_uuid() NOT NULL,
	"userId" uuid NOT NULL,
	"companyName" varchar(255) NOT NULL,
	"startDate" varchar(255) NOT NULL,
	"endDate" varchar(255),
	"position" varchar(255) NOT NULL,
	"description" text,
	"isDeleted" boolean DEFAULT false NOT NULL,
	"createdAt" timestamp with time zone NOT NULL,
	"updatedAt" timestamp with time zone,
	"deletedAt" timestamp with time zone
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "candidate_personal_detail" (
	"id" uuid PRIMARY KEY DEFAULT gen_random_uuid() NOT NULL,
	"userId" uuid NOT NULL,
	"preferredJobLocation" varchar(255),
	"resumeOneId" uuid,
	"resumeTwoId" uuid,
	"resumeThreeId" uuid,
	"isDeleted" boolean DEFAULT false NOT NULL,
	"createdAt" timestamp with time zone NOT NULL,
	"updatedAt" timestamp with time zone,
	"deletedAt" timestamp with time zone
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "candidate_skill" (
	"id" uuid PRIMARY KEY DEFAULT gen_random_uuid() NOT NULL,
	"userId" uuid NOT NULL,
	"skills" varchar(255)[] NOT NULL,
	"languages" varchar(255)[] NOT NULL,
	"isDeleted" boolean DEFAULT false NOT NULL,
	"createdAt" timestamp with time zone NOT NULL,
	"updatedAt" timestamp with time zone,
	"deletedAt" timestamp with time zone
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "company_department" (
	"id" uuid PRIMARY KEY DEFAULT gen_random_uuid() NOT NULL,
	"departmentName" varchar(255) NOT NULL,
	"publicId" varchar(10),
	"isDeleted" boolean DEFAULT false NOT NULL,
	"createdAt" timestamp with time zone NOT NULL,
	"updatedAt" timestamp with time zone,
	"deletedAt" timestamp with time zone,
	CONSTRAINT "company_department_publicId_unique" UNIQUE("publicId")
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "customer_account_details" (
	"id" uuid PRIMARY KEY DEFAULT gen_random_uuid() NOT NULL,
	"userId" uuid NOT NULL,
	"accountType" varchar(255) NOT NULL,
	"acountSubType" varchar(255) NOT NULL,
	"isDeleted" boolean DEFAULT false NOT NULL,
	"createdAt" timestamp with time zone NOT NULL,
	"updatedAt" timestamp with time zone,
	"deletedAt" timestamp with time zone
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "customer_bank_information" (
	"id" uuid PRIMARY KEY DEFAULT gen_random_uuid() NOT NULL,
	"userId" uuid NOT NULL,
	"bankName" varchar(255) NOT NULL,
	"branchCode" varchar(255) NOT NULL,
	"IBAN" varchar(255) NOT NULL,
	"accountType" varchar(255) NOT NULL,
	"isDeleted" boolean DEFAULT false NOT NULL,
	"createdAt" timestamp with time zone NOT NULL,
	"updatedAt" timestamp with time zone,
	"deletedAt" timestamp with time zone
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "customer_isip_calculator" (
	"id" uuid PRIMARY KEY DEFAULT gen_random_uuid() NOT NULL,
	"userId" uuid NOT NULL,
	"valuesForCustomerAccountTypes" varchar(255)[] NOT NULL,
	"valuesForCustomerAccountSubTypes" varchar(255)[] NOT NULL,
	"applicantName" varchar(255) NOT NULL,
	"guardianName" varchar(255),
	"futureGoal" varchar(255) NOT NULL,
	"monthlyInvestmentAmount" varchar(255) NOT NULL,
	"durationOfInvestmentInYears" varchar(255) NOT NULL,
	"accountOpeningDate" timestamp with time zone NOT NULL,
	"averageAnnualRateOfReturn" varchar(255) NOT NULL,
	"adjustedInflationOnPrincipalAmount" varchar(255) NOT NULL,
	"accumulatedInvestmentAmount" varchar(255) NOT NULL,
	"grossAmountAtMaturity" varchar(255) NOT NULL,
	"capitalGainTax" varchar(255) NOT NULL,
	"managementFee" varchar(255) NOT NULL,
	"netAmountToBeWithdrawnOnMaturity" varchar(255) NOT NULL,
	"isFiler" boolean NOT NULL,
	"takafulCoverageCategory" varchar(255),
	"isDeleted" boolean DEFAULT false NOT NULL,
	"createdAt" timestamp with time zone NOT NULL,
	"updatedAt" timestamp with time zone,
	"deletedAt" timestamp with time zone
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "customer_nominee" (
	"id" uuid PRIMARY KEY DEFAULT gen_random_uuid() NOT NULL,
	"userId" uuid NOT NULL,
	"name" varchar(255) NOT NULL,
	"relationship" varchar(255) NOT NULL,
	"CNICOrFormBNumber" varchar(255) NOT NULL,
	"isDeleted" boolean DEFAULT false NOT NULL,
	"createdAt" timestamp with time zone NOT NULL,
	"updatedAt" timestamp with time zone,
	"deletedAt" timestamp with time zone
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "customer_payment_details" (
	"id" uuid PRIMARY KEY DEFAULT gen_random_uuid() NOT NULL,
	"userId" uuid NOT NULL,
	"ISIPCalculatorId" uuid NOT NULL,
	"modeOfPayment" varchar(255) NOT NULL,
	"referenceNumber" varchar(255) NOT NULL,
	"bankName" varchar(255) NOT NULL,
	"branchName" varchar(255),
	"isDeleted" boolean DEFAULT false NOT NULL,
	"createdAt" timestamp with time zone NOT NULL,
	"updatedAt" timestamp with time zone,
	"deletedAt" timestamp with time zone
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "customer_personal_information" (
	"id" uuid PRIMARY KEY DEFAULT gen_random_uuid() NOT NULL,
	"userId" uuid NOT NULL,
	"fatherName" varchar(255) NOT NULL,
	"motherName" varchar(255) NOT NULL,
	"dateOfBirth" varchar(255) NOT NULL,
	"placeOfBirth" varchar(255) NOT NULL,
	"gender" varchar(255) NOT NULL,
	"resedentialStatus" varchar(255) NOT NULL,
	"occupation" varchar(255) NOT NULL,
	"dependency" varchar(255) NOT NULL,
	"holderOfAnyGovtOffice" boolean NOT NULL,
	"relationWithPolitician" boolean NOT NULL,
	"permanentAddress" varchar(255) NOT NULL,
	"mailingAddress" varchar(255) NOT NULL,
	"nearestLandmark" varchar(255) NOT NULL,
	"notifyThrough" varchar(255) NOT NULL,
	"zakatExemption" boolean DEFAULT false NOT NULL,
	"isDeleted" boolean DEFAULT false NOT NULL,
	"createdAt" timestamp with time zone NOT NULL,
	"updatedAt" timestamp with time zone,
	"deletedAt" timestamp with time zone
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "customer_verification_data" (
	"id" uuid PRIMARY KEY DEFAULT gen_random_uuid() NOT NULL,
	"userId" uuid NOT NULL,
	"identificationType" varchar(50) NOT NULL,
	"identificationNumber" varchar(80) NOT NULL,
	"identificationIssueDate" timestamp with time zone NOT NULL,
	"identificationExpiryDate" timestamp with time zone,
	"identificationImageOneId" uuid NOT NULL,
	"identificationImageTwoId" uuid,
	"country" varchar(50) NOT NULL,
	"city" varchar(50) NOT NULL,
	"mobileNetworkOperator" varchar(50) NOT NULL,
	"mobileNumber" varchar(20) NOT NULL,
	"isVerified" boolean DEFAULT false NOT NULL,
	"isDeleted" boolean DEFAULT false NOT NULL,
	"createdAt" timestamp with time zone NOT NULL,
	"updatedAt" timestamp with time zone,
	"deletedAt" timestamp with time zone
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "customer_verification_otp" (
	"id" uuid PRIMARY KEY DEFAULT gen_random_uuid() NOT NULL,
	"userId" uuid NOT NULL,
	"otp" varchar(6) NOT NULL,
	"otpExpiry" timestamp with time zone NOT NULL,
	"isDeleted" boolean DEFAULT false NOT NULL,
	"createdAt" timestamp with time zone NOT NULL,
	"updatedAt" timestamp with time zone,
	"deletedAt" timestamp with time zone
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "fill_in_the_blank" (
	"id" uuid PRIMARY KEY DEFAULT gen_random_uuid() NOT NULL,
	"quizId" uuid NOT NULL,
	"statement" varchar(1000) NOT NULL,
	"marks" integer NOT NULL,
	"isDeleted" boolean DEFAULT false NOT NULL,
	"createdAt" timestamp with time zone NOT NULL,
	"updatedAt" timestamp with time zone,
	"deletedAt" timestamp with time zone
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "job_application" (
	"id" uuid PRIMARY KEY DEFAULT gen_random_uuid() NOT NULL,
	"jobPostingId" uuid NOT NULL,
	"userId" uuid NOT NULL,
	"status" varchar(255) NOT NULL,
	"interviewDateAndTime" timestamp with time zone,
	"quizStartDateAndTime" timestamp with time zone,
	"quizEndDateAndTime" timestamp with time zone,
	"isDeleted" boolean DEFAULT false NOT NULL,
	"createdAt" timestamp with time zone NOT NULL,
	"updatedAt" timestamp with time zone,
	"deletedAt" timestamp with time zone,
	"quizAttemptId" uuid
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "job_posting_custom_question_attempt" (
	"id" uuid PRIMARY KEY DEFAULT gen_random_uuid() NOT NULL,
	"jobApplicationId" uuid NOT NULL,
	"questionId" uuid NOT NULL,
	"answer" text NOT NULL,
	"isDeleted" boolean DEFAULT false NOT NULL,
	"createdAt" timestamp with time zone NOT NULL,
	"updatedAt" timestamp with time zone,
	"deletedAt" timestamp with time zone
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "job_posting_custom_question" (
	"id" uuid PRIMARY KEY DEFAULT gen_random_uuid() NOT NULL,
	"jobPostingId" uuid NOT NULL,
	"content" varchar(255) NOT NULL,
	"isRequired" boolean DEFAULT false NOT NULL,
	"isDeleted" boolean DEFAULT false NOT NULL,
	"createdAt" timestamp with time zone NOT NULL,
	"updatedAt" timestamp with time zone,
	"deletedAt" timestamp with time zone,
	"createdBy" uuid NOT NULL,
	"updatedBy" uuid,
	"deletedBy" uuid
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "job_posting" (
	"id" uuid PRIMARY KEY DEFAULT gen_random_uuid() NOT NULL,
	"departmentId" uuid,
	"title" varchar(255) NOT NULL,
	"status" varchar(255) NOT NULL,
	"isFullTime" boolean NOT NULL,
	"nature" varchar(20) NOT NULL,
	"numberOfVacancies" integer NOT NULL,
	"yearsOfExperience" integer,
	"salaryRange" varchar(255),
	"publishDate" timestamp with time zone,
	"dueDate" timestamp with time zone NOT NULL,
	"location" varchar(255) NOT NULL,
	"intro" text NOT NULL,
	"description" text NOT NULL,
	"quiz" uuid,
	"isDeleted" boolean DEFAULT false NOT NULL,
	"createdAt" timestamp with time zone NOT NULL,
	"updatedAt" timestamp with time zone,
	"deletedAt" timestamp with time zone,
	"createdBy" uuid NOT NULL,
	"updatedBy" uuid,
	"deletedBy" uuid
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "mcq" (
	"id" uuid PRIMARY KEY DEFAULT gen_random_uuid() NOT NULL,
	"quizId" uuid NOT NULL,
	"statement" varchar(1000) NOT NULL,
	"options" varchar(255)[] NOT NULL,
	"correctOption" varchar(255) NOT NULL,
	"marks" integer NOT NULL,
	"isDeleted" boolean DEFAULT false NOT NULL,
	"createdAt" timestamp with time zone NOT NULL,
	"updatedAt" timestamp with time zone,
	"deletedAt" timestamp with time zone
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "meeting" (
	"id" uuid PRIMARY KEY DEFAULT gen_random_uuid() NOT NULL,
	"date" timestamp with time zone NOT NULL,
	"title" varchar(255) NOT NULL,
	"description" text,
	"status" varchar(255) NOT NULL,
	"notes" text,
	"isDeleted" boolean DEFAULT false NOT NULL,
	"createdAt" timestamp with time zone NOT NULL,
	"updatedAt" timestamp with time zone,
	"deletedAt" timestamp with time zone,
	"createdBy" uuid NOT NULL,
	"updatedBy" uuid,
	"deletedBy" uuid
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "open_question" (
	"id" uuid PRIMARY KEY DEFAULT gen_random_uuid() NOT NULL,
	"quizId" uuid NOT NULL,
	"statement" varchar(1000) NOT NULL,
	"marks" integer NOT NULL,
	"isDeleted" boolean DEFAULT false NOT NULL,
	"createdAt" timestamp with time zone NOT NULL,
	"updatedAt" timestamp with time zone,
	"deletedAt" timestamp with time zone
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "quiz_attempt" (
	"id" uuid PRIMARY KEY DEFAULT gen_random_uuid() NOT NULL,
	"userId" uuid NOT NULL,
	"quizId" uuid NOT NULL,
	"isClosed" boolean DEFAULT false NOT NULL,
	"isDeleted" boolean DEFAULT false NOT NULL,
	"createdAt" timestamp with time zone NOT NULL,
	"updatedAt" timestamp with time zone,
	"deletedAt" timestamp with time zone
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "quiz" (
	"id" uuid PRIMARY KEY DEFAULT gen_random_uuid() NOT NULL,
	"title" varchar(1000) NOT NULL,
	"timeDuration" integer NOT NULL,
	"instructions" text NOT NULL,
	"isDeleted" boolean DEFAULT false NOT NULL,
	"createdAt" timestamp with time zone NOT NULL,
	"updatedAt" timestamp with time zone,
	"deletedAt" timestamp with time zone,
	"createdBy" uuid NOT NULL,
	"updatedBy" uuid,
	"deletedBy" uuid
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "session" (
	"sid" varchar(255) PRIMARY KEY NOT NULL,
	"sess" json,
	"expire" timestamp with time zone
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "user_permissions_job_posting" (
	"id" uuid PRIMARY KEY DEFAULT gen_random_uuid() NOT NULL,
	"userId" uuid NOT NULL,
	"canCreateJobPosting" boolean DEFAULT false NOT NULL,
	"canEditJobPosting" boolean DEFAULT false NOT NULL,
	"canViewJobPosting" boolean DEFAULT false NOT NULL,
	"canDeleteJobPosting" boolean DEFAULT false NOT NULL,
	"canPublishJobPosting" boolean DEFAULT false NOT NULL,
	"canCloseJobPosting" boolean DEFAULT false NOT NULL,
	"canViewApplication" boolean DEFAULT false NOT NULL,
	"canManageApplication" boolean DEFAULT false NOT NULL,
	"canDownloadResume" boolean DEFAULT false NOT NULL,
	"canViewJobAnalytics" boolean DEFAULT false NOT NULL
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "user_permissions_quiz" (
	"id" uuid PRIMARY KEY DEFAULT gen_random_uuid() NOT NULL,
	"userId" uuid NOT NULL,
	"canCreateQuiz" boolean DEFAULT false NOT NULL,
	"canEditQuiz" boolean DEFAULT false NOT NULL,
	"canDeleteQuiz" boolean DEFAULT false NOT NULL,
	"canPublishQuiz" boolean DEFAULT false NOT NULL,
	"canUnPublishQuiz" boolean DEFAULT false NOT NULL,
	"canViewQuizResults" boolean DEFAULT false NOT NULL,
	"canDoQuizMarking" boolean DEFAULT false NOT NULL
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "user_role" (
	"id" uuid PRIMARY KEY DEFAULT gen_random_uuid() NOT NULL,
	"role" varchar(255) NOT NULL,
	"publicId" varchar(4),
	CONSTRAINT "user_role_publicId_unique" UNIQUE("publicId")
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "user" (
	"id" uuid PRIMARY KEY DEFAULT gen_random_uuid() NOT NULL,
	"roleId" uuid,
	"email" varchar(100) NOT NULL,
	"username" varchar(18),
	"password" varchar(64),
	"firstName" varchar(20) NOT NULL,
	"middleName" varchar(20),
	"lastName" varchar(20) NOT NULL,
	"gender" varchar(255),
	"dateOfBirth" varchar(255),
	"mobileNumber" varchar(20),
	"nationality" varchar(255),
	"identificationType" varchar(255),
	"identificationNumber" varchar(255),
	"address" varchar(255),
	"location" varchar(255),
	"avatarId" uuid,
	"meetingId" uuid,
	"isVerified" boolean DEFAULT false NOT NULL,
	"isActive" boolean DEFAULT true NOT NULL,
	"isLocked" boolean DEFAULT false NOT NULL,
	"lastLogin" timestamp with time zone,
	"lockedAt" timestamp with time zone,
	"resetToken" varchar(64),
	"verificationToken" varchar(64),
	"createdBy" varchar(255),
	"isDeleted" boolean DEFAULT false NOT NULL,
	"createdAt" timestamp with time zone NOT NULL,
	"updatedAt" timestamp with time zone,
	"deletedAt" timestamp with time zone,
	CONSTRAINT "user_email_unique" UNIQUE("email")
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "candidate_evaluation_marks" (
	"id" uuid PRIMARY KEY DEFAULT gen_random_uuid() NOT NULL,
	"userId" uuid NOT NULL,
	"salesAndMarketingRemarks" varchar(255),
	"HRRemarks" varchar(255),
	"ITRemarks" varchar(255),
	"generalRemarks" varchar(255),
	"isDeleted" boolean DEFAULT false NOT NULL,
	"createdAt" timestamp with time zone NOT NULL,
	"updatedAt" timestamp with time zone,
	"deletedAt" timestamp with time zone
);
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "attempted_answer" ADD CONSTRAINT "attempted_answer_quizAttemptId_quiz_attempt_id_fk" FOREIGN KEY ("quizAttemptId") REFERENCES "public"."quiz_attempt"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "attempted_answer" ADD CONSTRAINT "attempted_answer_mcqId_mcq_id_fk" FOREIGN KEY ("mcqId") REFERENCES "public"."mcq"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "attempted_answer" ADD CONSTRAINT "attempted_answer_fillInTheBlankId_fill_in_the_blank_id_fk" FOREIGN KEY ("fillInTheBlankId") REFERENCES "public"."fill_in_the_blank"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "attempted_answer" ADD CONSTRAINT "attempted_answer_openQuestionId_open_question_id_fk" FOREIGN KEY ("openQuestionId") REFERENCES "public"."open_question"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "candidate_education" ADD CONSTRAINT "candidate_education_userId_user_id_fk" FOREIGN KEY ("userId") REFERENCES "public"."user"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "candidate_experience" ADD CONSTRAINT "candidate_experience_userId_user_id_fk" FOREIGN KEY ("userId") REFERENCES "public"."user"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "candidate_personal_detail" ADD CONSTRAINT "candidate_personal_detail_userId_user_id_fk" FOREIGN KEY ("userId") REFERENCES "public"."user"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "candidate_personal_detail" ADD CONSTRAINT "candidate_personal_detail_resumeOneId_all_files_id_fk" FOREIGN KEY ("resumeOneId") REFERENCES "public"."all_files"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "candidate_personal_detail" ADD CONSTRAINT "candidate_personal_detail_resumeTwoId_all_files_id_fk" FOREIGN KEY ("resumeTwoId") REFERENCES "public"."all_files"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "candidate_personal_detail" ADD CONSTRAINT "candidate_personal_detail_resumeThreeId_all_files_id_fk" FOREIGN KEY ("resumeThreeId") REFERENCES "public"."all_files"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "candidate_skill" ADD CONSTRAINT "candidate_skill_userId_user_id_fk" FOREIGN KEY ("userId") REFERENCES "public"."user"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "customer_account_details" ADD CONSTRAINT "customer_account_details_userId_user_id_fk" FOREIGN KEY ("userId") REFERENCES "public"."user"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "customer_bank_information" ADD CONSTRAINT "customer_bank_information_userId_user_id_fk" FOREIGN KEY ("userId") REFERENCES "public"."user"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "customer_isip_calculator" ADD CONSTRAINT "customer_isip_calculator_userId_user_id_fk" FOREIGN KEY ("userId") REFERENCES "public"."user"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "customer_nominee" ADD CONSTRAINT "customer_nominee_userId_user_id_fk" FOREIGN KEY ("userId") REFERENCES "public"."user"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "customer_payment_details" ADD CONSTRAINT "customer_payment_details_userId_user_id_fk" FOREIGN KEY ("userId") REFERENCES "public"."user"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "customer_payment_details" ADD CONSTRAINT "customer_payment_details_ISIPCalculatorId_customer_isip_calculator_id_fk" FOREIGN KEY ("ISIPCalculatorId") REFERENCES "public"."customer_isip_calculator"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "customer_personal_information" ADD CONSTRAINT "customer_personal_information_userId_user_id_fk" FOREIGN KEY ("userId") REFERENCES "public"."user"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "customer_verification_data" ADD CONSTRAINT "customer_verification_data_userId_user_id_fk" FOREIGN KEY ("userId") REFERENCES "public"."user"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "customer_verification_data" ADD CONSTRAINT "customer_verification_data_identificationImageOneId_all_files_id_fk" FOREIGN KEY ("identificationImageOneId") REFERENCES "public"."all_files"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "customer_verification_data" ADD CONSTRAINT "customer_verification_data_identificationImageTwoId_all_files_id_fk" FOREIGN KEY ("identificationImageTwoId") REFERENCES "public"."all_files"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "customer_verification_otp" ADD CONSTRAINT "customer_verification_otp_userId_user_id_fk" FOREIGN KEY ("userId") REFERENCES "public"."user"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "fill_in_the_blank" ADD CONSTRAINT "fill_in_the_blank_quizId_quiz_id_fk" FOREIGN KEY ("quizId") REFERENCES "public"."quiz"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "job_application" ADD CONSTRAINT "job_application_jobPostingId_job_posting_id_fk" FOREIGN KEY ("jobPostingId") REFERENCES "public"."job_posting"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "job_application" ADD CONSTRAINT "job_application_userId_user_id_fk" FOREIGN KEY ("userId") REFERENCES "public"."user"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "job_application" ADD CONSTRAINT "job_application_quizAttemptId_quiz_attempt_id_fk" FOREIGN KEY ("quizAttemptId") REFERENCES "public"."quiz_attempt"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "job_posting_custom_question_attempt" ADD CONSTRAINT "job_posting_custom_question_attempt_jobApplicationId_job_application_id_fk" FOREIGN KEY ("jobApplicationId") REFERENCES "public"."job_application"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "job_posting_custom_question_attempt" ADD CONSTRAINT "job_posting_custom_question_attempt_questionId_job_posting_custom_question_id_fk" FOREIGN KEY ("questionId") REFERENCES "public"."job_posting_custom_question"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "job_posting_custom_question" ADD CONSTRAINT "job_posting_custom_question_jobPostingId_job_posting_id_fk" FOREIGN KEY ("jobPostingId") REFERENCES "public"."job_posting"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "job_posting_custom_question" ADD CONSTRAINT "job_posting_custom_question_createdBy_user_id_fk" FOREIGN KEY ("createdBy") REFERENCES "public"."user"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "job_posting_custom_question" ADD CONSTRAINT "job_posting_custom_question_updatedBy_user_id_fk" FOREIGN KEY ("updatedBy") REFERENCES "public"."user"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "job_posting_custom_question" ADD CONSTRAINT "job_posting_custom_question_deletedBy_user_id_fk" FOREIGN KEY ("deletedBy") REFERENCES "public"."user"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "job_posting" ADD CONSTRAINT "job_posting_departmentId_company_department_id_fk" FOREIGN KEY ("departmentId") REFERENCES "public"."company_department"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "job_posting" ADD CONSTRAINT "job_posting_quiz_quiz_id_fk" FOREIGN KEY ("quiz") REFERENCES "public"."quiz"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "job_posting" ADD CONSTRAINT "job_posting_createdBy_user_id_fk" FOREIGN KEY ("createdBy") REFERENCES "public"."user"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "job_posting" ADD CONSTRAINT "job_posting_updatedBy_user_id_fk" FOREIGN KEY ("updatedBy") REFERENCES "public"."user"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "job_posting" ADD CONSTRAINT "job_posting_deletedBy_user_id_fk" FOREIGN KEY ("deletedBy") REFERENCES "public"."user"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "mcq" ADD CONSTRAINT "mcq_quizId_quiz_id_fk" FOREIGN KEY ("quizId") REFERENCES "public"."quiz"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "meeting" ADD CONSTRAINT "meeting_createdBy_user_id_fk" FOREIGN KEY ("createdBy") REFERENCES "public"."user"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "meeting" ADD CONSTRAINT "meeting_updatedBy_user_id_fk" FOREIGN KEY ("updatedBy") REFERENCES "public"."user"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "meeting" ADD CONSTRAINT "meeting_deletedBy_user_id_fk" FOREIGN KEY ("deletedBy") REFERENCES "public"."user"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "open_question" ADD CONSTRAINT "open_question_quizId_quiz_id_fk" FOREIGN KEY ("quizId") REFERENCES "public"."quiz"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "quiz_attempt" ADD CONSTRAINT "quiz_attempt_userId_user_id_fk" FOREIGN KEY ("userId") REFERENCES "public"."user"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "quiz_attempt" ADD CONSTRAINT "quiz_attempt_quizId_quiz_id_fk" FOREIGN KEY ("quizId") REFERENCES "public"."quiz"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "quiz" ADD CONSTRAINT "quiz_createdBy_user_id_fk" FOREIGN KEY ("createdBy") REFERENCES "public"."user"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "quiz" ADD CONSTRAINT "quiz_updatedBy_user_id_fk" FOREIGN KEY ("updatedBy") REFERENCES "public"."user"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "quiz" ADD CONSTRAINT "quiz_deletedBy_user_id_fk" FOREIGN KEY ("deletedBy") REFERENCES "public"."user"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "user_permissions_job_posting" ADD CONSTRAINT "user_permissions_job_posting_userId_user_id_fk" FOREIGN KEY ("userId") REFERENCES "public"."user"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "user_permissions_quiz" ADD CONSTRAINT "user_permissions_quiz_userId_user_id_fk" FOREIGN KEY ("userId") REFERENCES "public"."user"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "user" ADD CONSTRAINT "user_roleId_user_role_id_fk" FOREIGN KEY ("roleId") REFERENCES "public"."user_role"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "user" ADD CONSTRAINT "user_avatarId_all_files_id_fk" FOREIGN KEY ("avatarId") REFERENCES "public"."all_files"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "user" ADD CONSTRAINT "user_meetingId_meeting_id_fk" FOREIGN KEY ("meetingId") REFERENCES "public"."meeting"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "candidate_evaluation_marks" ADD CONSTRAINT "candidate_evaluation_marks_userId_user_id_fk" FOREIGN KEY ("userId") REFERENCES "public"."user"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
