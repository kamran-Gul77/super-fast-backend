// import { drizzle } from "drizzle-orm/postgres-js";

// import * as schema from "./schema";
// import postgres from "postgres";

// const client = postgres(process.env.DATABASE_URL as string);

// export const db = drizzle(client, { schema, logger: true });

import pg from "pg";
import { type NodePgDatabase, drizzle } from "drizzle-orm/node-postgres";
import * as schema from "./schema";
import dotenv from "dotenv";
import { getDatabaseUrl } from "@/utils/getDatabaseUrl";

dotenv.config();

const DATABASE_URL = getDatabaseUrl();
const pool = new pg.Pool({
  connectionString: DATABASE_URL as string,
});
const db = drizzle(pool, { schema }) as NodePgDatabase<typeof schema>;

export { db };
