import {
  integer,
  pgTable,
  timestamp,
  uuid,
  varchar,
} from "drizzle-orm/pg-core";

// Files Table
export const files = pgTable("files", {
  id: uuid("id").primaryKey(),
  url: varchar("url", { length: 255 }),
  name: varchar("name", { length: 255 }),
  type: varchar("type", { length: 255 }),
  size: integer("size"),
  cloudinaryPublicId: varchar("cloudinary_public_id", { length: 255 }),
  uploadedAt: timestamp("uploaded_at"),
});
