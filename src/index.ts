import { Greeter } from "./lib/greeter";

console.log(new Greeter().hello("World"));

if (process.env.FOO) {
  console.log(process.env.FOO);
}
