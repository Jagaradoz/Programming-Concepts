// 1. Basic Effect
import React from "react";

function TitleSync({ title }) {
  React.useEffect(() => {
    document.title = title;
  }, [title]);
  return null;
}

// 2. Cleanup (subscriptions, timers)
function Timer() {
  const [count, setCount] = React.useState(0);
  React.useEffect(() => {
    const id = setInterval(() => setCount((c) => c + 1), 1000);
    return () => clearInterval(id);
  }, []);
  return <div>{count}</div>;
}

// 3. Data Fetching in Effect
function Users() {
  const [users, setUsers] = React.useState([]);
  const [error, setError] = React.useState(null);
  React.useEffect(() => {
    let alive = true;
    async function run() {
      try {
        const res = await fetch("https://jsonplaceholder.typicode.com/users");
        const data = await res.json();
        if (alive) setUsers(data);
      } catch (e) {
        if (alive) setError(e);
      }
    }
    run();
    return () => { alive = false; };
  }, []);
  if (error) return <p>Error</p>;
  return <ul>{users.map((u) => <li key={u.id}>{u.name}</li>)}</ul>;
}

// 4. Dependencies
// - Include all external values used inside the effect.
// - For functions, prefer useCallback if passing as dependency.

// 5. Effects vs Event Handlers
// - Effects synchronize with external systems (DOM, network).
// - Event handlers respond to user interactions.

// Tips:
// - Clean up side effects to avoid leaks.
// - Keep effects minimal; derive values during render when possible.
// - Avoid conditional effects; guard inside the effect instead.


