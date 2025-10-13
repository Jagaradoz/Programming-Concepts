// 1. DOM Refs
import React from "react";

function FocusInput() {
  const inputRef = React.useRef(null);
  function focus() {
    inputRef.current?.focus();
  }
  return (
    <div>
      <input ref={inputRef} />
      <button onClick={focus}>Focus</button>
    </div>
  );
}

// 2. Mutable Values Without Re-render
function Stopwatch() {
  const startRef = React.useRef(0);
  const [running, setRunning] = React.useState(false);
  function start() {
    startRef.current = Date.now();
    setRunning(true);
  }
  function stop() {
    setRunning(false);
  }
  return <button onClick={running ? stop : start}>{running ? "Stop" : "Start"}</button>;
}

// 3. Storing IDs, Timeouts
function DelayedAction() {
  const idRef = React.useRef(null);
  function trigger() {
    idRef.current = setTimeout(() => console.log("done"), 500);
  }
  function cancel() {
    if (idRef.current) clearTimeout(idRef.current);
  }
  return (
    <div>
      <button onClick={trigger}>Trigger</button>
      <button onClick={cancel}>Cancel</button>
    </div>
  );
}

// Tips:
// - Changing ref.current does not cause a re-render.
// - Use refs for imperative actions and storing mutable values.
// - Avoid reading/writing DOM directly; prefer React state when possible.


