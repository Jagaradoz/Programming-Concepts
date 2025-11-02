# 1. Basic Try-Except
try:
    x = 10 / 0
except ZeroDivisionError:
    print("Cannot divide by zero")             # Catches specific exception

# ---------------------------

# 2. Catching Multiple Exceptions
try:
    x = int("abc")
    y = 10 / 0
except (ValueError, ZeroDivisionError) as e:
    print("Error occurred:", e)                # Handles multiple exceptions

# ---------------------------

# 3. Generic Exception
try:
    x = 10 / 0
except Exception as e:
    print("An error occurred:", e)             # Catches any exception

# ---------------------------

# 4. Else Block
try:
    x = 10 / 2
except ZeroDivisionError:
    print("Error")
else:
    print("No errors, result is", x)           # Executed only if no exception occurs

# ---------------------------

# 5. Finally Block
try:
    x = 10 / 0
except ZeroDivisionError:
    print("Error")
finally:
    print("This always runs")                  # Executed regardless of exception

# ---------------------------

# 6. Raising Exceptions
def divide(a, b):
    if b == 0:
        raise ValueError("b cannot be zero")  # Manually raise an exception
    return a / b

# divide(10, 0)                               # Would raise ValueError

# ---------------------------

# 7. Custom Exceptions
class MyError(Exception):
    pass

try:
    raise MyError("This is a custom error")
except MyError as e:
    print(e)                                   # Output: "This is a custom error"

# ---------------------------

# 8. Assertions
x = 5
assert x > 0, "x must be positive"            # Raises AssertionError if False

# ---------------------------

# 9. Exception Attributes
try:
    x = 10 / 0
except ZeroDivisionError as e:
    print("Type:", type(e))                    # <class 'ZeroDivisionError'>
    print("Args:", e.args)                     # Tuple of arguments passed to exception

# ---------------------------

# 10. Chaining Exceptions
try:
    try:
        x = int("abc")
    except ValueError as e:
        raise RuntimeError("Failed conversion") from e
except RuntimeError as e:
    print(e)                                   # Output: "Failed conversion"
    print("Original:", e.__cause__)           # Shows original ValueError

# ---------------------------

# 11. Context Managers and Exceptions
with open("nonexistent.txt") as f:
    data = f.read()                            # Will raise FileNotFoundError automatically

# Use try-except to handle context manager errors
try:
    with open("nonexistent.txt") as f:
        data = f.read()
except FileNotFoundError:
    print("File not found")