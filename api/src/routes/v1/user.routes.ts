import express from "express";

//Import modules
import userController from "../../controllers/user.controller";
import { authenticate } from "../../middlewares/authenticate";

const router = express.Router();

router.route("/")
    .get(authenticate, userController.getUsers);

router.route("/:id")
    .get(authenticate, userController.getUserByID);

export default router;