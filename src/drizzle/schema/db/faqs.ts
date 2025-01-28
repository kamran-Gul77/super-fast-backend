import { pgTable, text, uuid } from "drizzle-orm/pg-core";

// FAQs Table
export const faqs = pgTable("faqs", {
  id: uuid("id").primaryKey(),
  productId: uuid("product_id").notNull(),
  storeId: uuid("store_id").notNull(),
  question: text("question"),
  answer: text("answer"),
});
