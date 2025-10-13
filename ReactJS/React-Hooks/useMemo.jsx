// 1. Memoize Expensive Calculation
import React from "react";

function Fibonacci({ n }) {
  const value = React.useMemo(() => fib(n), [n]);
  return <div>fib({n}) = {value}</div>;
}

function fib(n) {
  if (n <= 1) return n;
  return fib(n - 1) + fib(n - 2);
}

// 2. Memoize Derived Data
function FilteredList({ items, query }) {
  const filtered = React.useMemo(
    () => items.filter((x) => x.toLowerCase().includes(query.toLowerCase())),
    [items, query]
  );
  return <ul>{filtered.map((x) => <li key={x}>{x}</li>)}</ul>;
}

// Tips:
// - Only memoize when expensive or causing re-render churn.
// - Dependencies must include all values used in the function.
// - Avoid premature optimization; measure first.


