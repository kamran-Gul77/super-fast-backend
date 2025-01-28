import { pgTable, text, uuid } from "drizzle-orm/pg-core";

// FAQs Table
export const faqs = pgTable("faqs", {
  id: uuid("id").defaultRandom().primaryKey(),
  productId: uuid("product_id").notNull(),
  question: text("question").notNull(),
  answer: text("answer").notNull(),
});
