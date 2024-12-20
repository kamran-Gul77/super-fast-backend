ALTER TABLE "customer_verification_otp" ADD COLUMN "isVerified" boolean DEFAULT false NOT NULL;--> statement-breakpoint
ALTER TABLE "customer_verification_data" DROP COLUMN IF EXISTS "isVerified";