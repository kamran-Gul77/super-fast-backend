import {
  pgTable,
  uuid,
  varchar,
  text,
  integer,
  numeric,
} from "drizzle-orm/pg-core";
// Products Table
export const products = pgTable("products", {
  id: uuid("id").defaultRandom().primaryKey(),
  storeId: uuid("store_id").notNull(),
  name: varchar("name", { length: 255 }).notNull(),
  subTitle: varchar("sub_title", { length: 255 }),
  price: numeric("price", { precision: 10, scale: 2 }).notNull(),
  stockQuantity: integer("stock_quantity").default(0).notNull(),
  categoryId: uuid("category_id").notNull(),
  sku: varchar("sku", { length: 255 }),
  slug: varchar("slug", { length: 255 }),
  discount: numeric("discount", { precision: 10, scale: 2 }).notNull(),
  features: text("features"),
  variants: text("variants"),
  images: text("images"),
  faqs: text("faqs"),
  status: varchar("status", { length: 255 }).notNull(),
});
