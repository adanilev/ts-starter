// https://www.draconianoverlord.com/2018/03/28/stubs-in-typescript.html
export type I<T> = { [key in keyof T]: T[key] };
