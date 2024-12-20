// Function to generate a sequential folio number for the ISIP calculator
export function generateFolioNumber(
  lastFolioNumber: string | null | undefined,
): string {
  let baseNumber = 1300; // Starting base number
  let subNumber = 0; // Starting sub number (0-9)

  if (lastFolioNumber) {
    // Extracting base and sub number from the last folio number (e.g., "ISIP1300-5")
    const parts = lastFolioNumber.replace("ISIP", "").split("-");
    baseNumber = parseInt(parts[0]!, 10);
    subNumber = parseInt(parts[1]!, 10) + 1;

    // When subNumber exceeds 9, resetting it and incrementing the baseNumber
    if (subNumber > 9) {
      subNumber = 0;
      baseNumber++;
    }
  }

  return `ISIP${baseNumber}-${subNumber}`;
}

interface regularAccount {
  lastFolioNumber: string | null | undefined;
  accountType: string;
}

export function generateRegularAccountNumber(accountType: string): string {
  const prefix = "ISC"; // Prefix for accounts
  const now = new Date();

  // Get time components
  const hours = String(now.getHours()).padStart(2, "0");
  const minutes = String(now.getMinutes()).padStart(2, "0");
  const seconds = String(now.getSeconds()).padStart(2, "0");
  const milliseconds = String(now.getMilliseconds()).padStart(3, "0");

  // Extract first letter of each word in accountType
  const typeAbbreviation = accountType
    .split(" ") // Split the words
    .map((word) => word.charAt(0).toUpperCase()) // Take the first letter and capitalize it
    .join(""); // Combine letters into a single string

  // Combine components into the desired format
  const accountNumber = `${prefix}-${hours}${minutes}${seconds}${milliseconds}-${typeAbbreviation}`;

  return accountNumber;
}
