import {
  pgTable,
  uuid,
  varchar,
  text,
  boolean,
  date,
  integer,
  numeric,
  timestamp,
} from "drizzle-orm/pg-core";

// FAQs Table
export const faqs = pgTable("faqs", {
  id: uuid("id").defaultRandom().primaryKey(),
  productId: uuid("product_id").notNull(),
  question: text("question").notNull(),
  answer: text("answer").notNull(),
});

// Plans Table
export const plans = pgTable("plans", {
  id: uuid("id").defaultRandom().primaryKey(),
  name: varchar("name", { length: 255 }).notNull(),
  description: text("description").notNull(),
  price: text("price").notNull(),
  features: text("features").notNull(),
});

// Subscriptions Table
export const subscriptions = pgTable("subscriptions", {
  id: uuid("id").defaultRandom().primaryKey(),
  storeId: uuid("store_id").notNull(),
  planId: uuid("plan_id").notNull(),
  status: varchar("status", { length: 255 }).notNull(),
  startDate: date("start_date").notNull(),
  endDate: date("end_date").notNull(),
  autoRenew: boolean("auto_renew").default(false).notNull(),
});

// Payments Table
export const payments = pgTable("payments", {
  id: uuid("id").defaultRandom().primaryKey(),
  subscriptionId: uuid("subscription_id").notNull(),
  transactionId: uuid("transaction_id").notNull(),
  amount: numeric("amount", { precision: 10, scale: 2 }).notNull(),
  status: varchar("status", { length: 255 }).notNull(),
  paymentDate: date("payment_date").notNull(),
});

// Transactions Table
export const transactions = pgTable("transactions", {
  id: uuid("id").defaultRandom().primaryKey(),
  subscriptionId: uuid("subscription_id").notNull(),
  storeId: uuid("store_id").notNull(),
  transactionType: varchar("transaction_type", { length: 255 }).notNull(),
  amount: numeric("amount", { precision: 10, scale: 2 }).notNull(),
  status: varchar("status", { length: 255 }).notNull(),
  timestamp: timestamp("timestamp", { mode: "string", withTimezone: true }),
  description: text("description").notNull(),
});

// User Roles Table
export const userRoles = pgTable("user_roles", {
  id: uuid("id").defaultRandom().primaryKey(),
  role: varchar("role", { length: 255 }).notNull(),
});

// Users Table
export const users = pgTable("users", {
  id: uuid("id").defaultRandom().primaryKey(),
  roleId: uuid("role_id").notNull(),
  name: varchar("name", { length: 255 }).notNull(),
  email: varchar("email", { length: 255 }).unique().notNull(),
  password: varchar("password", { length: 255 }).notNull(),
  contactNumber: varchar("contact_number", { length: 20 }),
  address: text("address"),
  location: text("location"),
});

// Stores Table
export const stores = pgTable("stores", {
  id: uuid("id").defaultRandom().primaryKey(),
  name: varchar("name", { length: 255 }).notNull(),
  userId: uuid("user_id").notNull(),
  domain: varchar("domain", { length: 255 }),
  title: varchar("title", { length: 255 }),
  metaTitle: varchar("meta_title", { length: 255 }),
  description: text("description"),
  metaDescription: text("meta_description"),
  status: varchar("status", { length: 255 }).notNull(),
});

// Theme Settings Table
export const themeSettings = pgTable("theme_settings", {
  id: uuid("id").defaultRandom().primaryKey(),
  storeId: uuid("store_id").notNull(),
  appLogo: text("app_logo"),
  favicon: text("favicon"),
  colors: text("colors"),
});

// Categories Table
export const categories = pgTable("categories", {
  id: uuid("id").defaultRandom().primaryKey(),
  name: varchar("name", { length: 255 }).notNull(),
  slug: varchar("slug", { length: 255 }).notNull(),
  description: text("description"),
  metaDescription: text("meta_description"),
  metaTitle: varchar("meta_title", { length: 255 }),
  productCount: integer("product_count").default(0).notNull(),
  parentId: uuid("parent_id"),
  storeId: uuid("store_id").notNull(),
});

// Products Table
export const products = pgTable("products", {
  id: uuid("id").defaultRandom().primaryKey(),
  storeId: uuid("store_id").notNull(),
  name: varchar("name", { length: 255 }).notNull(),
  subTitle: varchar("sub_title", { length: 255 }),
  price: numeric("price", { precision: 10, scale: 2 }).notNull(),
  stockQuantity: integer("stock_quantity").default(0).notNull(),
  categoryId: uuid("category_id").notNull(),
  sku: varchar("sku", { length: 255 }),
  slug: varchar("slug", { length: 255 }),
  discount: numeric("discount", { precision: 10, scale: 2 }).notNull(),
  features: text("features"),
  variants: text("variants"),
  images: text("images"),
  faqs: text("faqs"),
  status: varchar("status", { length: 255 }).notNull(),
});

// Orders Table
export const orders = pgTable("orders", {
  id: uuid("id").defaultRandom().primaryKey(),
  storeId: uuid("store_id").notNull(),
  userId: uuid("user_id").notNull(),
  status: varchar("status", { length: 255 }).notNull(),
  totalAmount: numeric("totalAmount", { precision: 10, scale: 2 }).notNull(),
});

// Order Items Table
export const orderItems = pgTable("order_items", {
  id: uuid("id").defaultRandom().primaryKey(),
  orderId: uuid("order_id").notNull(),
  productId: uuid("product_id").notNull(),
  quantity: integer("quantity").notNull(),
  price: numeric("price", { precision: 10, scale: 2 }).notNull(),
});

// Delivery Settings Table
export const deliverySettings = pgTable("delivery_settings", {
  id: uuid("id").defaultRandom().primaryKey(),
  storeId: uuid("store_id").notNull(),
  provider: varchar("provider", { length: 255 }),
  deliveryCost: numeric("deliveryCost", { precision: 10, scale: 2 }).notNull(),
  estimatedTime: varchar("estimated_time", { length: 255 }),
});

// Campaigns Table
export const campaigns = pgTable("campaigns", {
  id: uuid("id").defaultRandom().primaryKey(),
  storeId: uuid("store_id").notNull(),
  type: varchar("type", { length: 255 }).notNull(),
  channel: varchar("channel", { length: 255 }).notNull(),
  revenueGenerated: numeric("revenueGenerated", {
    precision: 10,
    scale: 2,
  }).notNull(),
  discountCode: varchar("discount_code", { length: 255 }),
  uses: integer("uses").default(0),
});
