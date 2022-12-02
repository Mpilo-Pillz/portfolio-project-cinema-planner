const Router = require('express');
const { login } = require("../../controllers/auth/loginController")

const userRoutes = Router();

userRoutes.post("/login", login)

module.exports = userRoutes
