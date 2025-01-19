import express from "express";
import usersController from "../controllers/users.controller.js";
const usersRouter = express.Router();

usersRouter.get("/user-list", usersController.usesrsList);
usersRouter.get("/user-list/:id", usersController.addingUserListById);

usersRouter.post("/user-order", usersController.userOrder);
usersRouter.post("/user-rating-list", usersController.userRating);
usersRouter.post("/user-liked-list", usersController.userLikedList);

export default usersRouter;
