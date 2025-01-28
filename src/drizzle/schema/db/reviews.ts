import { numeric, pgTable, uuid, varchar } from "drizzle-orm/pg-core";

// Reviews Table
export const reviews = pgTable("reviews", {
  id: uuid("id").primaryKey(),
  productId: uuid("product_id").notNull(),
  reviewerImageFileId: uuid("reviewer_image_file_id"),
  name: varchar("name", { length: 255 }),
  reviews: numeric("reviews", { precision: 1, scale: 5 }),
});
