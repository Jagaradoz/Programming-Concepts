// 1. React.memo for Pure Components
import React from "react";

const ListItem = React.memo(function ListItem({ item, onSelect }) {
  return <li onClick={() => onSelect(item.id)}>{item.label}</li>;
});

function List({ items, onSelect }) {
  return <ul>{items.map((it) => <ListItem key={it.id} item={it} onSelect={onSelect} />)}</ul>;
}

// 2. Stable Callbacks and Values
function Container({ items }) {
  const onSelect = React.useCallback((id) => console.log(id), []);
  const sorted = React.useMemo(() => [...items].sort((a, b) => a.label.localeCompare(b.label)), [items]);
  return <List items={sorted} onSelect={onSelect} />;
}

// 3. Keys
// - Use stable, unique keys from data (ids), not array index.

// 4. Avoid Unnecessary Renders
// - Colocate state, split components, memoize heavy branches.

// 5. Defer & Transition (concurrent features)
// const [isPending, startTransition] = React.useTransition()
// startTransition(() => setQuery(next)) // mark as low-priority

// Tips:
// - Measure first (React Profiler, performance marks) before optimizing.
// - Memoization has costs; apply selectively.
// - Ensure dependency arrays are correct to avoid stale values.


