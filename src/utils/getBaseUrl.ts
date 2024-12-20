// Function to select the appropriate base URL based on the environment
export function getBaseUrl(): string {
  const { NODE_ENV, BASE_URL_DEV, BASE_URL_DEVBACK, BASE_URL_PROD } =
    process.env;
  let baseUrl: string | undefined;

  switch (NODE_ENV) {
    case "development":
      baseUrl = BASE_URL_DEV;
      break;
    case "devback":
      baseUrl = BASE_URL_DEVBACK;
      break;
    case "production":
      baseUrl = BASE_URL_PROD;
      break;
    default:
      throw new Error(`Unknown environment: ${NODE_ENV}`);
  }

  if (!baseUrl) {
    throw new Error("BASE_URL is not defined for the current environment");
  }

  return baseUrl;
}
