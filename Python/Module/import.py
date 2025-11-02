# 2. Importing Module

# 2.1 Import the whole module
import my_module
print(my_module.greet("Bob"))                    # Output: "Hello, Bob!"
print(my_module.PI)                              # Output: 3.14159

# 2.2 Import specific items
from my_module import greet, Person
print(greet("Charlie"))                          # Output: "Hello, Charlie!"
p = Person("David")
print(p.introduce())                             # Output: "My name is David"

# 2.3 Import with alias
import my_module as mm
print(mm.add(5, 3))                              # Output: 8

from my_module import PI as pi_value
print(pi_value)                                  # Output: 3.14159