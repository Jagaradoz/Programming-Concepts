# 1. Comparison Operators
a           = 10
b           = 5

print(a == b)       # Equal                   → False
print(a != b)       # Not equal               → True
print(a > b)        # Greater than            → True
print(a < b)        # Less than               → False
print(a >= b)       # Greater or equal        → True
print(a <= b)       # Less or equal           → False

# ---------------------------

# 2. Chained Comparisons
x           = 7
print(5 < x < 10)   # True                    → equivalent to (5 < x) and (x < 10)
print(1 <= x <= 7)  # True                    → equivalent to (1 <= x) and (x <= 7)

# ---------------------------

# 3. Conditional Statements (if / elif / else)
num         = 15

if num > 20:
    print("Greater than 20")               # Greater than 20
elif num == 15:
    print("Equal to 15")                   # Equal to 15
else:
    print("Less than 15")                  # Less than 15

# Nested if
if num > 0:
    if num % 2 == 0:
        print("Positive even number")     # Positive even number
    else:
        print("Positive odd number")      # Positive odd number

# ---------------------------

# 4. Loops

# For Loop (iterating over list)
nums        = [1, 2, 3, 4, 5]
for n in nums:
    print(n)                               # Iterates over each element

# For Loop with index using range(len())
for i in range(len(nums)):
    print(f"Index {i}, Value {nums[i]}")  # Prints index and value

# For Loop with enumerate (preferred way)
for idx, val in enumerate(nums):
    print(f"Index {idx}, Value {val}")    # Prints index and value

# For Loop with step and reverse
for i in range(10, 0, -2):                # From 10 down to 1, step -2
    print(i)                               # Prints numbers 10, 8, 6, 4, 2

# While Loop
count       = 0
while count < 5:
    print(count)                           # Prints 0 to 4
    count += 1                             # Increment counter to avoid infinite loop

# While Loop with break
count = 0
while True:
    print(count)                           # Prints count
    count += 1
    if count >= 3:
        break                              # Exit loop when condition met

# While Loop with continue
count = 0
while count < 5:
    count += 1
    if count % 2 == 0:
        continue                           # Skip even numbers
    print(count)                            # Prints only odd numbers

# ---------------------------

# 5. Break and Continue in For Loop
for i in range(10):
    if i == 5:
        break                              # Exit loop when i == 5
    if i % 2 == 0:
        continue                           # Skip even numbers
    print(i)                                # Prints only odd numbers < 5

# ---------------------------

# 6. For-Else / While-Else
for i in range(3):
    print(i)                                # Prints 0, 1, 2
else:
    print("For loop finished without break")  # Executes if loop not broken

count = 0
while count < 3:
    print(count)                            # Prints 0, 1, 2
    count += 1
else:
    print("While loop finished without break") # Executes if loop not broken

# ---------------------------

# 7. Switch Case Equivalent (Python 3.10+ uses match)
value       = "B"

match value:
    case "A":
        print("Value is A")               # Value is A
    case "B":
        print("Value is B")               # This will run
    case "C":
        print("Value is C")               # Value is C
    case _:
        print("Default case")             # Default if no match

# Match with multiple patterns
value = 2
match value:
    case 1 | 3 | 5:
        print("Odd number")               # Odd number
    case 2 | 4 | 6:
        print("Even number")              # This will run
    case _:
        print("Other number")             # Other number

# Match with guard (if condition)
value = 7
match value:
    case x if x > 5:
        print("Greater than 5")          # This will run
    case _:
        print("5 or less")                # 5 or less

# ---------------------------

# 8. Ternary / Conditional Expressions
score       = 85
result      = "Pass" if score >= 50 else "Fail"  # Ternary operator
print(result)                                    # Pass

# ---------------------------

# 9. Nested Ternary
age         = 20
category    = "Child" if age < 13 else "Teen" if age < 20 else "Adult"
print(category)                                 # Adult
