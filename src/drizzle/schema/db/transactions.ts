import {
  pgTable,
  uuid,
  varchar,
  text,
  numeric,
  timestamp,
} from "drizzle-orm/pg-core";
// Transactions Table
export const transactions = pgTable("transactions", {
  id: uuid("id").defaultRandom().primaryKey(),
  subscriptionId: uuid("subscription_id").notNull(),
  storeId: uuid("store_id").notNull(),
  transactionType: varchar("transaction_type", { length: 255 }).notNull(),
  amount: numeric("amount", { precision: 10, scale: 2 }).notNull(),
  status: varchar("status", { length: 255 }).notNull(),
  timestamp: timestamp("timestamp", { mode: "string", withTimezone: true }),
  description: text("description").notNull(),
});
