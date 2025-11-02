# 1. Basic Match (switch-case style)
value = "B"

match value:
    case "A":
        print("Value is A")
    case "B":
        print("Value is B")    # Runs because value == "B"
    case "C":
        print("Value is C")
    case _:
        print("Default case")  # The wildcard (_) acts like "default"

# ---------------------------

# 2. Multiple Options in One Case
value = 2

match value:
    case 1 | 2 | 3:            # Matches any of 1,2,3
        print("Value is 1, 2, or 3")
    case _:
        print("Other value")

# ---------------------------

# 3. Value Capture (Bind matched value to a variable)
value = [1, 2, 3]

match value:
    case [a, b, c]:             # Unpacks list into variables
        print(f"a={a}, b={b}, c={c}")  # a=1, b=2, c=3
    case _:
        print("No match")

# ---------------------------

# 4. Nested Patterns
data = {"name": "Alice", "age": 25}

match data:
    case {"name": name, "age": age}:   # Match dictionary keys and bind values
        print(f"Name: {name}, Age: {age}")  # Name: Alice, Age: 25
    case _:
        print("Unknown data")

# ---------------------------

# 5. Class/Type Matching
class Point:
    def __init__(self, x, y):
        self.x = x
        self.y = y

p = Point(1, 2)

match p:
    case Point(x, y):              # Matches instance of Point and captures x,y
        print(f"Point at ({x}, {y})")

# ---------------------------

# 6. Guard (additional condition with `if`)
value = 15

match value:
    case x if x > 10:              # Executes only if x > 10
        print("Greater than 10")
    case x:
        print("10 or less")

# ---------------------------

# 7. Wildcards
value = [1, 2, 3, 4]

match value:
    case [first, *rest]:           # Captures first element and the rest of the list
        print(f"First={first}, Rest={rest}")  # First=1, Rest=[2,3,4]
    case _:
        print("No match")

# ---------------------------

# 8. Ignoring Values
value = (1, 2, 3)

match value:
    case (1, _, 3):                # _ ignores the middle element
        print("Matched first and last elements")  # Matched first and last elements

# ---------------------------

# 9. Combining Patterns
value = 10

match value:
    case 0 | 1 | 2 | 10:           # Matches multiple possible values
        print("Matched 0,1,2,10")
    case _:
        print("Other value")

# ---------------------------

# 10. Default Case
value = "unknown"

match value:
    case "A":
        print("A")
    case "B":
        print("B")
    case _:                        # Always matches if nothing else does
        print("Default matched")

# ---------------------------

# Notes:
# - match-case replaces switch-case from other languages.
# - Patterns can match literals, sequences, mappings, classes, and even nested structures.
# - Use `|` for multiple options, `_` for wildcard, and `if` for guards.
# - Values can be captured and reused within the case.
# - Match statements are exhaustive and readable for complex conditions.
