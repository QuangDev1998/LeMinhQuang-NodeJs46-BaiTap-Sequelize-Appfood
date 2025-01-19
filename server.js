import express from "express";
import rootRouter from "./src/routes/root.router.js";
import { handleError } from "./src/common/helpers/error.helper.js";

const app = express();

// middleware giúp phân giải dữ liệu từ json sang đối tượng javascript
app.use(express.json());

app.use(rootRouter);

app.use(handleError);

app.listen(3069, () => {
  console.log(`Server Online At Port 3069`);
});
