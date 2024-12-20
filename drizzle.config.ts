// import { defineConfig } from "drizzle-kit";

// export default defineConfig({
//   schema: "./src/drizzle/schema.ts",
//   out: "./src/drizzle/migrations",
//   driver: "pg",
//   dbCredentials: {
//     connectionString: process.env.DATABASE_URL as string,
//   },
//   verbose: true,
//   strict: true,
// });

import { defineConfig } from "drizzle-kit";
import { getDatabaseUrl } from "./src/utils/getDatabaseUrl";
import dotenv from "dotenv";

dotenv.config();

export default defineConfig({
  schema: "./src/drizzle/schema.ts",
  out: "./src/drizzle/migrations",
  dialect: "postgresql",
  dbCredentials: {
    url: getDatabaseUrl(),
  },
  verbose: true,
  strict: true,
});
