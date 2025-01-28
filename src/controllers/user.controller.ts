import { db } from "@/drizzle/db";
import { userTables } from "@/drizzle/schema";
import { IUser } from "@/type";
import { eq } from "drizzle-orm";
import { Request, Response } from "express";
// interface User {
//     id: string;        // UUID string (default generated)
//     email: string;     // User's email (unique and required)
//     userName: string;  // User's username (required)
//     status: boolean;   // User's status (defaults to false)
//   }

export const createUser = async (req: Request, res: Response) => {
  const { email, userName, status } = req.body;

  if (!email || !userName || status === undefined) {
    throw new Error("Please provide all required fields");
  }
  const user: IUser[] = await db
    .insert(userTables)
    .values({ email, userName, status })
    .returning({
      id: userTables.id,
      email: userTables.email,
      userName: userTables.userName,
      status: userTables.status,
    });
  if (!user.length) {
    throw new Error("User could not be created");
  }
  res.status(201).json(user[0]);
};

export const getoneUser = async (req: Request, res: Response) => {
  const { id } = req.params;
  if (!id) {
    throw new Error("Please provide all required fields");
  }
  const user: IUser[] = await db
    .select({
      id: userTables.id,
      email: userTables.email,
      userName: userTables.userName,
      status: userTables.status,
    })
    .from(userTables)
    .where(eq(userTables.id, id));
  if (!user.length) {
    throw new Error("User not found");
  }
  res.status(201).json(user[0]);
};

export const getAllUser = async (req: Request, res: Response) => {
  const users: IUser[] = await db
    .select({
      id: userTables.id,
      email: userTables.email,
      userName: userTables.userName,
      status: userTables.status,
    })
    .from(userTables);

  res.status(201).json(users);
};

export const updateUser = async (req: Request, res: Response) => {
  const { email, userName, status } = req.body;
  const { id } = req.params;
  if (!id) {
    throw new Error("Please provide id");
  }
  if (!email && !userName && !status) {
    throw new Error("Please provide at least one fields");
  }
  const user: IUser[] = await db
    .update(userTables)
    .set({ email, userName, status })
    .where(eq(userTables.id, id))
    .returning({
      id: userTables.id,
      email: userTables.email,
      userName: userTables.userName,
      status: userTables.status,
    });
  if (!user.length) {
    throw new Error("User could not be updated");
  }
  res.status(201).json(user[0]);
};

export const deleteUser = async (req: Request, res: Response) => {
  await db.delete(userTables).where(eq(userTables.id, req.params.id));

  res.status(201).json({ message: "User deleted successfully" });
};
