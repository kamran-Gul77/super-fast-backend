CREATE TABLE IF NOT EXISTS "all_files" (
	"id" uuid PRIMARY KEY DEFAULT gen_random_uuid() NOT NULL,
	"url" varchar(255) NOT NULL,
	"name" varchar(255) NOT NULL,
	"type" varchar(255) NOT NULL,
	"size" integer NOT NULL,
	"cloudinaryPublicId" varchar(255),
	"createdAt" timestamp with time zone,
	"isDeleted" boolean DEFAULT false NOT NULL,
	"deletedAt" timestamp with time zone
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "session" (
	"sid" varchar(255) PRIMARY KEY NOT NULL,
	"sess" json,
	"expire" timestamp with time zone
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
	"lastName" varchar(20),
	"gender" varchar(255),
	"dateOfBirth" varchar(255),
	"avatarId" uuid,
	"isVerified" boolean DEFAULT false NOT NULL,
	"isActive" boolean DEFAULT true NOT NULL,
	"isLocked" boolean DEFAULT false NOT NULL,
	"lastLogin" timestamp with time zone,
	"lockedAt" timestamp with time zone,
	"resetToken" varchar(64),
	"verificationToken" varchar(64),
	"passwordResetToken" varchar(64),
	"tokenExpiresAt" varchar(64),
	"createdBy" varchar(255),
	"isDeleted" boolean DEFAULT false NOT NULL,
	"createdAt" timestamp with time zone,
	"updatedAt" timestamp with time zone,
	"deletedAt" timestamp with time zone,
	CONSTRAINT "user_email_unique" UNIQUE("email")
);
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
