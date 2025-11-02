# 1. Arithmetic Operators
a = 10
b = 3

print(a + b)        # Addition → 13
print(a - b)        # Subtraction → 7
print(a * b)        # Multiplication → 30
print(a / b)        # Division (float) → 3.333...
print(a // b)       # Floor division → 3
print(a % b)        # Modulus (remainder) → 1
print(a ** b)       # Exponentiation → 1000 (10³)

# ---------------------------

# 2. Assignment Operators
x = 5
x += 3              # x = x + 3 → 8
x -= 2              # x = x - 2 → 6
x *= 2              # x = x * 2 → 12
x /= 3              # x = x / 3 → 4.0
x //= 2             # x = x // 2 → 2.0
x %= 2              # x = x % 2 → 0.0
x **= 3             # x = x ** 3 → 0.0

# ---------------------------

# 3. Comparison Operators
a = 10
b = 5

print(a == b)       # Equal → False
print(a != b)       # Not equal → True
print(a > b)        # Greater than → True
print(a < b)        # Less than → False
print(a >= b)       # Greater or equal → True
print(a <= b)       # Less or equal → False

# ---------------------------

# 4. Logical Operators
x = True
y = False

print(x and y)      # Logical AND → False
print(x or y)       # Logical OR → True
print(not x)        # Logical NOT → False

# ---------------------------

# 5. Identity Operators
a = [1, 2, 3]
b = a
c = [1, 2, 3]

print(a is b)       # True  → same object
print(a is c)       # False → different objects
print(a is not c)   # True  → opposite of is

# ---------------------------

# 6. Membership Operators
nums = [1, 2, 3, 4, 5]

print(3 in nums)    # True  → 3 exists in list
print(6 not in nums)# True  → 6 not found

# ---------------------------

# 7. Bitwise Operators
x = 5               # 0101 (binary)
y = 3               # 0011 (binary)

print(x & y)        # AND → 1 (0001)
print(x | y)        # OR  → 7 (0111)
print(x ^ y)        # XOR → 6 (0110)
print(~x)           # NOT → -6 (inverts bits)
print(x << 1)       # Left shift → 10 (1010)
print(x >> 1)       # Right shift → 2 (0010)

# ---------------------------

# 8. Operator Precedence (from highest to lowest)
# **          Exponentiation
# ~ + -       Unary operations
# * / // %    Multiplication, division, modulus
# + -         Addition, subtraction
# << >>       Bitwise shifts
# &           Bitwise AND
# ^ |         Bitwise XOR, OR
# < > <= >=   Comparisons
# == !=       Equality
# = += -=     Assignment
# not and or  Logical operators

# ---------------------------

# 9. Chained Comparisons
x = 5
print(1 < x < 10)       # True → equivalent to (1 < x) and (x < 10)
print(x == 5 == True)   # False → checks both conditions

# ---------------------------

# 10. Ternary (Conditional) Operator
age = 18
status = "Adult" if age >= 18 else "Minor"    # Equivalent to ? : in other languages
print(status)                                 # "Adult"