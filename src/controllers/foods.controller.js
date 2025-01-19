import { responeSuccess } from "../common/helpers/respone.helper.js";
import foodsService from "../services/foods.service.js";

const foodsController = {
  foodsList: async (req, res, next) => {
    try {
      const foods = await foodsService.foodsList();
      const resData = responeSuccess(foods, "ok", 200);
      res.status(resData.code).json(resData);
    } catch (err) {
      console.log(err);
      next(err);
    }
  },
};

export default foodsController;
