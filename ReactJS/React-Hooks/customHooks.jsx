// 1. Custom Hook Naming (use*)
import React from "react";

function useLocalStorage(key, initialValue) {
  const [value, setValue] = React.useState(() => {
    const raw = window.localStorage.getItem(key);
    return raw != null ? JSON.parse(raw) : initialValue;
  });
  React.useEffect(() => {
    window.localStorage.setItem(key, JSON.stringify(value));
  }, [key, value]);
  return [value, setValue];
}

function Example() {
  const [name, setName] = useLocalStorage("name", "Alice");
  return (
    <input value={name} onChange={(e) => setName(e.target.value)} />
  );
}

// Tips:
// - Extract reusable logic into custom hooks.
// - Hooks can call other hooks; follow the Rules of Hooks.
// - Keep inputs/outputs explicit and documented.


