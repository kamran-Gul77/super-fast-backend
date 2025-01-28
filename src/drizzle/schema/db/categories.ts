import { pgTable, uuid, varchar, text, integer } from "drizzle-orm/pg-core";
// Categories Table
export const categories = pgTable("categories", {
  id: uuid("id").primaryKey(),
  storeId: uuid("store_id").notNull(),
  name: varchar("name", { length: 255 }),
  slug: varchar("slug", { length: 255 }),
  description: text("description"),
  parentId: uuid("parent_id"),
});
