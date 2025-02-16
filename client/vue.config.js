const { defineConfig } = require("@vue/cli-service");
const dotenv = require("dotenv");
const dotenvExpand = require("dotenv-expand");

const envCustom = dotenv.config({ path: "../.env.development" });
dotenvExpand(envCustom);

module.exports = defineConfig({
  transpileDependencies: true,
});
