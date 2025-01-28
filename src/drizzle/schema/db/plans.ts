import {
  pgTable,
  uuid,
  varchar,
  text,
  numeric,
  json,
} from "drizzle-orm/pg-core";
// Plans Table
export const plans = pgTable("plans", {
  id: uuid("id").primaryKey(),
  name: varchar("name", { length: 255 }),
  description: text("description"),
  price: numeric("price", { precision: 10, scale: 2 }),
  features: json("features"),
});
