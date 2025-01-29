import {
  pgTable,
  uuid,
  varchar,
  text,
  integer,
  numeric,
  timestamp,
  json,
} from "drizzle-orm/pg-core";
// Products Table
export const productsTable = pgTable("products", {
  id: uuid("id").primaryKey().defaultRandom(),
  storeId: uuid("store_id").notNull(),
  categoryId: uuid("category_id").notNull(),
  name: varchar("name", { length: 255 }),
  subTitle: varchar("sub_title", { length: 255 }),
  price: numeric("price", { precision: 10, scale: 2 }),
  stockQuantity: integer("stock_quantity"),
  sku: varchar("sku", { length: 255 }),
  slug: varchar("slug", { length: 255 }),
  discount: numeric("discount", { precision: 5, scale: 2 }),
  features: text("features"),
  variants: json("variants"),
  status: varchar("status", { length: 50 }),
  createdAt: timestamp("created_at"),
  imageFileId: uuid("image_file_id"),
});
