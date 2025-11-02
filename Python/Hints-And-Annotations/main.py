from typing import List, Dict, Tuple, Set, Optional, Union, Callable, Any

# ---------------------------
# 1. Basic Type Hints
# ---------------------------
x: int = 10                                   # Integer
y: float = 3.14                               # Float
name: str = "Ja"                               # String
is_active: bool = True                         # Boolean
nothing: None = None                           # NoneType

# ---------------------------
# 2. Function Annotations
# ---------------------------
def add(a: int, b: int) -> int:               # Parameters and return type
    return a + b

result: int = add(2, 3)

# ---------------------------
# 3. Optional and Union Types
# ---------------------------
def greet(name: Optional[str] = None) -> str: # Can be str or None
    return f"Hello, {name or 'Guest'}"

def process(value: Union[int, float]) -> float: # Can be int or float
    return float(value) * 2

# ---------------------------
# 4. Collections Type Hints
# ---------------------------
numbers: List[int] = [1, 2, 3]               # List of ints
user_ages: Dict[str, int] = {"Alice": 25}    # Dict with str keys, int values
coords: Tuple[int, int] = (10, 20)           # Tuple of two ints
unique_ids: Set[int] = {1, 2, 3}             # Set of ints

# ---------------------------
# 5. Callable Type Hints
# ---------------------------
def execute(func: Callable[[int, int], int], a: int, b: int) -> int:
    return func(a, b)

def multiply(x: int, y: int) -> int:
    return x * y

print(execute(multiply, 2, 3))                # 6

# ---------------------------
# 6. Any Type
# ---------------------------
data: Any = "Could be anything"
data = 42
data = [1, 2, 3]

# ---------------------------
# 7. Type Aliases
# ---------------------------
Vector = List[float]                          # Alias for list of floats
v: Vector = [1.0, 2.5, 3.3]

# ---------------------------
# 8. Nested Type Hints
# ---------------------------
Matrix = List[List[int]]                       # List of lists of ints
m: Matrix = [[1,2],[3,4]]

# ---------------------------
# 9. Literal Types (Python 3.8+)
# ---------------------------
from typing import Literal
def set_status(status: Literal["open","closed","pending"]) -> None:
    print(f"Status set to {status}")

set_status("open")                             # ✅ Valid
# set_status("done")                           # ❌ Type warning

# ---------------------------
# 10. Forward References (Strings for self-reference)
# ---------------------------
from __future__ import annotations
class Node:
    def __init__(self, value: int, next: Node | None = None):
        self.value = value
        self.next = next

# ---------------------------
# 11. Generics
# ---------------------------
from typing import TypeVar, Generic

T = TypeVar("T")

class Stack(Generic[T]):
    def __init__(self):
        self.items: List[T] = []

    def push(self, item: T) -> None:
        self.items.append(item)

    def pop(self) -> T:
        return self.items.pop()

s = Stack[int]()
s.push(10)
print(s.pop())                                # 10

# ---------------------------
# 12. Annotating Iterables and Iterators
# ---------------------------
from typing import Iterator

def squares(nums: List[int]) -> Iterator[int]:
    for n in nums:
        yield n * n

for val in squares([1,2,3]):
    print(val)

# ---------------------------
# 13. Function Returning None
# ---------------------------
def log(message: str) -> None:
    print(message)