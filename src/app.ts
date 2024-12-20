import express from "express";
import cors from "cors";
import morganMiddleware from "@/config/morgan-config";
import passport from "passport";
import session from "express-session";
import dotenv from "dotenv";
import pg from "pg";
import "./config/passport";
import cookieParser from "cookie-parser";
import { getDatabaseUrl } from "./utils/getDatabaseUrl";
// import { genericInserts } from "./scripts/genericInserts";

dotenv.config();

const app = express();
app.use(cors({ origin: true }));
app.use(cookieParser());
app.use(morganMiddleware);
app.use(express.json());
app.use(express.urlencoded({ extended: true }));
app.use(express.static("public"));

// Passport config
require("./config/passport")(passport);

// PostgreSQL connection pool for sessions
const pgPool = new pg.Pool({
  connectionString: getDatabaseUrl(),
});

const PgStore = require("connect-pg-simple")(session);

// Sessions for Google Oauth 2.0
app.use(
  session({
    store: new PgStore({
      pool: pgPool,
      createTableIfMissing: true, // Automatically create session table if it doesn't exist (already set in schema.ts)
      SessionTable: "session", // Name of session table (matches schema.ts)
    }),
    secret: process.env.SESSION_SECRET as string, // Secret used to sign the session ID cookie
    resave: false, // Do not save the session back to the store if it wasn't modified
    saveUninitialized: false, // Do not create a session until something is stored
    cookie: {
      httpOnly: true, // Prevent client-side JavaScript from accessing the cookie
      secure: process.env.NODE_ENV === "production" ? true : false, // Use secure cookies in production - Set to true if using HTTPS
      maxAge: 1000 * 60 * 60 * 24 * 90, // Cookie expiration time (90 days)
    },
  }),
);

// Passport middleware for Google Oauth 2.0
app.use(passport.initialize());
app.use(passport.session());

// routes import
// import userRoutes from "./routes/user.routes";
// import candidateRoutes from "./routes/candidate.routes";
// import companyDepartmentRoutes from "./routes/companyDepartment.routes";
// import jobPostingRoutes from "./routes/jobPosting.routes";
// import quizRoutes from "./routes/quiz.routes";
// import authRoutes from "./routes/auth.routes";
// import jobApplicationRoutes from "./routes/jobApplication.routes";
// import uploadFilesRoutes from "./routes/uploadFiles.routes";
// import meetingRoutes from "./routes/meeting.routes";
// import customerRoutes from "./routes/customer.routes";
// import { customersMonthlyProfitCalculation } from "./scripts/customerProfitCalculation";

// routes decleration
// app.use("/api/v1/users", userRoutes);
// app.use("/api/v1/candidates", candidateRoutes);
// app.use("/api/v1/company-departments", companyDepartmentRoutes);
// app.use("/api/v1/jobPostings", jobPostingRoutes);
// app.use("/api/v1/jobApplications", jobApplicationRoutes);
// app.use("/api/v1/quizzes", quizRoutes);
// app.use("/api/v1/auth", authRoutes);
// app.use("/api/v1/files", uploadFilesRoutes);
// app.use("/api/v1/meetings", meetingRoutes);
// app.use("/api/v1/customers", customerRoutes);

app.get("/", (_, res) => {
  res.redirect("https://www.wakalatalistithmar.com/");
});

// migrateData();
// genericInserts();
// customersMonthlyProfitCalculation();

export { app };
