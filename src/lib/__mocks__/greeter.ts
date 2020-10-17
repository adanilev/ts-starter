import { Greeter as RealGreeter } from "../greeter";
import { I } from "../../models/public-interface.model";
import { MockConstructorHelper } from "../../__tests__/mock-constructor-helper";

export class Greeter implements I<RealGreeter> {
  private static mockHello = jest.fn();

  constructor(...args: any[]) {
    MockConstructorHelper.greeter(...args);
  }

  public hello = Greeter.mockHello;
}
