// 1. Fetch with useEffect
import React from "react";

function Posts() {
  const [posts, setPosts] = React.useState([]);
  const [loading, setLoading] = React.useState(true);
  const [error, setError] = React.useState(null);
  React.useEffect(() => {
    let alive = true;
    async function run() {
      try {
        const res = await fetch("https://jsonplaceholder.typicode.com/posts");
        if (!res.ok) throw new Error("Network error");
        const data = await res.json();
        if (alive) setPosts(data);
      } catch (e) {
        if (alive) setError(e);
      } finally {
        if (alive) setLoading(false);
      }
    }
    run();
    return () => { alive = false; };
  }, []);
  if (loading) return <p>Loading...</p>;
  if (error) return <p>Error</p>;
  return <ul>{posts.slice(0, 5).map((p) => <li key={p.id}>{p.title}</li>)}</ul>;
}

// 2. Fetch on Event
function SearchUsers() {
  const [query, setQuery] = React.useState("");
  const [results, setResults] = React.useState([]);
  async function search() {
    const res = await fetch(`https://api.example.com/users?q=${encodeURIComponent(query)}`);
    const data = await res.json();
    setResults(data);
  }
  return (
    <div>
      <input value={query} onChange={(e) => setQuery(e.target.value)} />
      <button onClick={search}>Search</button>
      <ul>{results.map((u) => <li key={u.id}>{u.name}</li>)}</ul>
    </div>
  );
}

// 3. SWR / React Query (note)
// SWR (vercel/swr) and React Query (TanStack) handle caching, revalidation,
// mutations, and background updates. Prefer them for non-trivial apps.
// Example with SWR:
// import useSWR from 'swr'
// const fetcher = (url) => fetch(url).then(r => r.json())
// function Profile() {
//   const { data, error, isLoading } = useSWR('/api/user', fetcher)
//   if (isLoading) return 'loading'
//   if (error) return 'error'
//   return <div>{data.name}</div>
// }

// Tips:
// - Handle loading and error states.
// - Abort or guard state updates on unmount to avoid leaks.
// - Cache and dedupe requests with a library in real apps.


