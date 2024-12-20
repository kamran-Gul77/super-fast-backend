ALTER TABLE "user" ADD COLUMN "passwordResetToken" varchar(64);--> statement-breakpoint
ALTER TABLE "user" ADD COLUMN "tokenExpiresAt" varchar(64);