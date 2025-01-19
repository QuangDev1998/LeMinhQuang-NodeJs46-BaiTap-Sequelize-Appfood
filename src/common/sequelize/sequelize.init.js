import { Sequelize } from "sequelize";
import { DATABASE_URL } from "../constant/app.constant.js";
import initModels from "../../models/init-models.js";

const sequelize = new Sequelize(DATABASE_URL, { logging: false });
const models = initModels(sequelize);

sequelize
  .authenticate()
  .then((params) => {
    console.log("Kết Nối DB Thành Công");
  })
  .catch((params) => {
    console.log("Kết Nối DB Không Thành Công");
  });

export default models;
