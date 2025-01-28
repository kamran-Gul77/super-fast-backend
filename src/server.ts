import express from "express";
import cors from "cors";
import morganMiddleware from "@/config/morgan-config";
import { cyan } from "colors";
import "./env";
import { dbConnect } from "./drizzle/db";
import userRoutes from "./routes/user.route";

async function bootstrapServer() {
  const app = express();
  app.use(cors());
  app.use(morganMiddleware);
  app.use(express.json());
  app.use(express.urlencoded({ extended: true }));
  app.use("/api/v1/users", userRoutes);

  await dbConnect();

  const port = process.env.PORT;

  app.listen(port, () => {
    console.log(
      `\nServer is up and running at: ${cyan(`http://localhost:${port}/`)}`,
    );
  });
}

bootstrapServer().catch((err: any) => {
  console.error(err.message);
  process.exit(1);
});
