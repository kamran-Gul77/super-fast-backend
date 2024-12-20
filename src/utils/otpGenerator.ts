// Function to generate OTP with a default length of 6
export const generateOTP = (length: number = 6) => {
  let otp = "";
  for (let i = 0; i < length; i++) {
    otp += Math.floor(Math.random() * 10).toString();
  }
  return otp;
};
