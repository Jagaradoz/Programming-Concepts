// 1. Lazy Loading Components
import React from "react";

const Heavy = React.lazy(() => import("./HeavyComponent"));

function App() {
  return (
    <React.Suspense fallback={<p>Loading...</p>}>
      <Heavy />
    </React.Suspense>
  );
}

// 2. Data Fetching with Suspense (future APIs / libraries)
// - Use libraries like React Query with suspense mode, or RSC (server components).

// 3. Route-based code-splitting (react-router)
// const About = React.lazy(() => import('./About'))
// <Route path="/about" element={
//   <Suspense fallback={<Spinner/>}>
//     <About />
//   </Suspense>
// }/>

// Tips:
// - Always wrap lazy components with Suspense and a fallback.
// - Group splits by route or heavy feature boundaries.
// - Keep fallbacks lightweight and accessible.


