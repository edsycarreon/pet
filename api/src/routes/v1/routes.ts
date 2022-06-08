import express from "express";

// routes
import authRoute from "./auth.routes";
import userRoute from "./user.routes";
import petRoute from "./pet.routes";

const router = express.Router();

// initial request
router.get("/", (_req : express.Request, res : express.Response) => {
    res.send("-------[ Welcome to the PET API ]-------");
});

router.get("/ping", (_req : express.Request, res : express.Response) => {
    res.send("-------[ Pong ]-------");
});

// auth
router.use("/auth", authRoute);

// user
router.use("/persons", userRoute);

// pets
router.use("/pets", petRoute);

export default router;
