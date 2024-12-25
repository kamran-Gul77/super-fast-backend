import {
  boolean,
  integer,
  pgTable,
  text,
  timestamp,
  uuid,
  varchar,
  json,
} from "drizzle-orm/pg-core";

// ========================================================================
// ============================= AUDIT FIELDS =============================

const auditFields_i = {
  createdAt: timestamp("createdAt", {
    mode: "string",
    withTimezone: true,
  }),
  updatedAt: timestamp("updatedAt", {
    mode: "string",
    withTimezone: true,
  }),
};

const auditFields_ii = {
  createdBy: uuid("createdBy").references(() => UserTable.id),
  updatedBy: uuid("updatedBy").references(() => UserTable.id),
  deletedBy: uuid("deletedBy").references(() => UserTable.id),
};

const auditFields_iii = {
  isDeleted: boolean("isDeleted").notNull().default(false),
  ...auditFields_i,
  deletedAt: timestamp("deletedAt", {
    mode: "string",
    withTimezone: true,
  }),
};

const auditFields_iv = {
  isDeleted: boolean("isDeleted").notNull().default(false),
  ...auditFields_i,
  deletedAt: timestamp("deletedAt", {
    mode: "string",
    withTimezone: true,
  }),
  ...auditFields_ii,
};

const auditFields_v = {
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

// ========================================================================
// ========================== ALL UPLOADED FILES ==========================

export const AllFilesTable = pgTable("all_files", {
  id: uuid("id").primaryKey().defaultRandom(),
  url: varchar("url", { length: 255 }).notNull(),
  name: varchar("name", { length: 255 }).notNull(),
  type: varchar("type", { length: 255 }).notNull(),
  size: integer("size").notNull(),
  cloudinaryPublicId: varchar("cloudinaryPublicId", { length: 255 }),
  ...auditFields_v,
});


// =============================================================================
// ====================== GOOGLE OAUTH SESSION =================================

export const SessionTable = pgTable("session", {
  sid: varchar("sid", { length: 255 }).primaryKey(),
  sess: json("sess"),
  expire: timestamp("expire", { mode: "string", withTimezone: true }),
});

// ===========================================================================
// ================================ USER ROLE ================================

export const UserRoleTable = pgTable("user_role", {
  id: uuid("id").primaryKey().defaultRandom(),
  role: varchar("role", { length: 255 }).notNull(),
  publicId: varchar("publicId", { length: 4 }).unique(),
});

// ======================================================================
// ================================ USER ================================

export const UserTable: any = pgTable("user", {
  id: uuid("id").primaryKey().defaultRandom(),
  roleId: uuid("roleId").references(() => UserRoleTable.id),
  email: varchar("email", { length: 100 }).notNull().unique(),
  username: varchar("username", { length: 18 }),
  password: varchar("password", { length: 64 }),
  firstName: varchar("firstName", { length: 20 }).notNull(),
  middleName: varchar("middleName", { length: 20 }),
  lastName: varchar("lastName", { length: 20 }),
  gender: varchar("gender", { length: 255 }),
  dateOfBirth: varchar("dateOfBirth", { length: 255 }),
  avatarId: uuid("avatarId").references(() => AllFilesTable.id),
  isVerified: boolean("isVerified").notNull().default(false),
  isActive: boolean("isActive").notNull().default(true),
  isLocked: boolean("isLocked").notNull().default(false),
  lastLogin: timestamp("lastLogin", { mode: "string", withTimezone: true }),
  lockedAt: timestamp("lockedAt", { mode: "string", withTimezone: true }),
  resetToken: varchar("resetToken", { length: 64 }),
  verificationToken: varchar("verificationToken", { length: 64 }),
  passwordResetToken: varchar("passwordResetToken", { length: 64 }),
  tokenExpiresAt: varchar("tokenExpiresAt", { length: 64 }),
  createdBy: varchar("createdBy", { length: 255 }),
  ...auditFields_iii,
});

// // ==================================================================================