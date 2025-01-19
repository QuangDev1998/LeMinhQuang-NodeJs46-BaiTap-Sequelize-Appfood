import { Sequelize } from "sequelize";
import models from "../common/sequelize/sequelize.init.js";
import { BadRequestException } from "../common/helpers/error.helper.js";
const restaurantsService = {
  restaurantsList: async () => {
    const restaurants = await models.restaurant.findAll();
    return restaurants;
  },
  restaurantLiked: async (req) => {
    const isLiked = await models.like_res.findAll({
      attributes: [
        [
          Sequelize.fn("COUNT", Sequelize.col("like_res.res_id")),
          "total_restaurants_likes",
        ],
      ],
      include: [
        {
          model: models.restaurant,
          as: "re",
          attributes: ["res_name"], // Fetch only the restaurant name
        },
      ],
      group: ["re.res_name"],
      order: [[Sequelize.literal("total_restaurants_likes"), "DESC"]],
      raw: true,
    });

    return isLiked;
  },

  restaurantlikedList: async (req) => {
    let { restaurant_id } = req.body;

    const findNameRestaurant = await models.restaurant.findOne({
      raw: true,
      where: {
        res_id: restaurant_id,
      },
    });
    if (!findNameRestaurant) {
      return "Nhà hàng không tồn tại";
    }
    const restaurants = await models.like_res.findAll({
      attributes: [
        [Sequelize.fn("COUNT", Sequelize.col("res_id")), "total_likes"],
      ],
      group: ["res_id"],
      where: {
        res_id: restaurant_id,
      },
      order: [[Sequelize.literal("total_likes"), "DESC"]],
      raw: true,
    });
    if (!restaurants.length) {
      return "Nhà hàng không được bất cứ ai ưa thích";
    }

    let resDataLiked = {
      restaurant: findNameRestaurant.res_name,
      totalLike: restaurants[0].total_likes,
    };

    return resDataLiked;
  },

  restaurantRatingList: async (req) => {
    const { res_id } = req.body;
    const restaurantName = await models.restaurant.findOne({
      where: {
        res_id,
      },
      raw: true,
    });

    if (!restaurantName) {
      throw new BadRequestException("Nhà hàng không tồn tại");
    }

    const restaurantRating = await models.rate_res.findAll({
      attributes: [
        [Sequelize.fn("COUNT", Sequelize.col("res_id")), "total_Rating"],
      ],
      group: ["res_id"],
      where: {
        res_id,
      },
      order: [[Sequelize.literal("total_Rating"), "DESC"]],
      raw: true,
    });

    if (!restaurantRating.length) {
      throw new BadRequestException("Nhà hàng này không được đánh giá");
    }

    const resDataRating = {
      restaurantName: restaurantName.res_name,
      restaurantRating: restaurantRating[0].total_Rating,
    };

    return resDataRating;
  },
  restaurantRating: async (req) => {
    let newDate = new Date();
    let { user_id, res_id, amount } = req.body;
    let createRating = await models.rate_res.create({
      user_id,
      res_id,
      amount,
      date_rate: newDate,
    });
    return createRating;
  },

  addingRestaurantsList: async (req) => {
    let { id, res_name, image, desc } = req.body;
    let restaurantsList = await models.restaurant
      .create({
        id,
        res_name,
        image,
        desc,
      })
      .then((res) => {
        console.log(res);
      })
      .catch((err) => {
        console.log("lli", err);
      });
    return restaurantsList;
  },
};

export default restaurantsService;
