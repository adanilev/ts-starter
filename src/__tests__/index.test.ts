import { MockConstructorHelper } from "./mock-constructor-helper";
import { Greeter } from "../lib/greeter";

jest.mock("../lib/greeter");
jest.mock("./mock-constructor-helper");

describe("index", () => {
  it("should instantiate and call greeter", () => {
    require("../index");

    expect(MockConstructorHelper.greeter).toHaveBeenCalled();
    expect(Greeter["mockHello"]).toHaveBeenCalledWith("World");
  });
});
