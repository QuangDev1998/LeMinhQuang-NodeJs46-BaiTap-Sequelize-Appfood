import { responeError } from "./resposone.helper.js";

export const handleError = (err, req, res, next) => {
  const resData = responeError(err.message, err.code, err.stack);
  res.status(resData.code).json(resData);
};

export class BadRequestException extends Error {
  constructor(message = "BadRequestException") {
    super(message);
    this.code = 400;
  }
}

export class ForbiddenException extends Error {
  constructor(message = "ForbiddenException") {
    super(message);
    this.code = 403;
  }
}
