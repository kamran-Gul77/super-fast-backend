import {
  pgTable,
  uuid,
  varchar,
  boolean,
  timestamp,
} from "drizzle-orm/pg-core";
// Subscriptions Table
export const subscriptions = pgTable("subscriptions", {
  id: uuid("id").primaryKey(),
  storeId: uuid("store_id").notNull(),
  planId: uuid("plan_id").notNull(),
  status: varchar("status", { length: 50 }),
  startDate: timestamp("start_date"),
  endDate: timestamp("end_date"),
  autoRenew: boolean("auto_renew"),
});
