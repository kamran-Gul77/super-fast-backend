import { db } from "@/drizzle/db";
import { UserRoleTable, UserTable } from "@/drizzle/schema";
import { eq } from "drizzle-orm";

// Function to get user role
export const getUserRole = async (userId: string): Promise<string> => {
  const [currentUser] = await db
    .select({ roleId: UserTable.roleId })
    .from(UserTable)
    .where(eq(UserTable.id, userId));

  if (!currentUser) {
    throw new Error(`User with ID ${userId} not found.`);
  }

  const [userRole] = await db
    .select({ publicId: UserRoleTable.publicId })
    .from(UserRoleTable)
    .where(eq(UserRoleTable.id, currentUser.roleId));

  if (!userRole) {
    throw new Error(
      `Role with ID ${currentUser.roleId} not found in UserRoleTable`,
    );
  }

  return userRole?.publicId as string;
};

export const getUserRoleViaTx = async (
  userId: string,
  trx: any,
): Promise<string> => {
  const [currentUser] = await trx
    .select({ roleId: UserTable.roleId })
    .from(UserTable)
    .where(eq(UserTable.id, userId));

  if (!currentUser) {
    throw new Error(`User with ID ${userId} not found.`);
  }

  const [userRole] = await trx
    .select({ publicId: UserRoleTable.publicId })
    .from(UserRoleTable)
    .where(eq(UserRoleTable.id, currentUser.roleId));

  if (!userRole) {
    throw new Error(
      `Role with ID ${currentUser.roleId} not found in UserRoleTable`,
    );
  }

  return userRole?.publicId as string;
};
