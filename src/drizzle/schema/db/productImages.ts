import { boolean, pgTable, timestamp, uuid } from "drizzle-orm/pg-core";

// Product_Images Table
export const productImages = pgTable("product_images", {
  id: uuid("id").primaryKey(),
  productId: uuid("product_id").notNull(),
  imageFileId: uuid("image_file_id").notNull(),
  isPrimary: boolean("is_primary").default(false),
  createdAt: timestamp("created_at").defaultNow(),
});
