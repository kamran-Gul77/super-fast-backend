import { pgTable, uuid, varchar, integer, numeric } from "drizzle-orm/pg-core";
// Campaigns Table
export const campaigns = pgTable("campaigns", {
  id: uuid("id").defaultRandom().primaryKey(),
  storeId: uuid("store_id").notNull(),
  type: varchar("type", { length: 255 }).notNull(),
  channel: varchar("channel", { length: 255 }).notNull(),
  revenueGenerated: numeric("revenueGenerated", {
    precision: 10,
    scale: 2,
  }).notNull(),
  discountCode: varchar("discount_code", { length: 255 }),
  uses: integer("uses").default(0),
});
