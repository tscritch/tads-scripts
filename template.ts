import axios from "axios";
import chalk from "chalk";

const config = {
  apiKey: "",
  token: "",
};

const request = {
  method: "get",
  url: "",
  headers: {
    Authorization: config.token,
  },
};

const response = await axios(request)
  .then(function (response) {
    console.log(JSON.stringify(response.data, null, 2));
    return response.data;
  })
  .catch(function (error) {
    console.log(chalk.red(error));
  });

console.log(chalk.blue("Hello world!"));
