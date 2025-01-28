import { pgTable, uuid, varchar, text } from "drizzle-orm/pg-core";
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
