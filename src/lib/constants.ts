import { RequestColors } from "./types";

export const MAX_BODY_LENGTH_MORGAN_LOGS = 1000;

export const REQ_COLORS: RequestColors = {
  GET: "green",
  POST: "yellow",
  DELETE: "red",
  PATCH: "magenta",
  PUT: "blue",
};

// Valid values for Candidate Module
export const validValuesforMeetingStatus = {
  scheduled: true,
  cancelled: true,
  postponed: true,
  preponed: true,
};

export const validValuesforJobPostingStatus = {
  pending: true,
  scheduled: true,
  open: true,
  closed: true,
  extended: true,
  cancelled: true,
};

export const validTypesforJobPosting = {
  onsite: true,
  remote: true,
  hybrid: true,
};

export const validValuesforJobApplicationStatus = {
  new: true,
  viewed: true,
  "interview scheduled": true,
  "quiz scheduled": true,
  "quiz submitted": true,
  "offer sent": true,
  "offer declined": true,
  hired: true,
  rejected: true,
  withdrawn: true,
  "training scheduled": true,
};

export const validEvaluationStatusValues = new Set([
  "Pending",
  "Passed",
  "Failed",
]);

// Valid values for Customer Accounts
export const validCustomerAccountTypes = new Set([
  "isip",
  "islamic savings account",
  "growth plans",
  "takaful plan",
  "islamic mahana income account",
]);

export const validCustomerAccountSubTypes = new Set([
  "simple isip",
  "isip step up",
  "isip perpetual",
  "isip flexible",
  "individual",
  "joint",
  "minor",
  "corporate",
  "either or survivor",
]);
