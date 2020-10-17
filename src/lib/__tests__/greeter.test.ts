import { Greeter } from "../greeter";

describe(Greeter.name, () => {
  let sut: Greeter;

  beforeEach(() => {
    sut = new Greeter();
  });

  it("should return the expected greeting", () => {
    const fakeName = "World";

    const res = sut.hello(fakeName);

    expect(res).toBe(`Hello, ${fakeName}!`);
  });
});
