import { pgTable, uuid, varchar, numeric } from "drizzle-orm/pg-core";
// Orders Table
export const orders = pgTable("orders", {
  id: uuid("id").defaultRandom().primaryKey(),
  storeId: uuid("store_id").notNull(),
  userId: uuid("user_id").notNull(),
  status: varchar("status", { length: 255 }).notNull(),
  totalAmount: numeric("totalAmount", { precision: 10, scale: 2 }).notNull(),
});
