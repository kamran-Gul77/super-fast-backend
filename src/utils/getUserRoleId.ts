import dotenv from "dotenv";

dotenv.config();

// Function to get admin's roleId
export const getAdminRoleId = () => {
  switch (process.env.NODE_ENV) {
    case "production":
      return process.env.ADMIN_ROLE_ID_PROD;
    case "devback":
      return process.env.ADMIN_ROLE_ID_DEVBACK;
    default:
      return process.env.ADMIN_ROLE_ID_DEV;
  }
};

// Function to get candidate's roleId
export const getCandidateRoleId = () => {
  switch (process.env.NODE_ENV) {
    case "production":
      return process.env.CANDIDATE_ROLE_ID_PROD;
    case "devback":
      return process.env.CANDIDATE_ROLE_ID_DEVBACK;
    default:
      return process.env.CANDIDATE_ROLE_ID_DEV;
  }
};

// Function to get customer's roleId
export const getCustomerRoleId = () => {
  switch (process.env.NODE_ENV) {
    case "production":
      return process.env.CUSTOMER_ROLE_ID_PROD;
    case "devback":
      return process.env.CUSTOMER_ROLE_ID_DEVBACK;
    default:
      return process.env.CUSTOMER_ROLE_ID_DEV;
  }
};
