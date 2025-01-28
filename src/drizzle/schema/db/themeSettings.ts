import { pgTable, uuid, text } from "drizzle-orm/pg-core";
export const themeSettings = pgTable("theme_settings", {
  id: uuid("id").defaultRandom().primaryKey(),
  storeId: uuid("store_id").notNull(),
  appLogo: text("app_logo"),
  favicon: text("favicon"),
  colors: text("colors"),
});
