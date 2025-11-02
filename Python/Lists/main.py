# 1. Creating Lists
empty_list = []                             # Empty list
nums = [1, 2, 3, 4, 5]                      # List of integers
mixed = [1, "hello", 3.14, True]            # Mixed types
nested = [[1, 2], [3, 4]]                   # Nested list
from_list = list((10, 20, 30))              # Using list() constructor

# ---------------------------

# 2. Accessing Elements
fruits = ["apple", "banana", "cherry"]
print(fruits[0])            # "apple" (first element)
print(fruits[-1])           # "cherry" (last element)
print(fruits[1:])           # ['banana', 'cherry']
print(fruits[::-1])         # ['cherry', 'banana', 'apple'] → reversed

# ---------------------------

# 3. Modifying Lists
fruits[1] = "blueberry"     # Modify element
print(fruits)               # ['apple', 'blueberry', 'cherry']

fruits.append("date")       # Add to end
fruits.insert(1, "banana")  # Insert at index
fruits.extend(["elderberry", "fig"])  # Add multiple items
print(fruits)

# ---------------------------

# 4. Removing Elements
fruits.remove("apple")      # Remove by value (error if not found)
popped = fruits.pop()       # Removes last and returns it
popped2 = fruits.pop(1)     # Removes index 1 and returns it
del fruits[0]               # Delete by index
# del fruits                 # Delete entire list
print(fruits)

# ---------------------------

# 5. Clearing & Copying
fruits.clear()              # Remove all items
nums_copy = nums.copy()     # Shallow copy
nums_clone = list(nums)     # Another way to copy
print(nums_copy)

# ---------------------------

# 6. Searching in Lists
nums = [10, 20, 30, 40, 20]
print(20 in nums)           # True
print(nums.index(20))       # 1 (first occurrence)
print(nums.count(20))       # 2 (number of occurrences)

# ---------------------------

# 7. Sorting & Reversing
nums.sort()                 # Sort ascending (in-place)
nums.sort(reverse=True)     # Sort descending
print(sorted(nums))         # Returns new sorted list
nums.reverse()              # Reverse list order (in-place)
print(nums)

# Custom sorting
words = ["apple", "Banana", "cherry"]
words.sort(key=str.lower)   # Case-insensitive sort
print(words)

# ---------------------------

# 8. List Comprehensions
squares = [x**2 for x in range(6)]          # [0,1,4,9,16,25]
evens = [x for x in range(10) if x % 2 == 0]
flatten = [x for sub in [[1,2],[3,4]] for x in sub]
print(flatten)

# ---------------------------

# 9. Iterating Through Lists
for fruit in ["apple", "banana", "cherry"]:
    print(fruit)

for i, fruit in enumerate(["apple", "banana", "cherry"], start=1):
    print(i, fruit)

# ---------------------------

# 10. List Arithmetic
nums = [1, 2, 3]
print(nums + [4, 5])        # Concatenation
print(nums * 2)             # Repetition

# ---------------------------

# 11. Membership & Comparison
a = [1, 2, 3]
b = [1, 2, 3]
print(a == b)               # True → same content
print(a is b)               # False → different objects
print(2 in a)               # True
print(5 not in a)           # True

# ---------------------------

# 12. Nested Lists
matrix = [
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9]
]
print(matrix[1][2])         # 6
flattened = [num for row in matrix for num in row]
print(flattened)

# ---------------------------

# 13. Copying Pitfalls (Shallow vs Deep Copy)
a = [[1, 2], [3, 4]]
b = a.copy()                # Shallow copy
b[0][0] = 99
print(a)                    # [[99, 2], [3, 4]] — changes reflect!
import copy
c = copy.deepcopy(a)        # Deep copy (independent)
c[0][0] = 0
print(a, c)

# ---------------------------

# 14. Built-in Functions
nums = [1, 2, 3, 4, 5]
print(len(nums))            # 5
print(sum(nums))            # 15
print(max(nums))            # 5
print(min(nums))            # 1
print(sorted(nums, reverse=True))  # [5,4,3,2,1]
print(all(nums))            # True (no zeros)
print(any(nums))            # True
print(list(range(5)))       # [0,1,2,3,4]

