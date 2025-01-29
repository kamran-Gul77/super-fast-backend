CREATE TABLE IF NOT EXISTS "faqs" (
	"id" uuid PRIMARY KEY NOT NULL,
	"product_id" uuid NOT NULL,
	"store_id" uuid NOT NULL,
	"question" text,
	"answer" text
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "plans" (
	"id" uuid PRIMARY KEY NOT NULL,
	"name" varchar(255),
	"description" text,
	"price" numeric(10, 2),
	"features" json
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "subscriptions" (
	"id" uuid PRIMARY KEY NOT NULL,
	"store_id" uuid NOT NULL,
	"plan_id" uuid NOT NULL,
	"status" varchar(50),
	"start_date" timestamp,
	"end_date" timestamp,
	"auto_renew" boolean
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "payments" (
	"id" uuid PRIMARY KEY NOT NULL,
	"subscription_id" uuid NOT NULL,
	"transaction_id" varchar(255),
	"amount" numeric(10, 2),
	"status" varchar(50),
	"payment_date" timestamp
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "transactions" (
	"id" uuid PRIMARY KEY NOT NULL,
	"order_id" uuid NOT NULL,
	"payment_method" varchar(100),
	"payment_gateway" varchar(100),
	"transaction_reference" varchar(255),
	"amount" numeric(10, 2),
	"tax_amount" numeric(10, 2),
	"discount_amount" numeric(10, 2),
	"currency" varchar(10),
	"status" varchar(50),
	"failure_reason" text,
	"transaction_date" timestamp,
	"created_at" timestamp
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "roles" (
	"id" uuid PRIMARY KEY NOT NULL,
	"role_name" varchar(100)
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "users" (
	"id" uuid PRIMARY KEY NOT NULL,
	"role_id" uuid NOT NULL,
	"avatar_id" uuid,
	"first_name" varchar(255),
	"last_name" varchar(255),
	"email" varchar(255),
	"password" varchar(255),
	"contact_number" varchar(50),
	"whatsapp_number" varchar(50),
	"address" text,
	"created_at" timestamp,
	"updated_at" timestamp
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "stores" (
	"id" uuid PRIMARY KEY NOT NULL,
	"user_id" uuid NOT NULL,
	"name" varchar(255),
	"domain" varchar(255),
	"title" varchar(255),
	"meta_title" varchar(255),
	"description" text,
	"meta_description" text,
	"status" varchar(50),
	"created_at" timestamp,
	"logo_file_id" uuid
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "theme_settings" (
	"id" uuid PRIMARY KEY NOT NULL,
	"store_id" uuid NOT NULL,
	"app_logo_file_id" uuid,
	"favicon_file_id" uuid,
	"hero_image_file_id" uuid
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "categories" (
	"id" uuid PRIMARY KEY NOT NULL,
	"store_id" uuid NOT NULL,
	"name" varchar(255),
	"slug" varchar(255),
	"description" text,
	"parent_id" uuid
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "products" (
	"id" uuid PRIMARY KEY DEFAULT gen_random_uuid() NOT NULL,
	"store_id" uuid NOT NULL,
	"category_id" uuid NOT NULL,
	"name" varchar(255),
	"sub_title" varchar(255),
	"price" numeric(10, 2),
	"stock_quantity" integer,
	"sku" varchar(255),
	"slug" varchar(255),
	"discount" numeric(5, 2),
	"features" text,
	"variants" json,
	"status" varchar(50),
	"created_at" timestamp,
	"image_file_id" uuid
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "orders" (
	"id" uuid PRIMARY KEY NOT NULL,
	"store_id" uuid NOT NULL,
	"user_id" uuid NOT NULL,
	"status" varchar(50),
	"total_amount" numeric(10, 2),
	"created_at" timestamp,
	"order_number" varchar(100),
	"total_items" integer,
	"tax_amount" numeric(10, 2),
	"discount_amount" numeric(10, 2),
	"shipping_address" text,
	"billing_address" text
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "order_items" (
	"id" uuid PRIMARY KEY NOT NULL,
	"order_id" uuid NOT NULL,
	"product_id" uuid NOT NULL,
	"quantity" integer,
	"price" numeric(10, 2),
	"unit_price" numeric(10, 2),
	"total_price" numeric(10, 2)
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "delivery_settings" (
	"id" uuid PRIMARY KEY DEFAULT gen_random_uuid() NOT NULL,
	"store_id" uuid NOT NULL,
	"provider" varchar(255),
	"deliveryCost" numeric(10, 2) NOT NULL,
	"estimated_time" varchar(255)
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "files" (
	"id" uuid PRIMARY KEY NOT NULL,
	"url" varchar(255),
	"name" varchar(255),
	"type" varchar(255),
	"size" integer,
	"cloudinary_public_id" varchar(255),
	"uploaded_at" timestamp
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "product_images" (
	"id" uuid PRIMARY KEY NOT NULL,
	"product_id" uuid NOT NULL,
	"image_file_id" uuid NOT NULL,
	"is_primary" boolean DEFAULT false,
	"created_at" timestamp DEFAULT now()
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "product_variants" (
	"id" uuid PRIMARY KEY NOT NULL,
	"product_id" uuid NOT NULL,
	"variant_name" varchar(255),
	"variant_value" varchar(255),
	"price" numeric(10, 2),
	"stock_quantity" integer,
	"sku" varchar(255),
	"discount" numeric(5, 2),
	"status" varchar(50),
	"created_at" timestamp
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "reviews" (
	"id" uuid PRIMARY KEY NOT NULL,
	"product_id" uuid NOT NULL,
	"reviewer_image_file_id" uuid,
	"name" varchar(255),
	"reviews" numeric(1, 5)
);
