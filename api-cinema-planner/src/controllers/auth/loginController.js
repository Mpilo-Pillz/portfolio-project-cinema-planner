const HttpError = require("../../models/http-error");

exports.login = (req, res) => {
  const { email, password } = req.body;

  let existingUser = {
    email: "Dev",
    password: "dev",
  };

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
