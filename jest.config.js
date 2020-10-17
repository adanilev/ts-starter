const testFolder = process.env.TEST_TYPE ? process.env.TEST_TYPE : "tests";

module.exports = {
  collectCoverage: false,
  collectCoverageFrom: ["src/**/*.ts"],
  coveragePathIgnorePatterns: ["node_modules/", "\\.model\\.ts$", "__.+?__/"],
  coverageDirectory: "reports/coverage",
  coverageReporters: ["json", "html", "text"],
  preset: "ts-jest",
  testEnvironment: "node",
  testMatch: [`**/__${testFolder}__/**/?(*.)test.ts?(x)`],
  testPathIgnorePatterns: ["/node_modules/", ".*\\.d\\.ts$"],
  setupFilesAfterEnv: ["./jest.setup.js"],
};
