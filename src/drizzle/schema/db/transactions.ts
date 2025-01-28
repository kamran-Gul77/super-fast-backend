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
  id: uuid("id").primaryKey(),
  orderId: uuid("order_id").notNull(),
  paymentMethod: varchar("payment_method", { length: 100 }),
  paymentGateway: varchar("payment_gateway", { length: 100 }),
  transactionReference: varchar("transaction_reference", { length: 255 }),
  amount: numeric("amount", { precision: 10, scale: 2 }),
  taxAmount: numeric("tax_amount", { precision: 10, scale: 2 }),
  discountAmount: numeric("discount_amount", { precision: 10, scale: 2 }),
  currency: varchar("currency", { length: 10 }),
  status: varchar("status", { length: 50 }),
  failureReason: text("failure_reason"),
  transactionDate: timestamp("transaction_date"),
  createdAt: timestamp("created_at"),
});
