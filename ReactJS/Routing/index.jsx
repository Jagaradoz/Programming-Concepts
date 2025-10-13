// 1. Setup (react-router-dom)
// import { BrowserRouter, Routes, Route, Link, useParams, useNavigate } from 'react-router-dom'

function AppRouter() {
  return (
    <BrowserRouter>
      <nav>
        <Link to="/">Home</Link>
        <Link to="/users">Users</Link>
      </nav>
      <Routes>
        <Route path="/" element={<Home />} />
        <Route path="/users" element={<Users />} />
        <Route path="/users/:id" element={<UserDetail />} />
        <Route path="*" element={<NotFound />} />
      </Routes>
    </BrowserRouter>
  );
}

function Home() { return <h1>Home</h1>; }

function Users() {
  const list = [ { id: 1, name: 'Alice' }, { id: 2, name: 'Bob' } ];
  return (
    <ul>
      {list.map(u => <li key={u.id}><Link to={`/users/${u.id}`}>{u.name}</Link></li>)}
    </ul>
  );
}

function UserDetail() {
  const params = useParams();
  return <h2>User {params.id}</h2>;
}

function NotFound() { return <h2>Not Found</h2>; }

// 2. Navigation
function BackButton() {
  const navigate = useNavigate();
  return <button onClick={() => navigate(-1)}>Back</button>;
}

// 3. Nested Routes
// <Route path="/settings" element={<Settings />}>
//   <Route path="profile" element={<Profile />} />
//   <Route path="security" element={<Security />} />
// </Route>

// 4. Query Params
// const [params] = useSearchParams();
// const page = params.get('page')

// Tips:
// - Wrap once at the app root with BrowserRouter.
// - Prefer <Link> for client navigation; avoid anchors.
// - Use route params for identifiers and search params for filters.


