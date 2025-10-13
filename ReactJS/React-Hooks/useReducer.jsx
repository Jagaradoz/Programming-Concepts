// 1. Basic Reducer
import React from "react";

function reducer(state, action) {
  switch (action.type) {
    case "increment":
      return { ...state, count: state.count + 1 };
    case "decrement":
      return { ...state, count: state.count - 1 };
    default:
      return state;
  }
}

function Counter() {
  const [state, dispatch] = React.useReducer(reducer, { count: 0 });
  return (
    <div>
      <button onClick={() => dispatch({ type: "decrement" })}>-</button>
      <span>{state.count}</span>
      <button onClick={() => dispatch({ type: "increment" })}>+</button>
    </div>
  );
}

// 2. Lazy Initialization
function init(initialCount) {
  return { count: initialCount };
}
function LazyCounter({ initialCount = 0 }) {
  const [state, dispatch] = React.useReducer(reducer, initialCount, init);
  return <button onClick={() => dispatch({ type: "increment" })}>{state.count}</button>;
}

// Tips:
// - Prefer useReducer when state transitions are complex or related.
// - Keep actions plain objects with a type field.
// - Reducers must be pure (no side effects inside switch).


