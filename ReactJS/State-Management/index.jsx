// 1. Lifting State Up
import React from "react";

function TemperatureInput({ value, onChange, label }) {
  return (
    <label>
      {label}
      <input value={value} onChange={(e) => onChange(e.target.value)} />
    </label>
  );
}

function Calculator() {
  const [celsius, setCelsius] = React.useState("");
  const fahrenheit = celsius === "" ? "" : (Number(celsius) * 9) / 5 + 32;
  return (
    <div>
      <TemperatureInput label="Celsius" value={celsius} onChange={setCelsius} />
      <p>Fahrenheit: {fahrenheit}</p>
    </div>
  );
}

// 2. Context for Global-ish State
const AuthContext = React.createContext({ user: null, login: () => {}, logout: () => {} });

function AuthProvider({ children }) {
  const [user, setUser] = React.useState(null);
  const value = React.useMemo(
    () => ({ user, login: (u) => setUser(u), logout: () => setUser(null) }),
    [user]
  );
  return <AuthContext.Provider value={value}>{children}</AuthContext.Provider>;
}

function UserMenu() {
  const { user, logout } = React.useContext(AuthContext);
  if (!user) return <span>Guest</span>;
  return (
    <div>
      <span>{user.name}</span>
      <button onClick={logout}>Logout</button>
    </div>
  );
}

// 3. Reducer for Complex State
function reducer(state, action) {
  switch (action.type) {
    case "add":
      return { ...state, items: [...state.items, action.item] };
    case "remove":
      return { ...state, items: state.items.filter((it) => it.id !== action.id) };
    default:
      return state;
  }
}

function Cart() {
  const [state, dispatch] = React.useReducer(reducer, { items: [] });
  return (
    <div>
      <button onClick={() => dispatch({ type: "add", item: { id: Date.now(), name: "Item" } })}>Add</button>
      <ul>{state.items.map((it) => <li key={it.id}>{it.name}</li>)}</ul>
    </div>
  );
}

// Tips:
// - Start local: colocate state with the component that uses it.
// - Lift state to the nearest common parent when multiple children need it.
// - Use context for cross-cutting state, reducers for complex transitions.


