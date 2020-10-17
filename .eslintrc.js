module.exports = {
  root: true,
  extends: ["eslint:recommended", "plugin:prettier/recommended"],
  env: {
    es6: true,
    node: true,
    jest: true,
  },
  overrides: [
    {
      files: ["**/*.ts"],
      parser: "@typescript-eslint/parser",
      plugins: ["@typescript-eslint"],
      extends: [
        "eslint:recommended",
        "plugin:jest/recommended",
        "plugin:@typescript-eslint/recommended",
      ],
      overrides: [
        {
          files: ["**/__*__/**/*"],
          plugins: ["jest"],
          rules: {
            "jest/valid-title": ["error", { ignoreTypeOfDescribeName: true }],
            "@typescript-eslint/no-explicit-any": "off",
          },
        },
      ],
    },
  ],
};
