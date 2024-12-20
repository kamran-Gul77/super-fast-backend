ALTER TABLE "customer_bank_information" ADD COLUMN "accountId" uuid NOT NULL;--> statement-breakpoint
ALTER TABLE "customer_isip_calculator" ADD COLUMN "accountId" uuid NOT NULL;--> statement-breakpoint
ALTER TABLE "customer_nominee" ADD COLUMN "accountId" uuid NOT NULL;--> statement-breakpoint
ALTER TABLE "customer_payment_details" ADD COLUMN "accountId" uuid NOT NULL;--> statement-breakpoint
ALTER TABLE "customer_verification_data" ADD COLUMN "accountId" uuid NOT NULL;--> statement-breakpoint
ALTER TABLE "customer_verification_otp" ADD COLUMN "accountId" uuid NOT NULL;--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "customer_bank_information" ADD CONSTRAINT "customer_bank_information_accountId_customer_personal_information_id_fk" FOREIGN KEY ("accountId") REFERENCES "public"."customer_personal_information"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "customer_isip_calculator" ADD CONSTRAINT "customer_isip_calculator_accountId_customer_personal_information_id_fk" FOREIGN KEY ("accountId") REFERENCES "public"."customer_personal_information"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "customer_nominee" ADD CONSTRAINT "customer_nominee_accountId_customer_personal_information_id_fk" FOREIGN KEY ("accountId") REFERENCES "public"."customer_personal_information"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "customer_payment_details" ADD CONSTRAINT "customer_payment_details_accountId_customer_personal_information_id_fk" FOREIGN KEY ("accountId") REFERENCES "public"."customer_personal_information"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "customer_verification_data" ADD CONSTRAINT "customer_verification_data_accountId_customer_personal_information_id_fk" FOREIGN KEY ("accountId") REFERENCES "public"."customer_personal_information"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "customer_verification_otp" ADD CONSTRAINT "customer_verification_otp_accountId_customer_personal_information_id_fk" FOREIGN KEY ("accountId") REFERENCES "public"."customer_personal_information"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
