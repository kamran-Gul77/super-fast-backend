import {
  createUser,
  deleteUser,
  getAllUser,
  getoneUser,
  updateUser,
} from "@/controllers/user.controller";
import { Router } from "express";

const router = Router();
router.route("/").post(createUser);
router.route("/").get(getAllUser);
router.route("/:id").get(getoneUser);
router.route("/:id").patch(updateUser);
router.route("/:id").delete(deleteUser);

export default router;
