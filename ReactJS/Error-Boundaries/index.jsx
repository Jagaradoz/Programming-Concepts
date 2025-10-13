// 1. Class Error Boundary (React requires class for error boundaries)
import React from "react";

class ErrorBoundary extends React.Component {
  constructor(props) {
    super(props);
    this.state = { hasError: false };
  }
  static getDerivedStateFromError() {
    return { hasError: true };
  }
  componentDidCatch(error, info) {
    console.error("ErrorBoundary caught", error, info);
  }
  render() {
    if (this.state.hasError) {
      return <h2>Something went wrong.</h2>;
    }
    return this.props.children;
  }
}

function ProblemChild() {
  throw new Error("Boom");
}

function Example() {
  return (
    <ErrorBoundary>
      <ProblemChild />
    </ErrorBoundary>
  );
}

// Tips:
// - Error boundaries catch render errors in their subtree (not event handlers).
// - Use try/catch in event handlers for local handling.
// - Provide user-friendly fallback UI and optionally a retry action.


