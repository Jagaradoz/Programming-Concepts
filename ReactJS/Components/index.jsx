// 1. Functional Component
//    - Modern standard
//    - Arrow function
//    - Class Component (old style)
import React, { Component } from "react";
import PropTypes from "prop-types";

function Greeting() {
  return <h1>Hello, React!</h1>;
}

const GreetingArrow = () => <h1>Hello, React!</h1>;

class Welcome extends Component {
  render() {
    return <h1>Welcome, {this.props.name}!</h1>;
  }
}

// 2. Props (passing data to a component)
function UserCard({ name, age }) {
  return (
    <div>
      <h2>{name}</h2>
      <p>Age: {age}</p>
    </div>
  );
}

// Usage:
<UserCard name="Alice" age={25} />;

// 3. Default Props
function Button({ label, color }) {
  return (
    <button style={{ backgroundColor: color, padding: "8px 12px" }}>
      {label}
    </button>
  );
}

Button.defaultProps = {
  label: "Click Me",
  color: "gray",
};

// Usage:
<Button />;
<Button label="Submit" color="green" />;

// 4. PropTypes (type checking for props)
Button.propTypes = {
  label: PropTypes.string.isRequired,
  color: PropTypes.string,
};

UserCard.propTypes = {
  name: PropTypes.string.isRequired,
  age: PropTypes.number,
};

// 5. Children Prop
function Wrapper({ children }) {
  return <div className="wrapper">{children}</div>;
}

// Usage:
<Wrapper>
  <p>This is inside Wrapper</p>
</Wrapper>;

// 6. Conditional Rendering
function Status({ isOnline }) {
  return <p>{isOnline ? "Online" : "Offline"}</p>;
}

// 7. Rendering Lists
function TodoList({ todos }) {
  return (
    <ul>
      {todos.map((todo, index) => (
        <li key={index}>{todo}</li>
      ))}
    </ul>
  );
}

// 8. Inline Styles
const StyledBox = () => (
  <div style={{ backgroundColor: "lightblue", padding: "10px" }}>
    Inline Styled Box
  </div>
);

// 9. Composing Components (nesting components)
function App() {
  const todos = ["Learn React", "Build App", "Deploy"];
  return (
    <div>
      <Greeting />
      <GreetingArrow />
      <UserCard name="Bob" age={30} />
      <Status isOnline={true} />
      <TodoList todos={todos} />
      <Button />
      <Button label="Save" color="blue" />
      <StyledBox />
    </div>
  );
}

// 10. Export and Import
// File: Greeting.jsx
export default Greeting;

// File: App.jsx
import Greeting from "./Greeting";

function App() {
  return <Greeting />;
}

// Tips:
// - Component names must start with a capital letter.
// - Must return a single root element.
// - Use PascalCase for component names.
// - Components should be reusable and isolated pieces of UI.
// - Use PropTypes for runtime type checking.
// - Use defaultProps to set fallback values when props aren’t provided.
