describe("integration tests", () => {
  it("should not throw", () => {
    expect(() => {
      require("../index");
    }).not.toThrow();
  });
});
