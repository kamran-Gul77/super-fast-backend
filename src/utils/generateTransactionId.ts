import { v4 as uuidv4 } from "uuid";

export function generateUniqueTransactionId(type: string): string {
  const prefix = type.toUpperCase(); // e.g., "TXN", "WD", "DEP"
  const date = new Date().toISOString().slice(0, 10).replace(/-/g, ""); // YYYYMMDD
  const uniquePart = uuidv4().slice(0, 8); // Shortened UUID or use random numbers
  return `ISC-${prefix}-${date}-${uniquePart}`;
}
