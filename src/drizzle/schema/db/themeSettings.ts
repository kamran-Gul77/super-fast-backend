import { pgTable, uuid, text } from "drizzle-orm/pg-core";
// Theme_Settings Table
export const themeSettingsTable = pgTable("theme_settings", {
  id: uuid("id").primaryKey(),
  storeId: uuid("store_id").notNull(),
  appLogoFileId: uuid("app_logo_file_id"),
  faviconFileId: uuid("favicon_file_id"),
  heroImageFileId: uuid("hero_image_file_id"),
});
