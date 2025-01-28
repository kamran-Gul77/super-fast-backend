import { pgTable, uuid, varchar, text, integer } from "drizzle-orm/pg-core";
// Categories Table
export const categories = pgTable("categories", {
  id: uuid("id").defaultRandom().primaryKey(),
  name: varchar("name", { length: 255 }).notNull(),
  slug: varchar("slug", { length: 255 }).notNull(),
  description: text("description"),
  metaDescription: text("meta_description"),
  metaTitle: varchar("meta_title", { length: 255 }),
  productCount: integer("product_count").default(0).notNull(),
  parentId: uuid("parent_id"),
  storeId: uuid("store_id").notNull(),
});
