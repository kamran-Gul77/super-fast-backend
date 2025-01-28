import { pgTable, uuid, varchar, date, numeric } from "drizzle-orm/pg-core";
// Payments Table
export const payments = pgTable("payments", {
  id: uuid("id").defaultRandom().primaryKey(),
  subscriptionId: uuid("subscription_id").notNull(),
  transactionId: uuid("transaction_id").notNull(),
  amount: numeric("amount", { precision: 10, scale: 2 }).notNull(),
  status: varchar("status", { length: 255 }).notNull(),
  paymentDate: date("payment_date").notNull(),
});
