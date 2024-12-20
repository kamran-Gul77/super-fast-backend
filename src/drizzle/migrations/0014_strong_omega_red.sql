CREATE TABLE IF NOT EXISTS "csr_access_logs" (
	"id" uuid PRIMARY KEY DEFAULT gen_random_uuid() NOT NULL,
	"csrId" uuid NOT NULL,
	"customerAccountId" uuid NOT NULL,
	"inquiryType" varchar(255)[] NOT NULL,
	"accessedAt" timestamp with time zone NOT NULL,
	"expiryAt" timestamp with time zone NOT NULL,
	"isDeleted" boolean DEFAULT false NOT NULL,
	"createdAt" timestamp with time zone,
	"updatedAt" timestamp with time zone,
	"deletedAt" timestamp with time zone,
	"createdBy" uuid,
	"updatedBy" uuid,
	"deletedBy" uuid
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "complaints" (
	"id" uuid PRIMARY KEY DEFAULT gen_random_uuid() NOT NULL,
	"accountId" uuid NOT NULL,
	"complaintId" varchar(255) NOT NULL,
	"type" varchar(255) NOT NULL,
	"summary" text NOT NULL,
	"priority" varchar(255) NOT NULL,
	"status" varchar(255) DEFAULT 'pending' NOT NULL,
	"assignedDepartment" varchar(255),
	"customerFeedback" varchar(255),
	"isDeleted" boolean DEFAULT false NOT NULL,
	"createdAt" timestamp with time zone,
	"updatedAt" timestamp with time zone,
	"deletedAt" timestamp with time zone,
	"createdBy" uuid,
	"updatedBy" uuid,
	"deletedBy" uuid,
	CONSTRAINT "complaints_complaintId_unique" UNIQUE("complaintId")
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "customer_accounts" (
	"id" uuid PRIMARY KEY DEFAULT gen_random_uuid() NOT NULL,
	"customerId" uuid NOT NULL,
	"accountStatus" varchar(255) DEFAULT 'active' NOT NULL,
	"accountNumber" varchar(255) NOT NULL,
	"accountType" varchar(255) NOT NULL,
	"accountSubTypes" varchar(255)[] NOT NULL,
	"currentBalance" numeric(15, 2) DEFAULT '0.00' NOT NULL,
	"name" varchar(255) NOT NULL,
	"dateOfBirth" varchar(255) NOT NULL,
	"isDeleted" boolean DEFAULT false NOT NULL,
	"createdAt" timestamp with time zone,
	"updatedAt" timestamp with time zone,
	"deletedAt" timestamp with time zone,
	"createdBy" uuid,
	"updatedBy" uuid,
	"deletedBy" uuid
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "customer_isip_installments" (
	"id" uuid PRIMARY KEY DEFAULT gen_random_uuid() NOT NULL,
	"accountId" uuid NOT NULL,
	"installmentAmount" integer NOT NULL,
	"installmentDate" timestamp with time zone NOT NULL,
	"installmentMonth" varchar(255) NOT NULL,
	"installmentPaidBy" varchar(255),
	"paymentStatus" varchar(255) DEFAULT 'pending' NOT NULL
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "customer_joint_accounts" (
	"id" uuid PRIMARY KEY DEFAULT gen_random_uuid() NOT NULL,
	"accountId" uuid NOT NULL,
	"name" varchar(255) NOT NULL,
	"fatherOrMotherName" varchar(255) NOT NULL,
	"cnic" varchar(255) NOT NULL,
	"address" varchar(255) NOT NULL,
	"relationWithAccountHolder" varchar(255) NOT NULL,
	"isDeleted" boolean DEFAULT false NOT NULL,
	"createdAt" timestamp with time zone,
	"updatedAt" timestamp with time zone,
	"deletedAt" timestamp with time zone,
	"createdBy" uuid,
	"updatedBy" uuid,
	"deletedBy" uuid
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "customer_profit_history" (
	"id" uuid PRIMARY KEY DEFAULT gen_random_uuid() NOT NULL,
	"accountId" uuid NOT NULL,
	"profitType" varchar(255) DEFAULT 'credit' NOT NULL,
	"profitAmount" numeric(15, 2) NOT NULL,
	"profitDate" timestamp with time zone NOT NULL,
	"withdrawalStatus" varchar(255) DEFAULT 'available' NOT NULL
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "customer_regular_accounts" (
	"id" uuid PRIMARY KEY DEFAULT gen_random_uuid() NOT NULL,
	"accountId" uuid NOT NULL,
	"guardianName" varchar(255),
	"initialInvestmentAmount" numeric(15, 2) NOT NULL,
	"currentInvestmentAmount" numeric(15, 2) NOT NULL,
	"durationOfInvestment" varchar(255) NOT NULL,
	"investmentPlan" varchar(255) DEFAULT 'short term' NOT NULL,
	"accountOpeningDate" timestamp with time zone NOT NULL,
	"realizationDate" timestamp with time zone NOT NULL,
	"rateOfReturn" numeric(10, 2) NOT NULL,
	"profitDistribution" varchar(255) NOT NULL,
	"profitMode" varchar(255) DEFAULT 'simple' NOT NULL,
	"liquidity" varchar(255) NOT NULL,
	"noticePeriod" varchar(255) NOT NULL,
	"managementFee" varchar(255) NOT NULL,
	"loadAndCharges" numeric(10, 2) DEFAULT '0.00' NOT NULL,
	"monthlyProfit" numeric(15, 2) NOT NULL,
	"profitOnMaturity" numeric(15, 2) NOT NULL,
	"accountStatementFrequency" varchar(255) NOT NULL,
	"isFiler" boolean DEFAULT false NOT NULL,
	"takafulCoverageCategory" varchar(255),
	"isDeleted" boolean DEFAULT false NOT NULL,
	"createdAt" timestamp with time zone,
	"updatedAt" timestamp with time zone,
	"deletedAt" timestamp with time zone,
	"createdBy" uuid,
	"updatedBy" uuid,
	"deletedBy" uuid
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "customer_withdrawal_requests" (
	"id" uuid PRIMARY KEY DEFAULT gen_random_uuid() NOT NULL,
	"accountId" uuid NOT NULL,
	"requestStatus" varchar(255) DEFAULT 'pending' NOT NULL,
	"requestedAmount" numeric(15, 2) NOT NULL,
	"requestDate" timestamp with time zone NOT NULL,
	"withdrawalType" varchar(255) NOT NULL,
	"withdrawalReason" varchar(255),
	"isDeleted" boolean DEFAULT false NOT NULL,
	"createdAt" timestamp with time zone,
	"updatedAt" timestamp with time zone,
	"deletedAt" timestamp with time zone,
	"createdBy" uuid,
	"updatedBy" uuid,
	"deletedBy" uuid
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "leads" (
	"id" uuid PRIMARY KEY DEFAULT gen_random_uuid() NOT NULL,
	"accountId" uuid NOT NULL,
	"name" varchar(255) NOT NULL,
	"fatherOrHusbandName" varchar(255),
	"contactNumber" varchar(255) NOT NULL,
	"address" text NOT NULL,
	"accountType" varchar(255),
	"accountSubTypes" varchar(255)[],
	"occupation" varchar(255),
	"source" varchar(255),
	"location" varchar(255),
	"leadAssignedTo" varchar(255),
	"status" varchar(255) DEFAULT 'pending' NOT NULL,
	"followUpNotes" text,
	"isDeleted" boolean DEFAULT false NOT NULL,
	"createdAt" timestamp with time zone,
	"updatedAt" timestamp with time zone,
	"deletedAt" timestamp with time zone,
	"createdBy" uuid,
	"updatedBy" uuid,
	"deletedBy" uuid
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "metadata" (
	"id" uuid PRIMARY KEY DEFAULT gen_random_uuid() NOT NULL,
	"isipFolioNumber" varchar(255) NOT NULL,
	CONSTRAINT "metadata_isipFolioNumber_unique" UNIQUE("isipFolioNumber")
);
--> statement-breakpoint
ALTER TABLE "customer_isip_calculator" RENAME TO "customer_isip_accounts";--> statement-breakpoint
ALTER TABLE "customer_nominee" RENAME TO "customer_nominees";--> statement-breakpoint
ALTER TABLE "customer_payment_details" RENAME TO "customer_transactions";--> statement-breakpoint
ALTER TABLE "customer_transactions" RENAME COLUMN "transactionAmount" TO "amount";--> statement-breakpoint
ALTER TABLE "customer_transactions" RENAME COLUMN "transactionDate" TO "date";--> statement-breakpoint
ALTER TABLE "customer_transactions" RENAME COLUMN "installmentForMonth" TO "installmentMonth";--> statement-breakpoint
ALTER TABLE "customer_bank_information" DROP CONSTRAINT "customer_bank_information_userId_user_id_fk";
--> statement-breakpoint
ALTER TABLE "customer_isip_accounts" DROP CONSTRAINT "customer_isip_calculator_userId_user_id_fk";
--> statement-breakpoint
ALTER TABLE "customer_isip_accounts" DROP CONSTRAINT "customer_isip_calculator_accountId_customer_personal_information_id_fk";
--> statement-breakpoint
ALTER TABLE "customer_nominees" DROP CONSTRAINT "customer_nominee_userId_user_id_fk";
--> statement-breakpoint
ALTER TABLE "customer_nominees" DROP CONSTRAINT "customer_nominee_accountId_customer_personal_information_id_fk";
--> statement-breakpoint
ALTER TABLE "customer_transactions" DROP CONSTRAINT "customer_payment_details_userId_user_id_fk";
--> statement-breakpoint
ALTER TABLE "customer_transactions" DROP CONSTRAINT "customer_payment_details_accountId_customer_personal_information_id_fk";
--> statement-breakpoint
ALTER TABLE "customer_transactions" DROP CONSTRAINT "customer_payment_details_ISIPCalculatorId_customer_isip_calculator_id_fk";
--> statement-breakpoint
ALTER TABLE "customer_verification_data" DROP CONSTRAINT "customer_verification_data_userId_user_id_fk";
--> statement-breakpoint
ALTER TABLE "customer_bank_information" ALTER COLUMN "accountId" DROP NOT NULL;--> statement-breakpoint
ALTER TABLE "customer_isip_accounts" ALTER COLUMN "accountId" DROP NOT NULL;--> statement-breakpoint
ALTER TABLE "customer_isip_accounts" ALTER COLUMN "folioNumber" DROP NOT NULL;--> statement-breakpoint
ALTER TABLE "customer_isip_accounts" ALTER COLUMN "valuesForCustomerAccountTypes" DROP NOT NULL;--> statement-breakpoint
ALTER TABLE "customer_isip_accounts" ALTER COLUMN "valuesForCustomerAccountSubTypes" DROP NOT NULL;--> statement-breakpoint
ALTER TABLE "customer_isip_accounts" ALTER COLUMN "applicantName" DROP NOT NULL;--> statement-breakpoint
ALTER TABLE "customer_isip_accounts" ALTER COLUMN "dateOfBirth" DROP NOT NULL;--> statement-breakpoint
ALTER TABLE "customer_isip_accounts" ALTER COLUMN "adjustedInflationOnPrincipalAmount" DROP NOT NULL;--> statement-breakpoint
ALTER TABLE "customer_nominees" ALTER COLUMN "accountId" DROP NOT NULL;--> statement-breakpoint
ALTER TABLE "customer_nominees" ALTER COLUMN "name" SET NOT NULL;--> statement-breakpoint
ALTER TABLE "customer_nominees" ALTER COLUMN "relationship" SET NOT NULL;--> statement-breakpoint
ALTER TABLE "customer_nominees" ALTER COLUMN "CNICOrFormBNumber" SET NOT NULL;--> statement-breakpoint
ALTER TABLE "customer_transactions" ALTER COLUMN "accountId" DROP NOT NULL;--> statement-breakpoint
ALTER TABLE "customer_transactions" ALTER COLUMN "installmentMonth" DROP NOT NULL;--> statement-breakpoint
ALTER TABLE "customer_transactions" ALTER COLUMN "bankName" DROP NOT NULL;--> statement-breakpoint
ALTER TABLE "customer_personal_information" ALTER COLUMN "userId" DROP NOT NULL;--> statement-breakpoint
ALTER TABLE "customer_personal_information" ALTER COLUMN "installmentDate" DROP NOT NULL;--> statement-breakpoint
ALTER TABLE "customer_verification_data" ALTER COLUMN "accountId" DROP NOT NULL;--> statement-breakpoint
ALTER TABLE "customer_bank_information" ADD COLUMN "account_id" uuid NOT NULL;--> statement-breakpoint
ALTER TABLE "customer_bank_information" ADD COLUMN "createdBy" uuid;--> statement-breakpoint
ALTER TABLE "customer_bank_information" ADD COLUMN "updatedBy" uuid;--> statement-breakpoint
ALTER TABLE "customer_bank_information" ADD COLUMN "deletedBy" uuid;--> statement-breakpoint
ALTER TABLE "customer_isip_accounts" ADD COLUMN "account_id" uuid NOT NULL;--> statement-breakpoint
ALTER TABLE "customer_isip_accounts" ADD COLUMN "installmentDate" integer;--> statement-breakpoint
ALTER TABLE "customer_isip_accounts" ADD COLUMN "createdBy" uuid;--> statement-breakpoint
ALTER TABLE "customer_isip_accounts" ADD COLUMN "updatedBy" uuid;--> statement-breakpoint
ALTER TABLE "customer_isip_accounts" ADD COLUMN "deletedBy" uuid;--> statement-breakpoint
ALTER TABLE "customer_nominees" ADD COLUMN "account_id" uuid NOT NULL;--> statement-breakpoint
ALTER TABLE "customer_nominees" ADD COLUMN "createdBy" uuid;--> statement-breakpoint
ALTER TABLE "customer_nominees" ADD COLUMN "updatedBy" uuid;--> statement-breakpoint
ALTER TABLE "customer_nominees" ADD COLUMN "deletedBy" uuid;--> statement-breakpoint
ALTER TABLE "customer_transactions" ADD COLUMN "account_id" uuid NOT NULL;--> statement-breakpoint
ALTER TABLE "customer_transactions" ADD COLUMN "transactionId" varchar(255);--> statement-breakpoint
ALTER TABLE "customer_transactions" ADD COLUMN "status" varchar(255) DEFAULT 'pending' NOT NULL;--> statement-breakpoint
ALTER TABLE "customer_transactions" ADD COLUMN "type" varchar(255) DEFAULT 'credit' NOT NULL;--> statement-breakpoint
ALTER TABLE "customer_transactions" ADD COLUMN "purpose" varchar(255);--> statement-breakpoint
ALTER TABLE "customer_transactions" ADD COLUMN "branchCode" varchar(255);--> statement-breakpoint
ALTER TABLE "customer_transactions" ADD COLUMN "installmentPaidBy" varchar(255);--> statement-breakpoint
ALTER TABLE "customer_transactions" ADD COLUMN "createdBy" uuid;--> statement-breakpoint
ALTER TABLE "customer_transactions" ADD COLUMN "updatedBy" uuid;--> statement-breakpoint
ALTER TABLE "customer_transactions" ADD COLUMN "deletedBy" uuid;--> statement-breakpoint
ALTER TABLE "customer_personal_information" ADD COLUMN "accountId" uuid NOT NULL;--> statement-breakpoint
ALTER TABLE "customer_personal_information" ADD COLUMN "createdBy" uuid;--> statement-breakpoint
ALTER TABLE "customer_personal_information" ADD COLUMN "updatedBy" uuid;--> statement-breakpoint
ALTER TABLE "customer_personal_information" ADD COLUMN "deletedBy" uuid;--> statement-breakpoint
ALTER TABLE "customer_verification_data" ADD COLUMN "account_id" uuid NOT NULL;--> statement-breakpoint
ALTER TABLE "customer_verification_data" ADD COLUMN "createdBy" uuid;--> statement-breakpoint
ALTER TABLE "customer_verification_data" ADD COLUMN "updatedBy" uuid;--> statement-breakpoint
ALTER TABLE "customer_verification_data" ADD COLUMN "deletedBy" uuid;--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "csr_access_logs" ADD CONSTRAINT "csr_access_logs_csrId_user_id_fk" FOREIGN KEY ("csrId") REFERENCES "public"."user"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "csr_access_logs" ADD CONSTRAINT "csr_access_logs_customerAccountId_customer_accounts_id_fk" FOREIGN KEY ("customerAccountId") REFERENCES "public"."customer_accounts"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "csr_access_logs" ADD CONSTRAINT "csr_access_logs_createdBy_user_id_fk" FOREIGN KEY ("createdBy") REFERENCES "public"."user"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "csr_access_logs" ADD CONSTRAINT "csr_access_logs_updatedBy_user_id_fk" FOREIGN KEY ("updatedBy") REFERENCES "public"."user"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "csr_access_logs" ADD CONSTRAINT "csr_access_logs_deletedBy_user_id_fk" FOREIGN KEY ("deletedBy") REFERENCES "public"."user"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "complaints" ADD CONSTRAINT "complaints_accountId_customer_accounts_id_fk" FOREIGN KEY ("accountId") REFERENCES "public"."customer_accounts"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "complaints" ADD CONSTRAINT "complaints_createdBy_user_id_fk" FOREIGN KEY ("createdBy") REFERENCES "public"."user"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "complaints" ADD CONSTRAINT "complaints_updatedBy_user_id_fk" FOREIGN KEY ("updatedBy") REFERENCES "public"."user"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "complaints" ADD CONSTRAINT "complaints_deletedBy_user_id_fk" FOREIGN KEY ("deletedBy") REFERENCES "public"."user"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "customer_accounts" ADD CONSTRAINT "customer_accounts_customerId_user_id_fk" FOREIGN KEY ("customerId") REFERENCES "public"."user"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "customer_accounts" ADD CONSTRAINT "customer_accounts_createdBy_user_id_fk" FOREIGN KEY ("createdBy") REFERENCES "public"."user"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "customer_accounts" ADD CONSTRAINT "customer_accounts_updatedBy_user_id_fk" FOREIGN KEY ("updatedBy") REFERENCES "public"."user"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "customer_accounts" ADD CONSTRAINT "customer_accounts_deletedBy_user_id_fk" FOREIGN KEY ("deletedBy") REFERENCES "public"."user"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "customer_isip_installments" ADD CONSTRAINT "customer_isip_installments_accountId_customer_isip_accounts_id_fk" FOREIGN KEY ("accountId") REFERENCES "public"."customer_isip_accounts"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "customer_joint_accounts" ADD CONSTRAINT "customer_joint_accounts_accountId_customer_accounts_id_fk" FOREIGN KEY ("accountId") REFERENCES "public"."customer_accounts"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "customer_joint_accounts" ADD CONSTRAINT "customer_joint_accounts_createdBy_user_id_fk" FOREIGN KEY ("createdBy") REFERENCES "public"."user"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "customer_joint_accounts" ADD CONSTRAINT "customer_joint_accounts_updatedBy_user_id_fk" FOREIGN KEY ("updatedBy") REFERENCES "public"."user"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "customer_joint_accounts" ADD CONSTRAINT "customer_joint_accounts_deletedBy_user_id_fk" FOREIGN KEY ("deletedBy") REFERENCES "public"."user"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "customer_profit_history" ADD CONSTRAINT "customer_profit_history_accountId_customer_accounts_id_fk" FOREIGN KEY ("accountId") REFERENCES "public"."customer_accounts"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "customer_regular_accounts" ADD CONSTRAINT "customer_regular_accounts_accountId_customer_accounts_id_fk" FOREIGN KEY ("accountId") REFERENCES "public"."customer_accounts"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "customer_regular_accounts" ADD CONSTRAINT "customer_regular_accounts_createdBy_user_id_fk" FOREIGN KEY ("createdBy") REFERENCES "public"."user"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "customer_regular_accounts" ADD CONSTRAINT "customer_regular_accounts_updatedBy_user_id_fk" FOREIGN KEY ("updatedBy") REFERENCES "public"."user"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "customer_regular_accounts" ADD CONSTRAINT "customer_regular_accounts_deletedBy_user_id_fk" FOREIGN KEY ("deletedBy") REFERENCES "public"."user"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "customer_withdrawal_requests" ADD CONSTRAINT "customer_withdrawal_requests_accountId_customer_accounts_id_fk" FOREIGN KEY ("accountId") REFERENCES "public"."customer_accounts"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "customer_withdrawal_requests" ADD CONSTRAINT "customer_withdrawal_requests_createdBy_user_id_fk" FOREIGN KEY ("createdBy") REFERENCES "public"."user"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "customer_withdrawal_requests" ADD CONSTRAINT "customer_withdrawal_requests_updatedBy_user_id_fk" FOREIGN KEY ("updatedBy") REFERENCES "public"."user"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "customer_withdrawal_requests" ADD CONSTRAINT "customer_withdrawal_requests_deletedBy_user_id_fk" FOREIGN KEY ("deletedBy") REFERENCES "public"."user"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "leads" ADD CONSTRAINT "leads_accountId_customer_accounts_id_fk" FOREIGN KEY ("accountId") REFERENCES "public"."customer_accounts"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "leads" ADD CONSTRAINT "leads_createdBy_user_id_fk" FOREIGN KEY ("createdBy") REFERENCES "public"."user"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "leads" ADD CONSTRAINT "leads_updatedBy_user_id_fk" FOREIGN KEY ("updatedBy") REFERENCES "public"."user"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "leads" ADD CONSTRAINT "leads_deletedBy_user_id_fk" FOREIGN KEY ("deletedBy") REFERENCES "public"."user"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "customer_bank_information" ADD CONSTRAINT "customer_bank_information_account_id_customer_accounts_id_fk" FOREIGN KEY ("account_id") REFERENCES "public"."customer_accounts"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "customer_bank_information" ADD CONSTRAINT "customer_bank_information_createdBy_user_id_fk" FOREIGN KEY ("createdBy") REFERENCES "public"."user"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "customer_bank_information" ADD CONSTRAINT "customer_bank_information_updatedBy_user_id_fk" FOREIGN KEY ("updatedBy") REFERENCES "public"."user"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "customer_bank_information" ADD CONSTRAINT "customer_bank_information_deletedBy_user_id_fk" FOREIGN KEY ("deletedBy") REFERENCES "public"."user"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "customer_isip_accounts" ADD CONSTRAINT "customer_isip_accounts_accountId_customer_personal_information_id_fk" FOREIGN KEY ("accountId") REFERENCES "public"."customer_personal_information"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "customer_isip_accounts" ADD CONSTRAINT "customer_isip_accounts_account_id_customer_accounts_id_fk" FOREIGN KEY ("account_id") REFERENCES "public"."customer_accounts"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "customer_isip_accounts" ADD CONSTRAINT "customer_isip_accounts_createdBy_user_id_fk" FOREIGN KEY ("createdBy") REFERENCES "public"."user"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "customer_isip_accounts" ADD CONSTRAINT "customer_isip_accounts_updatedBy_user_id_fk" FOREIGN KEY ("updatedBy") REFERENCES "public"."user"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "customer_isip_accounts" ADD CONSTRAINT "customer_isip_accounts_deletedBy_user_id_fk" FOREIGN KEY ("deletedBy") REFERENCES "public"."user"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "customer_nominees" ADD CONSTRAINT "customer_nominees_accountId_customer_personal_information_id_fk" FOREIGN KEY ("accountId") REFERENCES "public"."customer_personal_information"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "customer_nominees" ADD CONSTRAINT "customer_nominees_account_id_customer_accounts_id_fk" FOREIGN KEY ("account_id") REFERENCES "public"."customer_accounts"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "customer_nominees" ADD CONSTRAINT "customer_nominees_createdBy_user_id_fk" FOREIGN KEY ("createdBy") REFERENCES "public"."user"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "customer_nominees" ADD CONSTRAINT "customer_nominees_updatedBy_user_id_fk" FOREIGN KEY ("updatedBy") REFERENCES "public"."user"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "customer_nominees" ADD CONSTRAINT "customer_nominees_deletedBy_user_id_fk" FOREIGN KEY ("deletedBy") REFERENCES "public"."user"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "customer_transactions" ADD CONSTRAINT "customer_transactions_accountId_customer_personal_information_id_fk" FOREIGN KEY ("accountId") REFERENCES "public"."customer_personal_information"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "customer_transactions" ADD CONSTRAINT "customer_transactions_account_id_customer_accounts_id_fk" FOREIGN KEY ("account_id") REFERENCES "public"."customer_accounts"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "customer_transactions" ADD CONSTRAINT "customer_transactions_createdBy_user_id_fk" FOREIGN KEY ("createdBy") REFERENCES "public"."user"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "customer_transactions" ADD CONSTRAINT "customer_transactions_updatedBy_user_id_fk" FOREIGN KEY ("updatedBy") REFERENCES "public"."user"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "customer_transactions" ADD CONSTRAINT "customer_transactions_deletedBy_user_id_fk" FOREIGN KEY ("deletedBy") REFERENCES "public"."user"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "customer_personal_information" ADD CONSTRAINT "customer_personal_information_accountId_customer_accounts_id_fk" FOREIGN KEY ("accountId") REFERENCES "public"."customer_accounts"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "customer_personal_information" ADD CONSTRAINT "customer_personal_information_createdBy_user_id_fk" FOREIGN KEY ("createdBy") REFERENCES "public"."user"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "customer_personal_information" ADD CONSTRAINT "customer_personal_information_updatedBy_user_id_fk" FOREIGN KEY ("updatedBy") REFERENCES "public"."user"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "customer_personal_information" ADD CONSTRAINT "customer_personal_information_deletedBy_user_id_fk" FOREIGN KEY ("deletedBy") REFERENCES "public"."user"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "customer_verification_data" ADD CONSTRAINT "customer_verification_data_account_id_customer_accounts_id_fk" FOREIGN KEY ("account_id") REFERENCES "public"."customer_accounts"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "customer_verification_data" ADD CONSTRAINT "customer_verification_data_createdBy_user_id_fk" FOREIGN KEY ("createdBy") REFERENCES "public"."user"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "customer_verification_data" ADD CONSTRAINT "customer_verification_data_updatedBy_user_id_fk" FOREIGN KEY ("updatedBy") REFERENCES "public"."user"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "customer_verification_data" ADD CONSTRAINT "customer_verification_data_deletedBy_user_id_fk" FOREIGN KEY ("deletedBy") REFERENCES "public"."user"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
ALTER TABLE "customer_bank_information" DROP COLUMN IF EXISTS "userId";--> statement-breakpoint
ALTER TABLE "customer_isip_accounts" DROP COLUMN IF EXISTS "userId";--> statement-breakpoint
ALTER TABLE "customer_nominees" DROP COLUMN IF EXISTS "userId";--> statement-breakpoint
ALTER TABLE "customer_transactions" DROP COLUMN IF EXISTS "userId";--> statement-breakpoint
ALTER TABLE "customer_transactions" DROP COLUMN IF EXISTS "ISIPCalculatorId";--> statement-breakpoint
ALTER TABLE "customer_personal_information" DROP COLUMN IF EXISTS "dateOfBirth";--> statement-breakpoint
ALTER TABLE "customer_verification_data" DROP COLUMN IF EXISTS "userId";--> statement-breakpoint
ALTER TABLE "customer_verification_otp" DROP COLUMN IF EXISTS "isDeleted";--> statement-breakpoint
ALTER TABLE "customer_verification_otp" DROP COLUMN IF EXISTS "createdAt";--> statement-breakpoint
ALTER TABLE "customer_verification_otp" DROP COLUMN IF EXISTS "updatedAt";--> statement-breakpoint
ALTER TABLE "customer_verification_otp" DROP COLUMN IF EXISTS "deletedAt";--> statement-breakpoint
ALTER TABLE "customer_transactions" ADD CONSTRAINT "customer_transactions_transactionId_unique" UNIQUE("transactionId");