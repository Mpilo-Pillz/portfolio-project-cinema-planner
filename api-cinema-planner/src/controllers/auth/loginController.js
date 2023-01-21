const HttpError = require("../../models/http-error");
const { default: user } = require("../../models/user");
const User = require("../../models/user");

exports.login = async (req, res) => {
  const { email, password } = req.body;
  

  let existingUser = {
    email: "Dev",
    password: "dev",
  };

  try {
    existingUser = await User.find({}, "-password");
  } catch (err) {
    const error = new HttpError("Logging in failed, please try again later", 500);
    return next(err)
  }

  try {
    if (existingUser.email === email && existingUser.password === password) {
      res.json({ message: "You are logged in", isAuthenticated: true, accessToken: "th15IsS3cure" });
      return;
    }

    res.status(404).json({
      message: "Invalid Credentials Provided",
      isAuthenticated: false,
    });
  } catch (err) {
    return next(error);
  }
};
