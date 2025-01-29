import {
  pgTable,
  uuid,
  varchar,
  date,
  numeric,
  timestamp,
} from "drizzle-orm/pg-core";
// Payments Table
export const paymentsTable = pgTable("payments", {
  id: uuid("id").primaryKey(),
  subscriptionId: uuid("subscription_id").notNull(),
  transactionId: varchar("transaction_id", { length: 255 }),
  amount: numeric("amount", { precision: 10, scale: 2 }),
  status: varchar("status", { length: 50 }),
  paymentDate: timestamp("payment_date"),
});