# ---------------------------

# 15. Slicing Advanced
a = [0,1,2,3,4,5,6]
print(a[::2])               # Step slicing → [0,2,4,6]
print(a[1::2])              # [1,3,5]
print(a[-3:])               # Last 3 elements
print(a[:-3])               # All but last 3

# ---------------------------

# 16. Aggregations & Transformations
nums = [1, 2, 3, 4]
squared = list(map(lambda x: x**2, nums))
evens = list(filter(lambda x: x % 2 == 0, nums))
print(squared, evens)

# ---------------------------

# 17. Combining Lists
a = [1, 2, 3]
b = [4, 5, 6]
combined = a + b
zipped = list(zip(a, b))              # [(1,4), (2,5), (3,6)]
unzipped_a, unzipped_b = zip(*zipped) # Unzipping
print(zipped, unzipped_a)

# ---------------------------

# 18. Deleting Elements
a = [1, 2, 3, 4, 5]
del a[0]                              # Delete by index
a.remove(3)                           # Delete by value
a.pop(0)                              # Remove & return element
print(a)

# ---------------------------

# 19. List of Lists Operations
data = [[1, 2], [3, 4], [5, 6]]
transpose = list(zip(*data))          # Transpose → [(1,3,5),(2,4,6)]
print(transpose)

# ---------------------------

# 20. Using List as Stack / Queue
stack = [1, 2, 3]
stack.append(4)                       # Push
stack.pop()                           # Pop (LIFO)

from collections import deque
queue = deque(["a", "b", "c"])
queue.append("d")                     # Enqueue
queue.popleft()                       # Dequeue (FIFO)
print(queue)

# ---------------------------

# 21. List Comprehension Tricks
nums = [1, 2, 3, 4, 5]
squares = [n*n for n in nums]
evens = [n for n in nums if n % 2 == 0]
pairs = [(x, y) for x in [1, 2] for y in [3, 4]]
print(squares, evens, pairs)

# ---------------------------

# 22. Flatten Nested Lists
nested = [[1, 2], [3, 4], [5, 6]]
flat = [num for sublist in nested for num in sublist]
print(flat)

# ---------------------------

# 23. Conditional Modifications
nums = [1, -2, 3, -4]
positive = [x if x > 0 else 0 for x in nums]
print(positive)

# ---------------------------

# 24. Enumerate & Indexing
fruits = ["apple", "banana", "cherry"]
for index, value in enumerate(fruits):
    print(index, value)

# ---------------------------

# 25. Convert Between Types
tup = (1, 2, 3)
lst = list(tup)                       # Tuple → List
s = set(lst)                          # List → Set
back_to_list = list(s)                # Set → List

# ---------------------------

# 26. Advanced Tricks
# a) Unique elements (remove duplicates)
unique = list(set([1,2,2,3,3,4]))     # [1,2,3,4] (order not preserved)
# b) Intersection & union
a = [1,2,3]
b = [3,4,5]
intersection = list(set(a) & set(b))  # [3]
union = list(set(a) | set(b))         # [1,2,3,4,5]
# c) Difference
diff = list(set(a) - set(b))          # [1,2]

# ---------------------------

# 27. Deep Operations with map/filter
nums = [1, 2, 3, 4, 5]
print(list(map(str, nums)))           # Convert to string
print(list(filter(lambda x: x > 2, nums)))  # Filter >2

# ---------------------------

# 28. Nested List Comprehension
matrix = [[1,2,3], [4,5,6], [7,8,9]]
doubled = [[num*2 for num in row] for row in matrix]
print(doubled)

# ---------------------------

# 29. Sorting Custom Objects
people = [
    {"name": "Alice", "age": 25},
    {"name": "Bob", "age": 20},
    {"name": "Charlie", "age": 30}
]
people.sort(key=lambda p: p["age"])
print(people)

# ---------------------------

# 30. Useful Built-in Functions Recap
nums = [1, 2, 3, 4, 5]
print(sum(nums))
print(max(nums))
print(min(nums))
print(any(nums))
print(all(nums))
print(sorted(nums))
print(reversed(nums))
print(list(reversed(nums)))