//------------------------------------------------------
// 1. Basic Types
//------------------------------------------------------
let isDone: boolean = false;
let count: number = 42;
let someName: string = "TypeScript";
let arr1: number[] = [1, 2, 3];
let arr2: Array<string> = ["a", "b", "c"];
let tuple: [string, number] = ["age", 25];
let anything: any = 123; anything = "string";
let unknownVar: unknown = "maybe a string";
let n: null = null;
let u: undefined = undefined;
let sym: symbol = Symbol("id");
let big: bigint = 9007199254740991n;

//------------------------------------------------------
// 2. Enums
//------------------------------------------------------
enum Direction { Up = 1, Down, Left, Right }
let move: Direction = Direction.Up;
enum Status { Success = "SUCCESS", Error = "ERROR" }

//------------------------------------------------------
// 3. Type Aliases & Intersections
//------------------------------------------------------
type ID = number | string;
type User = { id: ID; name: string };
type Admin = User & { role: "admin" };
let admin: Admin = { id: 1, name: "Root", role: "admin" };

//------------------------------------------------------
// 4. Interfaces
//------------------------------------------------------
interface Person {
  name: string;
  age?: number;
  readonly id: ID;
  greet(msg: string): void;
}
let person: Person = {
  id: "001",
  name: "Alice",
  greet(msg) { console.log(msg); }
};
interface Employee extends Person { position: string; }

//------------------------------------------------------
// 5. Functions
//------------------------------------------------------
function add(a: number, b: number): number { return a + b; }
const sub = (a: number, b: number): number => a - b;
function greet(name: string = "World"): void { console.log(`Hello ${name}`); }
function sumAll(...nums: number[]): number { return nums.reduce((a, b) => a + b, 0); }

// Overloads
function reverse(x: string): string;
function reverse(x: number): number;
function reverse(x: string | number): string | number {
  return typeof x === "string" ? x.split("").reverse().join("") : Number(x.toString().split("").reverse().join(""));
}

//------------------------------------------------------
// 6. Classes
//------------------------------------------------------
class Animal {
  static kingdom = "Animalia";
  constructor(public name: string, protected sound: string) {}
  makeSound(): void { console.log(`${this.name} says ${this.sound}`); }
}
class Dog extends Animal {
  constructor(name: string) { super(name, "woof"); }
}
let d = new Dog("Buddy");
d.makeSound();

abstract class Shape { abstract area(): number; }
class Circle extends Shape {
  constructor(public radius: number) { super(); }
  area() { return Math.PI * this.radius ** 2; }
}

//------------------------------------------------------
// 7. Generics
//------------------------------------------------------
function identity<T>(arg: T): T { return arg; }
let num = identity<number>(5);
let str = identity("hello");
function merge<T, U>(a: T, b: U): T & U { return { ...a, ...b }; }
interface Box<T> { value: T; }
const box: Box<string> = { value: "TS" };
function getProp<T, K extends keyof T>(obj: T, key: K) { return obj[key]; }

//------------------------------------------------------
// 8. Type Utilities & Conditional Types
//------------------------------------------------------
type Keys = keyof Person;
type ReturnTypeExample = ReturnType<typeof add>;
type PartialPerson = Partial<Person>;
type RequiredPerson = Required<Person>;
type ReadonlyPerson = Readonly<Person>;
type PickName = Pick<Person, "name">;
type OmitID = Omit<Person, "id">;
type RecordType = Record<string, number>;
type NonNullableExample = NonNullable<string | null>;
type ExtractExample = Extract<"a" | "b", "a">;
type ExcludeExample = Exclude<"a" | "b", "a">;
type IsString<T> = T extends string ? "yes" : "no";
type Test = IsString<number>; // "no"

//------------------------------------------------------
// 9. Modules & Imports
//------------------------------------------------------
// export const value = 123;
// export function fn() {}
// export default class MyClass {}
// import MyClass, { value, fn } from "./module";

//------------------------------------------------------
// 10. Namespaces
//------------------------------------------------------
namespace Utils {
  export const PI = 3.14;
  export function square(x: number) { return x * x; }
}
console.log(Utils.square(4));

//------------------------------------------------------
// 11. Type Assertions & Casting
//------------------------------------------------------
let val: unknown = "hello";
let len1 = (val as string).length;
let len2 = (<string>val).length;

//------------------------------------------------------
// 12. Union, Intersection & Literal Types
//------------------------------------------------------
type DirectionType = "up" | "down" | "left" | "right";
type Input = string | number;
type Combined = User & { active: boolean };

//------------------------------------------------------
// 13. Never & Void
//------------------------------------------------------
function fail(msg: string): never { throw new Error(msg); }
function log(msg: string): void { console.log(msg); }

