// ========================================================================
// ============================= AUDIT FIELDS =============================

import { boolean, timestamp, uuid } from "drizzle-orm/pg-core";
import { usersTable } from "./users";

export const auditFields_i = {
  createdAt: timestamp("createdAt", {
    mode: "string",
    withTimezone: true,
  }),
  updatedAt: timestamp("updatedAt", {
    mode: "string",
    withTimezone: true,
  }),
};

export const auditFields_ii = {
  createdBy: uuid("createdBy").references(() => usersTable.id),
  updatedBy: uuid("updatedBy").references(() => usersTable.id),
  deletedBy: uuid("deletedBy").references(() => usersTable.id),
};

export const auditFields_iii = {
  isDeleted: boolean("isDeleted").notNull().default(false),
  ...auditFields_i,
  deletedAt: timestamp("deletedAt", {
    mode: "string",
    withTimezone: true,
  }),
};

export const auditFields_iv = {
  isDeleted: boolean("isDeleted").notNull().default(false),
  ...auditFields_i,
  deletedAt: timestamp("deletedAt", {
    mode: "string",
    withTimezone: true,
  }),
  ...auditFields_ii,
};

export const auditFields_v = {
  createdAt: timestamp("createdAt", {
    mode: "string",
    withTimezone: true,
  }),
  isDeleted: boolean("isDeleted").notNull().default(false),
  deletedAt: timestamp("deletedAt", {
    mode: "string",
    withTimezone: true,
  }),
};
