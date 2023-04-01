const Router = require("express");
const { login, signup } = require("../../controllers/auth/loginController");
const {
  resetPassword,
} = require("../../controllers/auth/resetPasswordController");

const userRoutes = Router();

userRoutes.post("/login", login);
userRoutes.post("/signup", signup);
userRoutes.post("/resetPassword", resetPassword);

module.exports = userRoutes;
