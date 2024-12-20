import { VerifaliaRestClient } from "verifalia";
import dotenv from "dotenv";

dotenv.config();

export const verifaliaClient = new VerifaliaRestClient({
  username: process.env.VERIFALIA_USERNAME as string,
  password: process.env.VERIFALIA_PASSWORD as string,
});

// Function to validate an email
export const validateEmail = async (email: string) => {
  try {
    const result = await verifaliaClient.emailValidations.submit(email);
    return result?.entries[0]?.classification; // Check classification for validity
  } catch (error) {
    console.error("Error validating email:", error);
    throw new Error("Email validation failed");
  }
};
