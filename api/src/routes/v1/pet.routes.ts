import express from "express";

//Import modules
import petController from "../../controllers/pet.controller";
import { authenticate } from "../../middlewares/authenticate";

const router = express.Router();

router.route("/").get(petController.getAllPets);  

router.route("/:id").get(petController.getPetByID);

export default router;