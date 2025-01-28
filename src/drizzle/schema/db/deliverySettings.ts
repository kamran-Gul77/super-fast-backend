import { pgTable, uuid, varchar, numeric } from "drizzle-orm/pg-core";
// Delivery Settings Table
export const deliverySettings = pgTable("delivery_settings", {
  id: uuid("id").defaultRandom().primaryKey(),
  storeId: uuid("store_id").notNull(),
  provider: varchar("provider", { length: 255 }),
  deliveryCost: numeric("deliveryCost", { precision: 10, scale: 2 }).notNull(),
  estimatedTime: varchar("estimated_time", { length: 255 }),
});
