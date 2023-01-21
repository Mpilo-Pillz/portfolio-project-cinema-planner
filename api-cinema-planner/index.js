require("dotenv").config();
const http = require("http");
const app = require("./app");
const mongoose = require("mongoose");

const port = process.env.PORT || 4000;

app.set("port", port);
const server = http.createServer(app);

mongoose
  .connect(process.env.DB_CONNECTION_STRING)
  .then(() => server.listen(port))
  .catch((err) => console.log(err));
