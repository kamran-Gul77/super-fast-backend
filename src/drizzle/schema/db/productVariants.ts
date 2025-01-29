import {
  integer,
  numeric,
  pgTable,
  timestamp,
  uuid,
  varchar,
} from "drizzle-orm/pg-core";

// Product_Variants Table
export const productVariantsTable = pgTable("product_variants", {
  id: uuid("id").primaryKey(),
  productId: uuid("product_id").notNull(),
  variantName: varchar("variant_name", { length: 255 }),
  variantValue: varchar("variant_value", { length: 255 }),
  price: numeric("price", { precision: 10, scale: 2 }),
  stockQuantity: integer("stock_quantity"),
  sku: varchar("sku", { length: 255 }),
  discount: numeric("discount", { precision: 5, scale: 2 }),
  status: varchar("status", { length: 50 }),
  createdAt: timestamp("created_at"),
});
