import * as fs from "fs";
import { readFile, mkdir, writeFile } from "fs/promises";
import * as path from "path";
import chalk from "chalk";

export class Log {
  static success(str: string) {
    console.log(chalk.green(str));
  }
  static error(str: string) {
    console.log(chalk.red(str));
  }
  static info(str: string) {
    console.log(chalk.blue(str));
  }
}

export async function readJSON(filename: string) {
  const data = await readFile(filename, "utf8");
  const json = JSON.parse(data);
  Log.info(`JSON read from file: '${filename}'`);
  return json;
}
