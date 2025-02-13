import "dotenv/config";
import { drizzle } from "drizzle-orm/postgres-js";
import { migrate } from "drizzle-orm/postgres-js/migrator";
import postgres from "postgres";

const DATABASE_URL = process.env.DB_URL;
const migrationClient = postgres(DATABASE_URL as string, { max: 1 });

async function main() {
  try {
    console.log("Starting migration...");
    await migrate(drizzle(migrationClient), {
      migrationsFolder: "./src/drizzle/migrations",
    });
    console.log("Migration completed successfully.");
  } catch (error: unknown) {
    if (error instanceof Error) {
      console.error("Migration failed:", error.message);
    } else {
      console.error("Migration failed with an unknown error:", error);
    }
    throw error;
  } finally {
    await migrationClient.end();
  }
}

main().catch((err) => {
  console.error("Error during migration ->", err);
  process.exit(1);
});
