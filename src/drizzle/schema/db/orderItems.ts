import { pgTable, uuid, integer, numeric } from "drizzle-orm/pg-core";
// Order_Items Table
export const orderItems = pgTable("order_items", {
  id: uuid("id").primaryKey(),
  orderId: uuid("order_id").notNull(),
  productId: uuid("product_id").notNull(),
  quantity: integer("quantity"),
  price: numeric("price", { precision: 10, scale: 2 }),
  unitPrice: numeric("unit_price", { precision: 10, scale: 2 }),
  totalPrice: numeric("total_price", { precision: 10, scale: 2 }),
});
