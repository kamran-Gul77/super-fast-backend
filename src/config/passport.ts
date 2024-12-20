import { Strategy as GoogleStrategy } from "passport-google-oauth20";
import "dotenv/config";
import { db } from "@/drizzle/db";
import passport from "passport";
import { UserTable } from "../drizzle/schema";
import { and, eq } from "drizzle-orm";
import { ApiError } from "@/utils/ApiError";
import { User } from "@/types/user";

// passport config
module.exports = (passport: any) => {
  passport.use(
    new GoogleStrategy(
      {
        clientID: process.env.GOOGLE_CLIENT_ID as string,
        clientSecret: process.env.GOOGLE_CLIENT_SECRET as string,
        callbackURL: process.env.GOOGLE_CALLBACK_URL as string,
      },
      async (accessToken, refreshToken, profile, done) => {
        try {
          // Checking if User is deleted
          const deletedUser: any = await db
            .select()
            .from(UserTable)
            .where(
              and(
                eq(UserTable.email, profile._json.email),
                eq(UserTable.isDeleted, true),
              ),
            );

          if (deletedUser.length > 0) {
            throw new ApiError(404, "User not found");
          }

          // Check if user already exists
          const existingUser: any = await db
            .select()
            .from(UserTable)
            .where(eq(UserTable.email, profile._json.email));

          // If user already exists, return it with done() callback
          if (existingUser.length) {
            done(null, { ...existingUser[0], isVerified: true });
            return;
          }

          // Get the current timestamp
          const createdAt = new Date().toISOString();

          // If user doesn't exist, insert it
          const insertedUser: any = await db
            .insert(UserTable)
            .values({
              email: profile._json.email,
              firstName: profile._json.given_name,
              lastName: profile._json.family_name,
              isVerified: true,
              createdAt,
            })
            .returning({
              id: UserTable.id,
            });

          // Return new user with generated access token
          done(null, insertedUser[0]);
        } catch (error) {
          done(error);
        }
      },
    ),
  );

  // serialize and deserialize user
  passport.serializeUser((user: User, done: any) => {
    // Loads user into req.session.passport.user
    done(null, user);
  });

  passport.deserializeUser(async (user: User, done: any) => {
    // Loads user into req.user
    try {
      // Check if user already exists
      const existingUser: any = await db
        .select()
        .from(UserTable)
        .where(eq(UserTable.email, user.email));

      if (!existingUser) {
        done(null, null);
      }
      done(null, existingUser);
    } catch (error) {
      done(error, null);
    }
  });
};
