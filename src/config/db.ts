import { pgTable, serial, text, varchar } from "drizzle-orm/pg-core";
import { drizzle } from "drizzle-orm/node-postgres";
import { Client } from "pg";
import dotenv from "dotenv";

dotenv.config();

// Validate the DB_URL
if (!process.env.DB_URL) {
  console.error(
    "DB_URL is not defined. Please check your environment variables.",
  );
  process.exit(1);
}

const client = new Client({
  connectionString: process.env.DB_URL,
});

export async function dbConnect() {
  try {
    await client.connect();
  } catch (err) {
    console.error("DB connection error", err);
    process.exit(1);
  }
}

export const db = drizzle(client);
