// 1. Basic Usage
import React from "react";

function Counter() {
  const [count, setCount] = React.useState(0);
  return (
    <div>
      <p>Count: {count}</p>
      <button onClick={() => setCount(count + 1)}>Increment</button>
    </div>
  );
}

// 2. Updater Function (when next depends on previous)
function CounterSafe() {
  const [count, setCount] = React.useState(0);
  function increment() {
    setCount((c) => c + 1);
  }
  return <button onClick={increment}>+1</button>;
}

// 3. Lazy Initialization (expensive init runs once)
function initValue() {
  return 42;
}
function LazyInit() {
  const [value] = React.useState(initValue);
  return <div>{value}</div>;
}

// 4. Objects/Arrays: update immutably
function TodoList() {
  const [todos, setTodos] = React.useState([]);
  function addTodo(text) {
    setTodos((prev) => [...prev, { id: Date.now(), text, done: false }]);
  }
  function toggle(id) {
    setTodos((prev) => prev.map((t) => (t.id === id ? { ...t, done: !t.done } : t)));
  }
  return null;
}

// 5. Batching
// Multiple setState calls in the same event are batched.
// setX(1); setY(2); → one render.

// Tips:
// - Use updater form when next value depends on previous.
// - Avoid mutating state; always create new objects/arrays.
// - Derive transient values during render instead of storing them.


