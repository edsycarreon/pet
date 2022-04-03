import express from "express";

import authController from "../../controllers/auth.controller";

const router = express.Router();

router.route("/signup")
    .post(authController.signUp);

router.route("/signin")
    .post(authController.signIn);

router.route("/token")
    .post(authController.refreshToken)
// logout

// get current session

export default router;