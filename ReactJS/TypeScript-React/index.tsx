// 1. Props Typing
import React from 'react'

type ButtonProps = {
  label: string
  onClick?: () => void
  disabled?: boolean
}

export function Button({ label, onClick, disabled = false }: ButtonProps) {
  return <button disabled={disabled} onClick={onClick}>{label}</button>
}

// 2. State Typing (inference is fine)
export function Counter() {
  const [count, setCount] = React.useState(0)
  return <button onClick={() => setCount((c) => c + 1)}>{count}</button>
}

// 3. Generics
export function Select<T extends string | number>({ value, options, onChange }: { value: T; options: T[]; onChange: (v: T) => void }) {
  return (
    <select value={String(value)} onChange={(e) => onChange((e.target.value as unknown) as T)}>
      {options.map((opt) => (
        <option key={String(opt)} value={String(opt)}>{String(opt)}</option>
      ))}
    </select>
  )
}

// 4. Component Types
type CardProps = { children: React.ReactNode }
export const Card: React.FC<CardProps> = ({ children }) => (
  <div className="card">{children}</div>
)

// Tips:
// - Prefer explicit prop types; let state infer.
// - Use React.ReactNode for children.
// - Avoid any; use unknown then narrow.
// - Add tsconfig with strict settings.


