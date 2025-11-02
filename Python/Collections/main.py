from collections import namedtuple, defaultdict, Counter, deque

# ------------------------------------------------
# 1. namedtuple – Lightweight Immutable Objects
# ------------------------------------------------
Point = namedtuple("Point", "x y")             # Create namedtuple type
p = Point(10, 20)                              # Instantiate
print(p.x, p.y)                                # Access fields → 10 20
print(p[0], p[1])                              # Also accessible by index
print(p)                                       # Point(x=10, y=20)

# Convert to dict
print(p._asdict())                             # {'x': 10, 'y': 20}

# Replace field (returns new instance)
p2 = p._replace(y=50)
print(p2)                                      # Point(x=10, y=50)

# Make from iterable
p3 = Point._make([7, 8])
print(p3)                                      # Point(x=7, y=8)

# ------------------------------------------------
# 2. defaultdict – Default Values for Missing Keys
# ------------------------------------------------
d = defaultdict(int)                           # Default value = 0
d["apple"] += 1
d["banana"] += 2
print(d)                                       # {'apple': 1, 'banana': 2}

# Using lambda or list as default factory
dd = defaultdict(lambda: "Not Found")
print(dd["missing"])                           # "Not Found"

list_dict = defaultdict(list)
list_dict["fruits"].append("apple")
list_dict["fruits"].append("banana")
print(list_dict)                               # {'fruits': ['apple', 'banana']}

# ------------------------------------------------
# 3. Counter – Count Hashable Objects
# ------------------------------------------------
fruits = ["apple", "banana", "apple", "orange", "banana", "apple"]
c = Counter(fruits)
print(c)                                       # Counter({'apple': 3, 'banana': 2, 'orange': 1})

# Access counts
print(c["apple"])                              # 3
print(list(c.elements()))                      # ['apple', 'apple', 'apple', 'banana', 'banana', 'orange']

# Most common items
print(c.most_common(2))                        # [('apple', 3), ('banana', 2)]

# Subtract or update
c.subtract({"banana": 1})
print(c)                                       # Counter({'apple': 3, 'banana': 1, 'orange': 1})

# Combine Counters
a = Counter(a=3, b=1)
b = Counter(a=1, b=2)
print(a + b)                                   # Counter({'a': 4, 'b': 3})
print(a - b)                                   # Counter({'a': 2})
print(a & b)                                   # Intersection → Counter({'a': 1, 'b': 1})
print(a | b)                                   # Union (max values) → Counter({'a': 3, 'b': 2})

# ------------------------------------------------
# 4. deque – Double-Ended Queue
# ------------------------------------------------
dq = deque([1, 2, 3])
dq.append(4)                                   # Add right
dq.appendleft(0)                               # Add left
print(dq)                                      # deque([0, 1, 2, 3, 4])

dq.pop()                                       # Remove from right
dq.popleft()                                   # Remove from left
print(dq)                                      # deque([1, 2, 3])

# Rotate elements
dq.rotate(1)
print(dq)                                      # deque([3, 1, 2])
dq.rotate(-1)
print(dq)                                      # deque([1, 2, 3])

# Extend both sides
dq.extend([4, 5])
dq.extendleft([-1, -2])
print(dq)                                      # deque([-2, -1, 1, 2, 3, 4, 5])

# Limit size with maxlen
dq2 = deque([1, 2, 3], maxlen=3)
dq2.append(4)                                  # Oldest (1) removed
print(dq2)                                     # deque([2, 3, 4], maxlen=3)

# Clear deque
dq.clear()
print(dq)                                      # deque([])

# ------------------------------------------------
# 5. Combining Collections Utilities
# ------------------------------------------------
from collections import ChainMap

dict1 = {"a": 1, "b": 2}
dict2 = {"b": 3, "c": 4}
chain = ChainMap(dict1, dict2)
print(chain["b"])                              # 2 (from first dict)
print(chain.maps)                              # [{'a': 1, 'b': 2}, {'b': 3, 'c': 4}]

# ------------------------------------------------
# 6. Useful Methods Summary
# ------------------------------------------------
# namedtuple:
#   _make(iterable)   → Create from iterable
#   _asdict()         → Convert to dict
#   _replace(**kwargs)→ Replace field values

# defaultdict:
#   defaultdict(factory) → Creates dict with default factory
#   Missing keys auto-created with default

# Counter:
#   elements()         → Iterator over elements
#   most_common(n)     → Top n items
#   subtract(), update()→ Modify counts
#   arithmetic ops     → +, -, &, |

# deque:
#   append(), appendleft()
#   pop(), popleft()
#   extend(), extendleft()
#   rotate(n)
#   clear()
#   maxlen (limit size)