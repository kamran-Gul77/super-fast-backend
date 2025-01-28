import { pgTable, uuid, varchar } from "drizzle-orm/pg-core";

// Roles Table
export const roles = pgTable("roles", {
  id: uuid("id").primaryKey(),
  roleName: varchar("role_name", { length: 100 }),
});
