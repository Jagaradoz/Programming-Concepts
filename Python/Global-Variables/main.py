# 1. Defining Global Variables
global_var = "I am global"                       # Accessible throughout the module

# ---------------------------

# 2. Accessing Global Variables
def access_global():
    print(global_var)                            # Can read global variable inside a function

access_global()                                  # Output: "I am global"

# ---------------------------

# 3. Modifying Global Variables inside Functions
count = 0

def increment():
    global count                                 # Declare global to modify it
    count += 1

increment()
print(count)                                     # Output: 1

# ---------------------------

# 4. Global Variables in Multiple Functions
x = 10

def add_five():
    global x
    x += 5

def multiply_two():
    global x
    x *= 2

add_five()                                       # x = 15
multiply_two()                                   # x = 30
print(x)                                         # Output: 30

# ---------------------------

# 5. Using Globals Without 'global' Keyword
y = 5

def read_global():
    print(y)                                     # Can read global without global keyword

read_global()                                    # Output: 5

# ---------------------------

# 6. Dynamic Creation of Global Variables
def create_global():
    globals()['new_global'] = "Created dynamically"

create_global()

# ---------------------------

# 7. Global Constants (by convention)
PI = 3.14159
E  = 2.71828                                     # Uppercase indicates constant, but not enforced

# ---------------------------

# 8. Global Variables vs Local Variables
var = "global"

def scope_test():
    var = "local"                                # Local variable shadows global variable
    print(var)

scope_test()                                     # Output: "local"
print(var)                                       # Output: "global"

# ---------------------------

# 9. Avoiding Global Variables
# Recommended to pass variables as function arguments to reduce side effects
def add(a, b):
    return a + b

result = add(10, 5)
print(result)                                    # Output: 15

# ---------------------------

# 10. Global with Nonlocal
# Nonlocal affects enclosing function scope, global affects module scope
def outer():
    x = 5
    def inner():
        nonlocal x
        x += 5
    inner()
    return x

print(outer())                                   # Output: 10
