import { Sequelize } from "sequelize";
import models from "../common/sequelize/sequelize.init.js";
import { BadRequestException } from "../common/helpers/error.helper.js";

const usersService = {
  usersList: async (req) => {
    const usersNe = await models.user.findAll({ raw: true });
    return usersNe;
  },
  userLikedList: async (req) => {
    let { user_id } = req.body;
    const findNameUser = await models.user.findOne({
      raw: true,
      where: {
        user_id,
      },
    });
    if (!findNameUser) {
      return "user không tồn tại";
    }
    const users = await models.like_res.findAll({
      attributes: [
        [Sequelize.fn("COUNT", Sequelize.col("user_id")), "total_likes"],
      ],
      group: ["user_id"],
      where: {
        user_id: user_id,
      },
      order: [[Sequelize.literal("total_likes"), "DESC"]],
      raw: true,
    });
    console.log(users);
    if (!users.length) {
      return "Người dùng không tương tác";
    }
    let resDataLiked = {
      userName: findNameUser.full_name,
      totalLike: users[0].total_likes,
    };

    return resDataLiked;
  },
  userRating: async (req) => {
    const { user_id } = req.body;
    const userName = await models.user.findOne({
      where: {
        user_id,
      },
      raw: true,
    });
    if (!userName) {
      throw new BadRequestException("Người dùng không tồn tại");
    }

    const userRating = await models.rate_res.findAll({
      attributes: [
        [Sequelize.fn("COUNT", Sequelize.col("user_id")), "total_Rating"],
      ],
      group: ["user_id"],
      where: {
        user_id,
      },
      order: [[Sequelize.literal("total_Rating"), "DESC"]],
      raw: true,
    });

    if (!userRating.length) {
      throw new BadRequestException("nguoi dung này không được đánh giá");
    }

    const resDataRating = {
      userName: userName.full_name,
      userRating: userRating[0].total_Rating,
    };

    return resDataRating;
  },

  userOrder: async (req) => {
    let { user_id, food_id } = req.body;

    let userExist = await models.user.findOne({
      where: {
        user_id,
      },
      raw: true,
    });

    console.log(userExist);

    if (!userExist) {
      throw new BadRequestException("Người dùng không tồn tại");
    }

    let foodExist = await models.food.findOne({
      where: {
        food_id,
      },
      raw: true,
    });
    if (!foodExist) {
      throw new BadRequestException("Món ăn không tồn tại");
    }

    await models.order.create({
      user_id,
      food_id,
    });
    return "Order thành công";
  },
};
export default usersService;
