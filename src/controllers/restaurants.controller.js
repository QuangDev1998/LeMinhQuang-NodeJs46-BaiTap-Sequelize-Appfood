import { responeSuccess } from "../common/helpers/respone.helper.js";
import models from "../common/sequelize/sequelize.init.js";
import restaurantsService from "../services/restaurants.service.js";

const restaurantsController = {
  restaurantsList: async (req, res, next) => {
    try {
      const restaurant = await restaurantsService.restaurantsList();
      const resData = responeSuccess(
        restaurant,
        "restaurantsList Thành công",
        200
      );
      res.status(resData.code).json(resData);
    } catch (error) {
      console.log(error);
    }
  },
  restaurantLiked: async (req, res, next) => {
    try {
      let restaurant = await restaurantsService.restaurantLiked(req);
      let resData = responeSuccess(
        restaurant,
        " restaurantLiked Thành Công",
        200
      );
      res.status(resData.code).json(resData);
    } catch (error) {
      console.log(error);
    }
  },
  restaurantlikedList: async (req, res, next) => {
    try {
      const restaurant = await restaurantsService.restaurantlikedList(req);
      const resData = responeSuccess(
        restaurant,
        "restaurantlikedList Thành Công",
        200
      );
      res.status(resData.code).json(resData);
    } catch (error) {
      console.log("loi", error);
    }
  },
  restaurantRating: async (req, res, next) => {
    try {
      const restaurant = await restaurantsService.restaurantRating(req);
      const resData = responeSuccess(
        restaurant,
        "restaurantRating Thành Công",
        200
      );
      res.status(resData.code).json(resData);
    } catch (error) {
      console.log("loi", error);
    }
  },
  restaurantRatingList: async (req, res, next) => {
    try {
      const restaurant = await restaurantsService.restaurantRatingList(req);
      const resData = responeSuccess(
        restaurant,
        "restaurantRatingList Thành Công",
        200
      );
      res.status(resData.code).json(resData);
    } catch (error) {
      next(error);
    }
  },

  addingRestaurantsList: async (req, res, next) => {
    try {
      const restaurant = await restaurantsService.addingRestaurantsList(req);
      const resdata = responeSuccess(
        restaurant,
        "addingRestaurantsList Thành Công",
        200
      );
      res.status(resdata.code).json(resdata);
    } catch (error) {
      next(error);
      console.log(error);
    }
  },
};

export default restaurantsController;
