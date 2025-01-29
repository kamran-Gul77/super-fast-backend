import { pgTable, uuid, varchar, text, timestamp } from "drizzle-orm/pg-core";

// Stores Table
export const storesTable = pgTable("stores", {
  id: uuid("id").primaryKey(),
  userId: uuid("user_id").notNull(),
  name: varchar("name", { length: 255 }),
  domain: varchar("domain", { length: 255 }),
  title: varchar("title", { length: 255 }),
  metaTitle: varchar("meta_title", { length: 255 }),
  description: text("description"),
  metaDescription: text("meta_description"),
  status: varchar("status", { length: 50 }),
  createdAt: timestamp("created_at"),
  logoFileId: uuid("logo_file_id"),
});
