// 1. Basic onClick
function ClickMe() {
  function handleClick() {
    alert("Clicked!");
  }
  return <button onClick={handleClick}>Click</button>;
}

// 2. Passing Arguments
function RemoveItem({ id, onRemove }) {
  return <button onClick={() => onRemove(id)}>Remove</button>;
}

// 3. Prevent Default / Stop Propagation
function LinkLike() {
  function handle(e) {
    e.preventDefault();
    // do SPA navigation
  }
  return (
    <a href="/somewhere" onClick={handle}>
      Go
    </a>
  );
}

// 4. Synthetic Events (Keyboard, Mouse)
function KeyboardCapture() {
  function onKeyDown(e) {
    if (e.key === "Enter") {
      console.log("Submitted");
    }
  }
  return <input onKeyDown={onKeyDown} placeholder="Press Enter" />;
}

// 5. Form Events (onChange/onSubmit)
function LoginForm() {
  const [email, setEmail] = React.useState("");
  const [password, setPassword] = React.useState("");
  function onSubmit(e) {
    e.preventDefault();
    console.log({ email, password });
  }
  return (
    <form onSubmit={onSubmit}>
      <input value={email} onChange={(e) => setEmail(e.target.value)} />
      <input type="password" value={password} onChange={(e) => setPassword(e.target.value)} />
      <button type="submit">Login</button>
    </form>
  );
}

// 6. Focus/Blur
function FocusExample() {
  function onFocus() { console.log("focus"); }
  function onBlur() { console.log("blur"); }
  return <input onFocus={onFocus} onBlur={onBlur} />;
}

// 7. Mouse Events
function HoverCard() {
  function onEnter() { console.log("enter"); }
  function onLeave() { console.log("leave"); }
  return (
    <div onMouseEnter={onEnter} onMouseLeave={onLeave} className="card">
      Hover me
    </div>
  );
}

// 8. Event Delegation (list handlers)
function List({ items, onSelect }) {
  function handleClick(e) {
    const id = e.target.getAttribute("data-id");
    if (id) onSelect(id);
  }
  return (
    <ul onClick={handleClick}>
      {items.map((it) => (
        <li key={it.id} data-id={it.id}>{it.label}</li>
      ))}
    </ul>
  );
}

// Tips:
// - Handlers are recreated on every render; memoize when passing deep.
// - Prefer inline arrow for args only when cheap; otherwise prebind.
// - Always preventDefault on form submit to avoid page reload.
// - Use event.currentTarget for the element with the handler attached.


