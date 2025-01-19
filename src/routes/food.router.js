import express from "express";
import foodsController from "../controllers/foods.controller.js";

const foodsRouter = express.Router();
foodsRouter.get("/food-list", foodsController.foodsList);

export default foodsRouter;
