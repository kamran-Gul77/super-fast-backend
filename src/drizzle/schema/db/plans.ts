import { pgTable, uuid, varchar, text } from "drizzle-orm/pg-core";
// Plans Table
export const plans = pgTable("plans", {
  id: uuid("id").defaultRandom().primaryKey(),
  name: varchar("name", { length: 255 }).notNull(),
  description: text("description").notNull(),
  price: text("price").notNull(),
  features: text("features").notNull(),
});
