import { pgTable, uuid, varchar, text, timestamp } from "drizzle-orm/pg-core";
// Users Table
export const users = pgTable("users", {
  id: uuid("id").primaryKey(),
  roleId: uuid("role_id").notNull(),
  avatarId: uuid("avatar_id"),
  firstName: varchar("first_name", { length: 255 }),
  lastName: varchar("last_name", { length: 255 }),
  email: varchar("email", { length: 255 }),
  password: varchar("password", { length: 255 }),
  contactNumber: varchar("contact_number", { length: 50 }),
  whatsappNumber: varchar("whatsapp_number", { length: 50 }),
  address: text("address"),
  createdAt: timestamp("created_at"),
  updatedAt: timestamp("updated_at"),
});
