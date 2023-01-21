const HttpError = require("../../models/http-error");

const jwt = require("jsonwebtoken");
const { validationResult } = require("express-validator");
const bcrypt = require("bcryptjs");

const User = require("../../models/user");

exports.login = async (req, res, next) => {
  const { email, password } = req.body;

  let existingUser;

  try {
    existingUser = await User.findOne({ email });
  } catch (err) {
    const error = new HttpError(
      "Logging up failed, please try again later.",
      500
    );
    return next(error);
  }

  if (!existingUser) {
    const error = new HttpError(
      "Invalid credentials, could not log you in.",
      403
    );
    return next(error);
  }

  let isValidPassword = false;

  try {
    isValidPassword = await bcrypt.compare(password, existingUser.password);
  } catch (err) {
    const error = new HttpError(
      "could not log you in, please check your credentials and try again.",
      500
    );
    return next(error);
  }

  if (!isValidPassword) {
    const error = new HttpError(
      "Invalid credentials, could not log you in.",
      401
    );
    return next(error);
  }
  let accessToken;

  try {
    accessToken = jwt.sign(
      { userId: existingUser.id, email: existingUser.email },
      process.env.SECRET_KEY,
      { expiresIn: "1h" }
    );
  } catch (err) {
    console.log(err);

    const error = new HttpError("Logging in failed, please try again.", 500);
    return next(error);
  }

  res.json({
    userId: existingUser.id,
    user: existingUser.email,
    token: accessToken,
  });
};

exports.signup = async (req, res, next) => {
  const errors = validationResult(req);

  if (!errors.isEmpty()) {
    console.log(errors);
    res.status(422).json({ message: errors });

    return next(
      new HttpError("Invalid inputs passed, please check your data.", 422)
    );
  }

  let existingUser;
  const { name, email, password, image } = req.body;

  try {
    existingUser = await User.findOne({ email });
  } catch (err) {
    const error = new HttpError(
      "Signing up failed, please try again later",
      500
    );
    return next(error);
  }

  if (existingUser) {
    const error = new HttpError(
      "User exists already, please login instead",
      422
    );
    return next(error);
  }

  let hashedPassword;
  try {
    hashedPassword = await bcrypt.hash(password, 12);
  } catch (err) {
    const error = new HttpError(
      "Could not create user, please try again.",
      500
    );
    return next(error);
  }

  const createdUser = new User({
    name,
    email,
    image:
      "https://www.istockphoto.com/photo/female-portrait-icon-as-avatar-or-profile-picture-gm477333976-64396275?utm_source=unsplash&utm_medium=affiliate&utm_campaign=srp_photos_top&utm_content=https%3A%2F%2Funsplash.com%2Fs%2Fphotos%2Favatar-sihluette&utm_term=avatar%20sihluette%3A%3A%3A",
    password: hashedPassword,
    places: [],
  });

  try {
    await createdUser.save();
  } catch (err) {
    console.log(err);

    const error = new HttpError("Signing up failed, please try again.", 500);
    return next(error);
  }

  let accessToken;

  try {
    accessToken = jwt.sign(
      { userId: createdUser.id, email: createdUser.email },
      process.env.SECRET_KEY,
      { expiresIn: "1h" }
    );
  } catch (err) {
    console.log(err);

    const error = new HttpError("Signing up failed, please try again.", 500);
    return next(error);
  }
  res
    .status(201)
    .json({
      userId: createdUser.id,
      email: createdUser.email,
      token: accessToken,
    });
};
