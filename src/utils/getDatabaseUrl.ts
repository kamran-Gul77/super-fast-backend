// Function to select the appropriate database URL based on the environment
export function getDatabaseUrl(): string {
  const {
    NODE_ENV,
    DATABASE_URL_DEV,
    DATABASE_URL_DEVBACK,
    DATABASE_URL_PROD,
  } = process.env;

  let databaseUrl: string | undefined;

  switch (NODE_ENV) {
    case "development":
      databaseUrl = DATABASE_URL_DEV as string;
      break;
    case "devback":
      databaseUrl = DATABASE_URL_DEVBACK as string;
      break;
    case "production":
      databaseUrl = DATABASE_URL_PROD as string;
      break;
    default:
      throw new Error(`Unknown environment: ${NODE_ENV}`);
  }

  if (!databaseUrl) {
    throw new Error("Database URL is not defined for the current environment");
  }

  return databaseUrl;
}
