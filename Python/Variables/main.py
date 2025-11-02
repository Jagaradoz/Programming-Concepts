# 1. Variable Declaration
x           = 10                                  # Integer
pi          = 3.14159                             # Float
name        = "Alice"                             # String
is_active   = True                                # Boolean
nothing     = None                                # Null equivalent
lst         = [1, 2, 3]                           # List
tup         = (1, 2, 3)                           # Tuple (immutable)
dct         = {"name": "Bob", "age": 25}          # Dictionary
st          = {1, 2, 3}                           # Set
f           = lambda x: x**2                      # Function (lambda)

# ---------------------------

# 2. Multiple Assignment
a, b, c     = 1, 2, 3                             # Assign multiple at once
x = y = z   = 0                                   # Chain assignment

# ---------------------------

# 3. Variable Naming
_valid_name = "ok"                                # Starts with underscore
CamelCase   = "used for classes"                  # PascalCase
snake_case  = "used for variables"                # snake_case (preferred)

# ---------------------------

# 4. Dynamic Typing
var         = 10
var         = "Now I'm a string"                  # Type can change dynamically

# ---------------------------

# 5. Type Checking
print(type(var))                                  # <class 'str'>
print(isinstance(var, str))                       # True

# ---------------------------

# 6. Constants (by convention, not enforced)
PI          = 3.14159
E           = 2.71828                             # Constants are uppercase by convention

# ---------------------------

# 7. String Interpolation (f-strings)
name        = "Alice"
greeting    = f"Hello, {name}!"                   # "Hello, Alice!"

# ---------------------------

# 8. Variable Scope
global_var  = "I am global"

def scope_example():
    local_var = "I am local"
    print(global_var)                             # Accessible global variable
    # print(nonexistent)                          # NameError if uncommented

scope_example()

# ---------------------------

# 9. Global & Nonlocal
count       = 0

def increment():
    global count
    count += 1                                   # Modify global variable

def outer():
    x = 10
    def inner():
        nonlocal x
        x += 5                                   # Modify enclosing variable
    inner()
    return x

# ---------------------------

# 10. Swapping Variables
a, b        = 1, 2
a, b        = b, a                               # a = 2, b = 1

# ---------------------------

# 11. Destructuring / Unpacking
nums        = [1, 2, 3]
x, y, z     = nums                               # x=1, y=2, z=3
a, *b       = [10, 20, 30, 40]                   # a=10, b=[20,30,40]
*a, b       = [10, 20, 30, 40]                   # a=[10,20,30], b=40

# ---------------------------

# 12. Deleting Variables
del x                                            # Removes variable from namespace

# ---------------------------

# 13. Casting (Type Conversion)
num_str       = "42"
flt_str       = "3.14"
bool_str      = "True"

num           = int(num_str)                       # "42" → 42
flt           = float(flt_str)                     # "3.14" → 3.14
txt           = str(123)                           # 123 → "123"
flag          = bool(1)                            # 1 → True
zero_bool     = bool(0)                            # 0 → False
list_from_str = list("abc")                        # "abc" → ['a', 'b', 'c']
tuple_from_list = tuple([1, 2, 3])                 # [1,2,3] → (1,2,3)
set_from_list   = set([1, 2, 2, 3])                # [1,2,2,3] → {1,2,3}
dict_from_tuples = dict([("a", 1), ("b", 2)])      # [("a",1),("b",2)] → {'a':1,'b':2}

# Converting between numeric types
a_float       = float(5)                           # 5 → 5.0
b_int         = int(3.9)                           # 3.9 → 3
c_complex     = complex(2, 3)                      # (2+3j)
print(int(True))                                   # True → 1
print(float(False))                                # False → 0.0

# ---------------------------

# 14. Checking for None
value       = None
if value is None:
    print("Value is None")                         # Check for None safely

# ---------------------------

# 15. Useful Built-ins
globals()                                        # Returns dict of global variables
locals()                                         # Returns local variables in scope
vars()                                           # Returns __dict__ of an object/module

# ---------------------------

# 16. Identity vs Equality
a            = [1, 2, 3]
b            = a
c            = [1, 2, 3]

print(a == b)                                   # True  → same content
print(a is b)                                   # True  → same object
print(a == c)                                   # True  → same content
print(a is c)                                   # False → different object

# ---------------------------

# 17. Constants and Immutability
# Numbers, strings, tuples are immutable
num          = 10
num         += 5                                 # Creates new object
text         = "Hello"
text        += " World"                          # New string created