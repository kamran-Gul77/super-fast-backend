ALTER TABLE "candidate_evaluation_marks" RENAME TO "candidate_evaluation_remarks";--> statement-breakpoint
ALTER TABLE "candidate_evaluation_remarks" DROP CONSTRAINT "candidate_evaluation_marks_userId_user_id_fk";
--> statement-breakpoint
ALTER TABLE "user" ADD COLUMN "recruitmentDriveId" uuid;--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "user" ADD CONSTRAINT "user_recruitmentDriveId_candidate_recruitment_drive_id_fk" FOREIGN KEY ("recruitmentDriveId") REFERENCES "public"."candidate_recruitment_drive"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "candidate_evaluation_remarks" ADD CONSTRAINT "candidate_evaluation_remarks_userId_user_id_fk" FOREIGN KEY ("userId") REFERENCES "public"."user"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
