import express from "express";
import foodsRouter from "./food.router.js";
import usersRouter from "./user.router.js";
import restaurantRouter from "./restaurant.router.js";
const rootRouter = express.Router();

rootRouter.get("/", (request, response, next) => {
  response.json("ok");
});

rootRouter.use("/foods", foodsRouter);
rootRouter.use("/users", usersRouter);
rootRouter.use("/restaurants", restaurantRouter);

export default rootRouter;