//------------------------------------------------------
// 14. Utility Types (Built-in)
//------------------------------------------------------
type Params = Parameters<typeof add>;
type ReturnVal = ReturnType<typeof sub>;
type CtorType = InstanceType<typeof Dog>;

//------------------------------------------------------
// 15. Decorators (Experimental)
//------------------------------------------------------
function Log(target: any, key: string) {
  console.log(`${key} was accessed`);
}
class Example {
  @Log
  sayHi() { console.log("Hi!"); }
}
function Controller(prefix: string) {
  return (constructor: Function) => { constructor.prototype.prefix = prefix; };
}
@Controller("/api")
class ApiService {}

//------------------------------------------------------
// 16. Advanced Features
//------------------------------------------------------
// Mapped Types
type Optional<T> = { [K in keyof T]?: T[K] };
type ReadOnly<T> = { readonly [K in keyof T]: T[K] };

// Template Literal Types
type EventName = `on${Capitalize<"click" | "hover" | "focus">}`;

// Satisfies Operator (TS 4.9+)
const config = {
  api: "/endpoint",
  timeout: 1000
} satisfies Record<string, string | number>;

// "as const"
const roles = ["admin", "user", "guest"] as const;
type Role = typeof roles[number];

//------------------------------------------------------
// 17. Type Guards & Narrowing
//------------------------------------------------------
function isString(value: unknown): value is string {
  return typeof value === "string";
}
function printLen(x: unknown) {
  if (isString(x)) console.log(x.length);
}

// 'in' keyword
function hasId(obj: any): obj is { id: number } {
  return "id" in obj;
}

// 'instanceof'
if (d instanceof Dog) d.makeSound();

//------------------------------------------------------
// 18. Tuples, Readonly, Variadic
//------------------------------------------------------
type RGB = [number, number, number];
const color: RGB = [255, 200, 0];
const readOnlyArr: readonly number[] = [1, 2, 3];
type Pair<T> = readonly [T, T];
const pair: Pair<string> = ["a", "b"];

// Variadic Tuple (TS 4.0+)
type Prepend<Head, Tail extends any[]> = [Head, ...Tail];
type Numbers = Prepend<number, [string, boolean]>; // [number, string, boolean]

//------------------------------------------------------
// 19. Infer Keyword (Type Extraction)
//------------------------------------------------------
type GetReturn<T> = T extends (...args: any[]) => infer R ? R : never;
type AddReturn = GetReturn<typeof add>; // number
type GetElement<T> = T extends (infer U)[] ? U : T;
type ArrayItem = GetElement<string[]>; // string

//------------------------------------------------------
// 20. Template Type Manipulations
//------------------------------------------------------
type SnakeToCamel<S extends string> =
  S extends `${infer T}_${infer U}` ? `${T}${Capitalize<SnakeToCamel<U>>}` : S;
type ExampleKey = SnakeToCamel<"hello_world_from_ts">; // "helloWorldFromTs"

//------------------------------------------------------
// 21. keyof, typeof, in, instanceof
//------------------------------------------------------
const user = { name: "Alice", age: 25 };
type UserKeys = keyof typeof user; // "name" | "age"
const key: UserKeys = "name";

//------------------------------------------------------
// 22. Readonly, Mutable, Deep types
//------------------------------------------------------
type DeepReadonly<T> = {
  readonly [K in keyof T]: T[K] extends object ? DeepReadonly<T[K]> : T[K];
};

//------------------------------------------------------
// 23. Symbols & BigInt
//------------------------------------------------------
const uniqueId = Symbol("unique");
const registry: Record<symbol, string> = { [uniqueId]: "value" };
const largeNum: bigint = 1234567890123456789n;

//------------------------------------------------------
// 24. Utility Helpers
//------------------------------------------------------
type Mutable<T> = { -readonly [K in keyof T]: T[K] };
type Nullable<T> = { [K in keyof T]: T[K] | null };
type DeepPartial<T> = { [K in keyof T]?: DeepPartial<T[K]> };

//------------------------------------------------------
// 25. Type Inference & Contextual Typing
//------------------------------------------------------
let nums = [1, 2, 3]; // inferred number[]
let obj = { a: 1, b: "two" }; // inferred type
const fn = (x = 10) => x * 2; // inferred parameter type

//------------------------------------------------------
// 26. TSConfig & Compiler Options (summary)
//------------------------------------------------------
// tsc --init
// "strict": true,
// "target": "ESNext",
// "module": "ESNext",
// "moduleResolution": "node",
// "esModuleInterop": true,
// "skipLibCheck": true,
// "forceConsistentCasingInFileNames": true,
// "noImplicitAny": true,
// "strictNullChecks": true,
// "resolveJsonModule": true,
// "isolatedModules": true,
// "allowJs": false,
// "declaration": true