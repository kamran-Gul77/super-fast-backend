import { randomBytes } from "crypto";

// Function to generate a random password reset token
export const generateResetToken = () => {
  return randomBytes(32).toString("hex");
};
