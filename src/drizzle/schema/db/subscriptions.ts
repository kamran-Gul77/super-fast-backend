import { pgTable, uuid, varchar, boolean, date } from "drizzle-orm/pg-core";
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
