# 1. Creating Dictionaries
empty_dict = {}                                # Empty dictionary
person = {"name": "Alice", "age": 25}          # Using literal syntax
dict_func = dict(name="Bob", age=30)           # Using dict() constructor
from_pairs = dict([("x", 1), ("y", 2)])        # From list of tuples
nested_dict = {"user": {"name": "John", "id": 7}} # Nested dictionary

# ---------------------------

# 2. Accessing Values
person = {"name": "Alice", "age": 25}

print(person["name"])                          # Access by key → "Alice"
print(person.get("age"))                       # Safely get value → 25
print(person.get("city", "Unknown"))           # Returns default if missing → "Unknown"

# ---------------------------

# 3. Modifying Dictionaries
person["age"] = 26                             # Update existing key
person["city"] = "Paris"                       # Add new key-value pair
person.update({"job": "Engineer"})             # Add multiple keys
print(person)                                  # {'name': 'Alice', 'age': 26, 'city': 'Paris', 'job': 'Engineer'}

# ---------------------------

# 4. Removing Items
person = {"name": "Alice", "age": 25, "city": "Paris"}

person.pop("age")                              # Removes key 'age' → returns 25
del person["city"]                             # Deletes key 'city'
removed = person.popitem()                     # Removes last inserted item → ('name', 'Alice')
person.clear()                                 # Removes all items → {}

# ---------------------------

# 5. Dictionary Length
d = {"a": 1, "b": 2, "c": 3}
print(len(d))                                  # → 3

# ---------------------------

# 6. Membership Operators
print("a" in d)                                # True → key exists
print("z" not in d)                            # True → key missing

# ---------------------------

# 7. Iterating Through Dictionaries
info = {"name": "Bob", "age": 30, "city": "London"}

for key in info:                               # Iterate over keys
    print(key, info[key])

for key, value in info.items():                # Iterate over key-value pairs
    print(key, "→", value)

for value in info.values():                    # Iterate over values
    print(value)

for key in info.keys():                        # Iterate over keys explicitly
    print(key)

# ---------------------------

# 8. Dictionary Methods
data = {"a": 1, "b": 2}

print(data.keys())                             # dict_keys(['a', 'b'])
print(data.values())                           # dict_values([1, 2])
print(data.items())                            # dict_items([('a', 1), ('b', 2)])

copy_data = data.copy()                        # Shallow copy
data.setdefault("c", 3)                        # Add key if not exists → 3
data.update({"d": 4})                          # Add/overwrite key-value pairs
print(data)                                    # {'a':1, 'b':2, 'c':3, 'd':4}

# ---------------------------

# 9. Dictionary Comprehensions
squares = {x: x**2 for x in range(5)}          # {0:0, 1:1, 2:4, 3:9, 4:16}
even_squares = {x: x**2 for x in range(6) if x % 2 == 0}  # {0:0, 2:4, 4:16}
print(even_squares)

# ---------------------------

# 10. Nested Dictionaries
users = {
    "user1": {"name": "Alice", "age": 25},
    "user2": {"name": "Bob", "age": 30}
}
print(users["user1"]["name"])                  # "Alice"
users["user2"]["age"] += 1                     # Modify nested value

# ---------------------------

# 11. Merging Dictionaries (Python 3.9+)
a = {"x": 1, "y": 2}
b = {"y": 3, "z": 4}
merged = a | b                                 # {'x':1, 'y':3, 'z':4}
a |= b                                         # Updates a with b → a = {'x':1, 'y':3, 'z':4}

# ---------------------------

# 12. Copying Dictionaries
original = {"a": 1, "b": {"x": 5}}
shallow = original.copy()                      # Shallow copy (nested dict shared)
import copy
deep = copy.deepcopy(original)                 # Deep copy (fully independent)

original["b"]["x"] = 9
print(shallow["b"]["x"])                       # 9 (affected)
print(deep["b"]["x"])                          # 5 (unaffected)

# ---------------------------

# 13. Converting Other Types to Dict
pairs = [("a", 1), ("b", 2)]
print(dict(pairs))                             # {'a':1, 'b':2}

keys = ["a", "b", "c"]
values = [1, 2, 3]
print(dict(zip(keys, values)))                 # {'a':1, 'b':2, 'c':3}

# ---------------------------

# 14. Default Dictionaries
from collections import defaultdict
d = defaultdict(int)
d["x"] += 1                                    # Default value → 0
print(d)                                       # defaultdict(<class 'int'>, {'x': 1})

# ---------------------------

# 15. OrderedDict (Preserves Order)
from collections import OrderedDict
od = OrderedDict()
od["a"] = 1
od["b"] = 2
od["c"] = 3
print(od)                                      # OrderedDict([('a',1), ('b',2), ('c',3)])

# ---------------------------

# 16. Dict View Objects (Dynamic)
d = {"x": 1, "y": 2}
view = d.keys()
d["z"] = 3
print(list(view))                              # ['x', 'y', 'z'] → updated dynamically

# ---------------------------

# 17. Using dict() with keyword arguments
info = dict(name="Eve", age=28, city="Berlin")
print(info)                                    # {'name':'Eve','age':28,'city':'Berlin'}

# ---------------------------

# 18. Removing with Condition
data = {"a": 1, "b": 2, "c": 3, "d": 4}
for key in list(data.keys()):
    if data[key] % 2 == 0:
        del data[key]
print(data)                                    # {'a':1, 'c':3}

# ---------------------------

# 19. Inverting Keys and Values
data = {"a": 1, "b": 2, "c": 3}
inverted = {v: k for k, v in data.items()}
print(inverted)                                # {1:'a', 2:'b', 3:'c'}