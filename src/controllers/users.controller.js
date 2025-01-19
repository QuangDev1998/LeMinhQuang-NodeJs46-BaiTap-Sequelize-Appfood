import e from "express";
import { responeSuccess } from "../common/helpers/respone.helper.js";
import usersService from "../services/users.service.js";

const usersController = {
  usesrsList: async (req, res, next) => {
    try {
      const users = await usersService.usersList(req);
      const resData = responeSuccess(users, " usesrsList Thành Công", 200);
      res.status(resData.code).json(resData);
    } catch (error) {
      console.log("error");
      next(error);
    }
  },
  userOrder: async (req, res, next) => {
    try {
      const users = await usersService.userOrder(req);
      const resData = responeSuccess(users, "userOrder Thành Công", 200);
      res.status(resData.code).json(resData);
    } catch (error) {}
  },
  userRating: async (req, res, next) => {
    try {
      const users = await usersService.userRating(req);
      const resData = responeSuccess(users, "userRating Thành Công", 200);
      res.status(resData.code).json(resData);
    } catch (error) {}
  },
  userLikedList: async (req, res, next) => {
    try {
      const users = await usersService.userLikedList(req);
      const resData = responeSuccess(users, "userLikedList Thành Công", 200);
      res.status(resData.code).json(resData);
    } catch (error) {}
  },
  addingUserListById: async (req, res, next) => {
    try {
      const users = await usersService.addingUserListById(req);
      const resData = responeSuccess(
        users,
        "addingUserListById Thành Công",
        200
      );
      res.status(resData.code).json(resData);
    } catch (error) {}
    next(e);
  },
};

export default usersController;
