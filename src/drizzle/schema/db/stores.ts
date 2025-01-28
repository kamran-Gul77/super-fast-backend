import { pgTable, uuid, varchar, text } from "drizzle-orm/pg-core";
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
