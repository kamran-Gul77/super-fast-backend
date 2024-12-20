ALTER TABLE "customer_verification_otp" DROP CONSTRAINT "customer_verification_otp_accountId_customer_personal_information_id_fk";
--> statement-breakpoint
ALTER TABLE "candidate_recruitment_drive" ALTER COLUMN "trainingDate" SET DATA TYPE timestamp with time zone USING "trainingDate"::timestamp with time zone;--> statement-breakpoint
ALTER TABLE "candidate_evaluation_remarks" ALTER COLUMN "evaluationStatus" SET DEFAULT 'Pending';--> statement-breakpoint
ALTER TABLE "customer_verification_otp" DROP COLUMN IF EXISTS "accountId";