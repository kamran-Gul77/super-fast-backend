import { boolean, pgTable, uuid, varchar } from "drizzle-orm/pg-core";

export const userTables = pgTable("user", {
  id: uuid("id").defaultRandom().primaryKey(),
  email: varchar("email", { length: 255 }).unique().notNull(),
  userName: varchar("userName", { length: 255 }).notNull(),
  status: boolean("status").default(false).notNull(),
});
