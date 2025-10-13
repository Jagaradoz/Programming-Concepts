// 1. React Testing Library (RTL) Basics
// npm i -D @testing-library/react @testing-library/jest-dom

// Example Component
function Greet({ name }) {
  return <h1>Hello {name}</h1>;
}

// Example Test (Greet.test.jsx)
// import { render, screen } from '@testing-library/react'
// import '@testing-library/jest-dom'
// import Greet from './Greet'
// test('renders greeting', () => {
//   render(<Greet name="Ada" />)
//   expect(screen.getByText('Hello Ada')).toBeInTheDocument()
// })

// 2. User Events
// import userEvent from '@testing-library/user-event'
// userEvent.click(screen.getByRole('button', { name: /submit/i }))

// 3. Queries
// - getBy*, queryBy*, findBy* (async)
// - Prefer role-based queries (getByRole)

// Tips:
// - Test behavior, not implementation details.
// - Keep components accessible; it simplifies tests.
// - Mock network with MSW for integration tests.


