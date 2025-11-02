# 1. Creating Sets
empty_set = set()                           # ✅ Empty set (cannot use {} → makes dict)
numbers = {1, 2, 3, 4, 5}                   # Using braces
mixed = {1, "hello", 3.14, True}            # Different data types allowed
duplicates = {1, 2, 2, 3, 3, 3}
print(duplicates)                           # {1, 2, 3} → duplicates removed automatically
from_list = set([1, 2, 3, 4])               # Convert list to set
from_tuple = set((1, 2, 3))                 # Convert tuple to set
from_string = set("banana")                 # {'b','a','n'}

# -----------------------------

# 2. Accessing Elements
# ❌ No indexing/slicing (unordered)
# print(numbers[0]) → TypeError
for item in numbers:
    print(item)

# -----------------------------

# 3. Adding Elements
s = {1, 2, 3}
s.add(4)                                    # Add single element
print(s)                                    # {1, 2, 3, 4}

s.update([5, 6])                            # Add multiple elements
print(s)                                    # {1, 2, 3, 4, 5, 6}

# -----------------------------

# 4. Removing Elements
s.remove(3)                                 # Remove existing element
# s.remove(10) → KeyError if not found
s.discard(10)                               # Safe remove (no error)
popped = s.pop()                            # Removes random element
print(popped, s)
s.clear()                                   # Removes all elements → set()

# -----------------------------

# 5. Set Operations (Union, Intersection, etc.)
A = {1, 2, 3, 4}
B = {3, 4, 5, 6}

print(A | B)                                # Union → {1,2,3,4,5,6}
print(A & B)                                # Intersection → {3,4}
print(A - B)                                # Difference → {1,2}
print(B - A)                                # {5,6}
print(A ^ B)                                # Symmetric difference → {1,2,5,6}

# Using methods
print(A.union(B))
print(A.intersection(B))
print(A.difference(B))
print(A.symmetric_difference(B))

# -----------------------------

# 6. Set Comparison
X = {1, 2, 3}
Y = {1, 2}
print(Y.issubset(X))                        # True
print(X.issuperset(Y))                      # True
print(X.isdisjoint({4, 5}))                 # True (no shared elements)

# -----------------------------

# 7. Frozen Sets (Immutable)
frozen = frozenset([1, 2, 3, 4])
# frozen.add(5) → ❌ AttributeError (immutable)
print(frozen.union({4, 5}))                 # Allowed (returns new set)
print(type(frozen))                         # <class 'frozenset'>

# -----------------------------

# 8. Membership Tests (Fast O(1))
nums = {1, 2, 3, 4, 5}
print(3 in nums)                            # True
print(10 not in nums)                       # True

# -----------------------------

# 9. Copying Sets
s1 = {1, 2, 3}
s2 = s1.copy()
print(s2)
print(s1 is s2)                             # False (different objects)

# -----------------------------

# 10. Iterating Over Sets
for x in {"apple", "banana", "cherry"}:
    print(x)

# -----------------------------

# 11. Set Comprehension
squares = {x**2 for x in range(6)}
print(squares)                              # {0,1,4,9,16,25}

# Conditional comprehension
even_squares = {x**2 for x in range(10) if x % 2 == 0}
print(even_squares)

# -----------------------------

# 12. Converting Between Data Types
lst = [1, 2, 3, 3, 4]
unique = set(lst)
print(unique)                               # {1,2,3,4}

back_to_list = list(unique)
print(back_to_list)                         # [1,2,3,4]

# -----------------------------

# 13. Built-in Functions
nums = {3, 1, 4, 2, 5}
print(len(nums))                            # 5
print(sum(nums))                            # 15
print(max(nums))                            # 5
print(min(nums))                            # 1
print(sorted(nums))                         # [1,2,3,4,5]
print(any(nums))                            # True (non-empty)
print(all(nums))                            # True (no 0 present)

# -----------------------------

