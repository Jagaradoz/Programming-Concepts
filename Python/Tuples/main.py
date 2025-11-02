# 1. Creating Tuples
empty_tuple = ()                          # Empty tuple
single = (5,)                             # Single-element tuple (comma required)
nums = (1, 2, 3, 4, 5)                    # Tuple of integers
mixed = (1, "hello", 3.14, True)          # Mixed data types
nested = ((1, 2), (3, 4))                 # Nested tuples
from_tuple = tuple([10, 20, 30])          # Convert list → tuple

# ---------------------------

# 2. Accessing Elements
t = ("apple", "banana", "cherry")
print(t[0])                # 'apple'
print(t[-1])               # 'cherry'
print(t[1:])               # ('banana', 'cherry')
print(t[::-1])             # ('cherry', 'banana', 'apple')

# ---------------------------

# 3. Immutability
# Tuples cannot be modified once created.
# t[0] = "grape"           # ❌ TypeError
t = ("grape",) + t[1:]     # ✅ Creates new tuple

# ---------------------------

# 4. Tuple Length & Membership
print(len(t))              # 3
print("banana" in t)       # True
print("orange" not in t)   # True

# ---------------------------

# 5. Tuple Packing & Unpacking
person = ("Alice", 25, "Engineer")
name, age, job = person
print(name, age, job)      # Alice 25 Engineer

a, b, *c = (1, 2, 3, 4, 5)
print(a, b, c)             # 1 2 [3,4,5]

*a, b = (10, 20, 30, 40)
print(a, b)                # [10,20,30] 40

# ---------------------------

# 6. Tuple Operations
t1 = (1, 2, 3)
t2 = (4, 5)
print(t1 + t2)             # Concatenation → (1,2,3,4,5)
print(t1 * 2)              # Repetition → (1,2,3,1,2,3)
print(t1 == (1, 2, 3))     # True (equality check)

# ---------------------------

# 7. Tuple Methods
t = (10, 20, 30, 20, 40)
print(t.count(20))         # 2 → count occurrences
print(t.index(30))         # 2 → first index of value

# ---------------------------

# 8. Nested Tuples
matrix = (
    (1, 2, 3),
    (4, 5, 6),
    (7, 8, 9)
)
print(matrix[1][2])        # 6
flatten = tuple(num for row in matrix for num in row)
print(flatten)             # (1,2,3,4,5,6,7,8,9)

# ---------------------------

# 9. Tuple vs List (Key Differences)
# - Tuples are immutable
# - Tuples are faster and memory-efficient
# - Tuples can be used as dict keys; lists cannot

tuple_ex = (1, 2, 3)
list_ex = [1, 2, 3]

print(type(tuple_ex), type(list_ex))
d = {tuple_ex: "valid"}      # ✅ Works
# d = {list_ex: "error"}     # ❌ TypeError

# ---------------------------

# 10. Tuple as Return Values
def min_max(nums):
    return (min(nums), max(nums))

lo, hi = min_max([3, 5, 1, 9])
print(lo, hi)              # 1 9

# ---------------------------

# 11. Tuple Comprehension (Generator Expression)
# There's no tuple comprehension — use generator + tuple()
t = tuple(x**2 for x in range(5))
print(t)                   # (0,1,4,9,16)

# ---------------------------

# 12. Converting Between Types
nums_list = [1, 2, 3]
nums_tuple = tuple(nums_list)
print(nums_tuple)           # (1,2,3)
print(list(nums_tuple))     # [1,2,3]

# ---------------------------

# 13. Slicing Tuples
t = (0, 1, 2, 3, 4, 5)
print(t[:3])               # (0,1,2)
print(t[2:5])              # (2,3,4)
print(t[::2])              # (0,2,4)
print(t[::-1])             # (5,4,3,2,1,0)

# ---------------------------

# 14. Built-in Functions
t = (1, 2, 3, 4, 5)
print(len(t))              # 5
print(sum(t))              # 15
print(max(t))              # 5
print(min(t))              # 1
print(sorted(t))           # [1,2,3,4,5]
print(all(t))              # True (no 0)
print(any(t))              # True (has truthy values)

# ---------------------------

# 15. Tuple Comparison
t1 = (1, 2, 3)
t2 = (1, 3, 2)
print(t1 < t2)             # True (compares element-wise)
print((1, 2) < (1, 2, 3))  # True (shorter comes first if prefix matches)

# ---------------------------

# 16. Tuple of Tuples (Structured Data)
students = (
    ("Alice", 90),
    ("Bob", 85),
    ("Charlie", 95)
)
for name, score in students:
    print(f"{name}: {score}")

# ---------------------------

# 17. Tuple Memory Efficiency
import sys
lst = [1, 2, 3, 4, 5]
tpl = (1, 2, 3, 4, 5)
print(sys.getsizeof(lst), sys.getsizeof(tpl))  # Tuples use less memory

# ---------------------------

# 18. Named Tuples (Better Readability)
from collections import namedtuple

Point = namedtuple("Point", ["x", "y"])
p = Point(10, 20)
print(p.x, p.y)             # 10 20
print(p[0], p[1])           # 10 20 (still indexable)
print(p._asdict())          # {'x':10,'y':20}

# ---------------------------

# 19. Unpacking Tricks
coords = (1, 2, 3)
x, y, z = coords
print(f"x={x}, y={y}, z={z}")

# Swapping variables
a, b = 10, 20
a, b = b, a
print(a, b)                 # 20 10

# ---------------------------

# 20. Tuple Flattening
nested = ((1, 2), (3, 4), (5, 6))
flat = tuple(x for sub in nested for x in sub)
print(flat)                 # (1,2,3,4,5,6)

# ---------------------------

# 21. Tuples and Dictionaries
pairs = (("a", 1), ("b", 2))
d = dict(pairs)
print(d)                    # {'a':1,'b':2}

# Tuple keys (immutable → valid key)
valid_dict = {("x", 1): "data"}
print(valid_dict)

# ---------------------------

# 22. Looping Over Tuples
colors = ("red", "green", "blue")
for i, color in enumerate(colors):
    print(i, color)

# ---------------------------

# 23. Nesting & Flattening Mixed Tuples
data = (("A", (1, 2)), ("B", (3, 4)))
flattened = tuple((a, *b) for a, b in data)
print(flattened)            # (('A',1,2),('B',3,4))

# ---------------------------

# 24. Tuple Sorting
t = (3, 1, 4, 2)
print(sorted(t))             # [1,2,3,4]
print(tuple(sorted(t, reverse=True)))  # (4,3,2,1)

# ---------------------------

# 25. Membership & Counting
t = ("apple", "banana", "apple", "cherry")
print(t.count("apple"))      # 2
print("banana" in t)         # True

# ---------------------------

# 26. Converting Between Strings & Tuples
chars = tuple("HELLO")
print(chars)                 # ('H','E','L','L','O')
print("".join(chars))        # "HELLO"

# ---------------------------

# 27. Zipping Tuples
names = ("Alice", "Bob", "Charlie")
scores = (85, 90, 95)
combined = tuple(zip(names, scores))
print(combined)              # (('Alice',85),('Bob',90),('Charlie',95))

# ---------------------------

# 28. Tuple Utilities Recap
t = (10, 20, 30, 40)
print(len(t))
print(sum(t))
print(max(t))
print(min(t))
print(tuple(sorted(t)))

# ---------------------------

# 29. Tuple in Functions
def get_data():
    return "Alice", 25, "Engineer"      # Multiple return values (tuple)

info = get_data()
print(info)

name, age, job = get_data()
print(name, age, job)