// To convert the transactionDate format from: 2024-08 to: August, 2024
export function formatInstallmentMonth(monthString: string): string {
  const [year, month] = monthString.split("-");

  const date = new Date(
    parseInt(year as string),
    parseInt(month as string) - 1,
  );
  const formattedDate = date.toLocaleString("en-US", {
    month: "long",
    year: "numeric",
  });

  return formattedDate;
}
