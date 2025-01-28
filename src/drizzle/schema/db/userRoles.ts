import { pgTable, uuid, varchar } from "drizzle-orm/pg-core";

// User Roles Table
export const userRoles = pgTable("user_roles", {
  id: uuid("id").defaultRandom().primaryKey(),
  role: varchar("role", { length: 255 }).notNull(),
});
