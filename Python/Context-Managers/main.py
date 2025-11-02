# 1. Basic 'with' Statement
with open("example.txt", "w") as f:            # Automatically closes file
    f.write("Hello, Ja!")                      # File closed after block ends

# Equivalent to:
f = open("example.txt", "w")
try:
    f.write("Hello, Ja!")
finally:
    f.close()

# ---------------------------

# 2. Reading Files Safely
with open("example.txt", "r") as f:
    data = f.read()                            # Automatically handles closing
    print(data)

# ---------------------------

# 3. Multiple Context Managers
with open("input.txt", "r") as infile, open("output.txt", "w") as outfile:
    outfile.write(infile.read())               # Both files auto-closed

# ---------------------------

# 4. Creating Custom Context Manager (Class)
class MyContext:
    def __enter__(self):
        print("Entering context...")           # Runs before 'with' block
        return "Resource Active"

    def __exit__(self, exc_type, exc_value, traceback):
        print("Exiting context...")            # Always runs after block
        if exc_type:
            print(f"Error: {exc_value}")       # Handles exception (if any)
        return True                            # Suppresses exception if True

with MyContext() as resource:
    print(resource)                            # "Resource Active"
    # raise ValueError("Something went wrong!") # Uncomment to test exception

# ---------------------------

# 5. Context Manager Without Suppressing Exception
class NoSuppress:
    def __enter__(self):
        print("Entered")
        return self

    def __exit__(self, exc_type, exc_value, traceback):
        print("Exiting")
        return False                           # Propagates exception (default)

# ---------------------------

# 6. Using Context Manager for Timer
import time

class Timer:
    def __enter__(self):
        self.start = time.time()
        return self                            # Must return object if used with 'as'

    def __exit__(self, exc_type, exc_value, traceback):
        end = time.time()
        print(f"Elapsed time: {end - self.start:.3f}s")

with Timer():
    for _ in range(1_000_000):
        pass                                   # Measure loop time

# ---------------------------

# 7. Using contextlib.contextmanager (Function Style)
from contextlib import contextmanager

@contextmanager
def managed_resource(name):
    print(f"Opening resource {name}")
    yield name                                 # Code before yield → __enter__()
    print(f"Closing resource {name}")          # Code after yield → __exit__()

with managed_resource("FileResource") as res:
    print(f"Using {res}")

# ---------------------------

# 8. Handling Exceptions Inside contextlib Context
@contextmanager
def safe_context():
    try:
        print("Entering safe context")
        yield
    except Exception as e:
        print(f"Handled: {e}")
    finally:
        print("Exiting safe context")

with safe_context():
    print("Doing work...")
    # raise ValueError("Oops!")                # Uncomment to test

# ---------------------------

# 9. Suppressing Specific Exceptions
from contextlib import suppress

with suppress(FileNotFoundError):              # Ignore if file doesn't exist
    open("missing.txt")

print("Continuing after missing file...")

# ---------------------------

# 10. Redirecting Output Temporarily
import sys
from contextlib import redirect_stdout

with open("output.txt", "w") as f:
    with redirect_stdout(f):                   # Redirect print() output
        print("This goes into the file!")

# ---------------------------

# 11. Nested Context Managers (Recommended Way)
with (
    open("a.txt", "r") as a,
    open("b.txt", "w") as b
):
    b.write(a.read())

# ---------------------------

# 12. Custom Database Connection Example
class DatabaseConnection:
    def __enter__(self):
        print("Connecting to database...")
        self.connection = "DB Connection"
        return self.connection

    def __exit__(self, exc_type, exc_value, traceback):
        print("Closing database connection...")
        if exc_type:
            print("Error occurred:", exc_value)

with DatabaseConnection() as conn:
    print(conn)                                # "DB Connection"

# ---------------------------

# 13. Reusable Resource Context Manager
@contextmanager
def open_resource(name, mode):
    print(f"Opening {name} in {mode} mode...")
    f = open(name, mode)
    try:
        yield f                                # Yield control to user
    finally:
        print(f"Closing {name}")
        f.close()

with open_resource("data.txt", "w") as f:
    f.write("Data managed safely!")

# ---------------------------

# 14. Using contextlib.ExitStack for Dynamic Contexts
from contextlib import ExitStack

with ExitStack() as stack:
    files = [stack.enter_context(open(f"file{i}.txt", "w")) for i in range(3)]
    for f in files:
        f.write("Hello!\n")                    # All files auto-closed