import express from "express";
import restaurantsController from "../controllers/restaurants.controller.js";
const restaurantRouter = express.Router();

restaurantRouter.get("/restaurant-list", restaurantsController.restaurantsList);

restaurantRouter.get(
  "/restaurant-liked",
  restaurantsController.restaurantLiked
);

restaurantRouter.post(
  "/restaurant-rating",
  restaurantsController.restaurantRating
);

restaurantRouter.post(
  "/restaurant-rating-list",
  restaurantsController.restaurantRatingList
);
restaurantRouter.post(
  "/restaurant-liked-list",
  restaurantsController.restaurantlikedList
);

restaurantRouter.post(
  "/restaurant-list",
  restaurantsController.addingRestaurantsList
);

export default restaurantRouter;
