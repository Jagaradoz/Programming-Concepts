// 1. Controlled Inputs
import React from "react";

function ControlledForm() {
  const [name, setName] = React.useState("");
  const [age, setAge] = React.useState("");
  function onSubmit(e) {
    e.preventDefault();
    console.log({ name, age });
  }
  return (
    <form onSubmit={onSubmit}>
      <input value={name} onChange={(e) => setName(e.target.value)} placeholder="Name" />
      <input value={age} onChange={(e) => setAge(e.target.value)} placeholder="Age" />
      <button type="submit">Save</button>
    </form>
  );
}

// 2. Uncontrolled Inputs with Refs
function UncontrolledForm() {
  const nameRef = React.useRef(null);
  function onSubmit(e) {
    e.preventDefault();
    console.log({ name: nameRef.current.value });
  }
  return (
    <form onSubmit={onSubmit}>
      <input ref={nameRef} defaultValue="Alice" />
      <button type="submit">Submit</button>
    </form>
  );
}

// 3. Checkbox/Radio/Select
function Preferences() {
  const [newsletter, setNewsletter] = React.useState(false);
  const [color, setColor] = React.useState("red");
  return (
    <div>
      <label>
        <input type="checkbox" checked={newsletter} onChange={(e) => setNewsletter(e.target.checked)} />
        Subscribe
      </label>
      <select value={color} onChange={(e) => setColor(e.target.value)}>
        <option value="red">Red</option>
        <option value="blue">Blue</option>
      </select>
    </div>
  );
}

// 4. Validation (basic)
function Signup() {
  const [email, setEmail] = React.useState("");
  const [error, setError] = React.useState(null);
  function onSubmit(e) {
    e.preventDefault();
    if (!/^[^@\s]+@[^@\s]+\.[^@\s]+$/.test(email)) {
      setError("Invalid email");
      return;
    }
    setError(null);
    console.log("ok");
  }
  return (
    <form onSubmit={onSubmit} noValidate>
      <input aria-invalid={!!error} value={email} onChange={(e) => setEmail(e.target.value)} />
      {error && <p role="alert">{error}</p>}
      <button type="submit">Create</button>
    </form>
  );
}

// 5. Debounced Input
function DebouncedInput({ value, onChange, delay = 300 }) {
  const [local, setLocal] = React.useState(value);
  React.useEffect(() => setLocal(value), [value]);
  React.useEffect(() => {
    const id = setTimeout(() => onChange(local), delay);
    return () => clearTimeout(id);
  }, [local, onChange, delay]);
  return <input value={local} onChange={(e) => setLocal(e.target.value)} />;
}

// Tips:
// - Controlled inputs are the React way for consistent state.
// - Use refs for simple forms or when integrating with non-React code.
// - Prevent default submit to avoid full page reload.
// - Keep validation errors in state; announce with aria for accessibility.


