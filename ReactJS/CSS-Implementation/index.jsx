// 1. CSS Class Names
//    - Use className instead of class
function Box() {
  return <div className="box">Hello</div>;
}

// 2. Inline Styles (JS object, camelCased)
const InlineStyled = () => (
  <div style={{ backgroundColor: "#eef", padding: "12px", borderRadius: "8px" }}>
    Inline styled content
  </div>
);

// 3. Conditional Classes
function Button({ primary, disabled }) {
  const cls = `btn ${primary ? "btn--primary" : "btn--secondary"} ${disabled ? "is-disabled" : ""}`;
  return (
    <button className={cls} disabled={disabled}>
      Press
    </button>
  );
}

// 4. CSS Modules (scoped class names)
// File: Button.module.css
// .root { padding: 8px 12px; }
// .primary { background: #2563eb; color: white; }
//
// File: Button.jsx
// import styles from './Button.module.css'
// export default function Button({ primary }) {
//   return <button className={`${styles.root} ${primary ? styles.primary : ''}`}>OK</button>
// }

// 5. Styled-Components (CSS-in-JS)
// import styled from 'styled-components'
// const Card = styled.div`
//   padding: 16px;
//   border-radius: 8px;
//   background: #fff;
// `
// const Title = styled.h2`
//   font-size: 18px;
// `
// function Example() { return (<Card><Title>Hi</Title></Card>) }

// 6. Tailwind CSS (utility-first)
// <div className="p-4 rounded-md bg-slate-50 text-slate-900">Utility styles</div>

// 7. Dynamic Inline Styles from Props/State
function Progress({ value }) {
  return (
    <div style={{ width: 200, background: "#eee", borderRadius: 8 }}>
      <div style={{ width: `${value}%`, height: 8, background: "#22c55e", borderRadius: 8 }} />
    </div>
  );
}

// 8. CSS Variables
// :root { --brand: #7c3aed; }
// .cta { background: var(--brand); }

// 9. Global vs Scoped
// - Global styles for resets, typography scale, design tokens.
// - Scoped styles (modules/CSS-in-JS) for component-specific rules.

// 10. Animations & Transitions
// .fade-in { opacity: 0; animation: fade 300ms forwards; }
// @keyframes fade { to { opacity: 1; } }
// <div className="fade-in">Hello</div>

// Tips:
// - Prefer semantic HTML, then style.
// - Keep styles close to components for maintainability.
// - Use design tokens and scales for consistency.
// - Avoid overly specific selectors; prefer predictable class naming.
// - Prefer CSS Modules or CSS-in-JS to avoid global leakage.


