import {
  pgTable,
  uuid,
  varchar,
  numeric,
  timestamp,
  integer,
  text,
} from "drizzle-orm/pg-core";

// Orders Table
export const ordersTable = pgTable("orders", {
  id: uuid("id").primaryKey(),
  storeId: uuid("store_id").notNull(),
  userId: uuid("user_id").notNull(),
  status: varchar("status", { length: 50 }),
  totalAmount: numeric("total_amount", { precision: 10, scale: 2 }),
  createdAt: timestamp("created_at"),
  orderNumber: varchar("order_number", { length: 100 }),
  totalItems: integer("total_items"),
  taxAmount: numeric("tax_amount", { precision: 10, scale: 2 }),
  discountAmount: numeric("discount_amount", { precision: 10, scale: 2 }),
  shippingAddress: text("shipping_address"),
  billingAddress: text("billing_address"),
});
