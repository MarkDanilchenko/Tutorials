import globals from "globals";
import pluginJs from "@eslint/js";
import pluginVue from "eslint-plugin-vue";
import prettier from "eslint-plugin-prettier/recommended";
import vueConfigPrettier from "@vue/eslint-config-prettier";

export default [
  pluginJs.configs.recommended,
  ...pluginVue.configs["flat/recommended"],
  prettier,
  {
    files: ["**/*.{js,mjs,cjs,vue}"],
  },
  {
    ignores: ["**/node_modules/**", "**/dist/**", "**/build/**", "**/coverage/**", ".nuxt/**", ".output/**"],
  },
  {
    languageOptions: {
      globals: {
        ...globals.browser,
        ...globals.node,
        ...globals.es2021,
        ...globals.jquery, // для корректного парсинга "$"
      },
    },
  },
  {
    rules: {
      ...vueConfigPrettier.rules,
      "prettier/prettier": [
        "error",
        {
          doubleQuote: true,
          printWidth: 120,
        },
      ],
      "vue/multi-word-component-names": "off",
      "vue/attribute-hyphenation": "warn",
      "vue/v-on-event-hyphenation": "warn",
      "prefer-const": "warn",
      "no-unused-vars": "error",
      "no-use-before-define": "error",
      "no-useless-constructor": "error",
      "no-console": "warn",
      semi: "error",
      "padding-line-between-statements": [
        "error",
        {
          blankLine: "always",
          prev: "*",
          next: "return",
        },
      ],
    },
  },
];
