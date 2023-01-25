const Router = require('express');
const { login, signup } = require("../../controllers/auth/loginController")

const userRoutes = Router();

userRoutes.post("/login", login)
userRoutes.post("/signup", signup)

module.exports = userRoutes
