require("dotenv").config(); // - comment in when testing locally
const http = require("http");
const app = require("./app");
const mongoose = require("mongoose");

const { accessSecret } = require("./src/utils/gcp");
const port = process.env.PORT || 4000;


app.set("port", port);
const server = http.createServer(app);

async function startUpApp() {
  mongoose
    .connect(await accessSecret(process.env.DB_CONNECTION_STRING) || process.env.DB_CONNECTION_STRING)
    .then(() => server.listen(port))
    .catch((err) => console.log(err));
}

startUpApp();
