// 1. Create Context
import React from "react";

const ThemeContext = React.createContext("light");

// 2. Provide Context at a higher level
function ThemeProvider({ children }) {
  const [theme, setTheme] = React.useState("light");
  const value = React.useMemo(() => ({ theme, setTheme }), [theme]);
  return <ThemeContext.Provider value={value}>{children}</ThemeContext.Provider>;
}

// 3. Consume Context in a child
function ThemeButton() {
  const { theme, setTheme } = React.useContext(ThemeContext);
  const isDark = theme === "dark";
  return (
    <button
      style={{ background: isDark ? "#111" : "#eee", color: isDark ? "#eee" : "#111" }}
      onClick={() => setTheme(isDark ? "light" : "dark")}
    >
      {isDark ? "Switch to Light" : "Switch to Dark"}
    </button>
  );
}

// 4. Avoid Prop Drilling
function Toolbar() {
  return (
    <div>
      <ThemeButton />
    </div>
  );
}

// 5. Multiple Contexts
// const AuthContext = React.createContext(null)
// const { user } = React.useContext(AuthContext)

// Tips:
// - Keep context values stable (useMemo) to avoid unnecessary re-renders.
// - Context is best for low-frequency updates (theme, locale, current user).
// - For high-churn state, prefer state colocated or use a state library.


