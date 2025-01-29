import { pgTable, uuid, varchar } from "drizzle-orm/pg-core";

// Roles Table
export const rolesTable = pgTable("roles", {
  id: uuid("id").primaryKey(),
  roleName: varchar("role_name", { length: 100 }),
});
