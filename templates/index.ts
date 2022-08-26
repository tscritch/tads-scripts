import * as fs from "fs";
import * as path from "path";
import axios from "axios";
import { Log } from "./_utils";
import secrets from "./.secrets";

const request = {
  method: "get",
  url: "",
  headers: {
    Authorization: secrets.token,
  },
};

const response = await axios(request)
  .then(function (response: any) {
    Log.info(JSON.stringify(response.data, null, 2));
    return response.data;
  })
  .catch(function (error: any) {
    Log.error(error);
  });

Log.info(response);