# 14. Removing Duplicates From a List Using Sets
lst = [1, 2, 2, 3, 3, 4, 4, 5]
unique_list = list(set(lst))
print(unique_list)                          # [1,2,3,4,5]

# -----------------------------

# 15. Intersection Update / Difference Update
A = {1, 2, 3, 4}
B = {3, 4, 5}

A.intersection_update(B)                    # A = A ∩ B
print(A)                                    # {3,4}

A = {1, 2, 3, 4}
A.difference_update(B)                      # A = A - B
print(A)                                    # {1,2}

A = {1, 2, 3}
A.symmetric_difference_update({2, 3, 4})
print(A)                                    # {1,4}

# -----------------------------

# 16. Copying & Cloning
original = {1, 2, 3}
clone = original.copy()
clone.add(4)
print(original, clone)                      # {1,2,3} {1,2,3,4}

# -----------------------------

# 17. Frozen Set as Dictionary Key
fset = frozenset({1, 2, 3})
d = {fset: "immutable set"}
print(d[fset])

# -----------------------------

# 18. Using Sets for Mathematical Logic
A = {1, 2, 3, 4}
B = {3, 4, 5}
C = {5, 6, 7}

print(A & B & C)                            # Common elements
print(A | B | C)                            # Union of all
print((A | B) - (A & B))                    # Symmetric difference manually

# -----------------------------

# 19. Nested Sets (⚠️ Immutable Only)
# Sets cannot contain other sets (unhashable), but can contain frozensets
nested = {frozenset({1, 2}), frozenset({3, 4})}
print(nested)

# -----------------------------

# 20. Practical Examples

# → Removing duplicates
emails = ["a@x.com", "b@x.com", "a@x.com"]
unique_emails = set(emails)
print(unique_emails)

# → Checking common elements
skills_A = {"Python", "C++", "SQL"}
skills_B = {"Python", "Java"}
print(skills_A & skills_B)                  # {'Python'}

# → Membership checks (faster than list)
if "Python" in skills_A:
    print("Found Python skill!")

# -----------------------------

# 21. Frozen Set Operations
fs1 = frozenset([1, 2, 3])
fs2 = frozenset([3, 4])
print(fs1 | fs2)
print(fs1 & fs2)

# -----------------------------

# 22. Set from Dictionary Keys
d = {"a": 1, "b": 2, "c": 3}
print(set(d))                               # {'a','b','c'}
print(set(d.values()))                      # {1,2,3}

# -----------------------------

# 23. Unions of Multiple Sets
s1, s2, s3 = {1, 2}, {2, 3}, {3, 4}
print(set.union(s1, s2, s3))                # {1,2,3,4}
print(set.intersection(s1, s2, s3))         # ∅ empty set

# -----------------------------

# 24. Copy vs Reference
a = {1, 2, 3}
b = a                                       # Reference
b.add(4)
print(a)                                    # {1,2,3,4}
c = a.copy()                                # Copy
c.add(5)
print(a, c)                                 # {1,2,3,4} {1,2,3,4,5}

# -----------------------------

# 25. Set Algebra Summary
A = {1, 2, 3, 4}
B = {3, 4, 5, 6}
print("Union:", A | B)
print("Intersection:", A & B)
print("Difference:", A - B)
print("SymDiff:", A ^ B)

# -----------------------------

# 26. Checking Disjoint, Subset, Superset
A = {1, 2}
B = {1, 2, 3}
print(A.issubset(B))
print(B.issuperset(A))
print(A.isdisjoint({4, 5}))

# -----------------------------

# 27. Clearing & Rebuilding
A = {1, 2, 3}
A.clear()
A.update({4, 5, 6})
print(A)

# -----------------------------

# 28. Common Built-in Set Functions Summary
s = {10, 20, 30}
print(len(s))
print(max(s))
print(min(s))
print(sum(s))
print(sorted(s))
print(all(s))
print(any(s))

# -----------------------------

# 29. Real-world Example – Removing Duplicates from Text
text = "python python data ai python code"
unique_words = set(text.split())
print(unique_words)