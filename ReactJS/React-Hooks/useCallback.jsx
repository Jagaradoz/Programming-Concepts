// 1. Stable Callback for Child Props
import React from "react";

function Parent() {
  const [count, setCount] = React.useState(0);
  const onClick = React.useCallback(() => setCount((c) => c + 1), []);
  return (
    <div>
      <Child onClick={onClick} />
      <p>{count}</p>
    </div>
  );
}

const Child = React.memo(function Child({ onClick }) {
  return <button onClick={onClick}>Increment</button>;
});

// 2. useCallback vs useMemo
// - useCallback(fn, deps) is equivalent to useMemo(() => fn, deps)

// Tips:
// - Use when passing functions to memoized children or as effect deps.
// - Ensure dependencies are correct; include all referenced values.


