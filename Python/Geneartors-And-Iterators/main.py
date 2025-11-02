# 1. Iterable vs Iterator
nums = [1, 2, 3]                               # Iterable (list)
it = iter(nums)                                # Iterator created using iter()

print(next(it))                                # 1
print(next(it))                                # 2
print(next(it))                                # 3
# print(next(it))                              # ❌ StopIteration (end of iterator)

# ---------------------------

# 2. Using for-loop with Iterable
for n in nums:                                 # for automatically calls iter() and next()
    print(n)

# ---------------------------

# 3. Custom Iterator Class
class CountDown:
    def __init__(self, start):
        self.current = start

    def __iter__(self):
        return self                            # Returns iterator object itself

    def __next__(self):
        if self.current <= 0:
            raise StopIteration                # Required to stop iteration
        self.current -= 1
        return self.current + 1

cd = CountDown(3)
for num in cd:
    print(num)                                 # 3, 2, 1

# ---------------------------

# 4. Iterating Manually Using next()
nums = [10, 20, 30]
it = iter(nums)
while True:
    try:
        print(next(it))                        # Manually fetch next value
    except StopIteration:
        break                                  # End of iteration

# ---------------------------

# 5. Generator Function (uses yield)
def countdown(n):
    while n > 0:
        yield n                                # Pause and return value
        n -= 1

for i in countdown(5):
    print(i)                                   # 5, 4, 3, 2, 1

# ---------------------------

# 6. Generator vs Normal Function
def normal_func():
    return [1, 2, 3]

def gen_func():
    yield 1
    yield 2
    yield 3

print(normal_func())                           # Returns list
print(list(gen_func()))                        # Returns generator values

# ---------------------------

# 7. Generator Object
g = gen_func()
print(next(g))                                 # 1
print(next(g))                                 # 2
print(next(g))                                 # 3
# print(next(g))                               # ❌ StopIteration

# ---------------------------

# 8. Generator Expression
squares = (x * x for x in range(5))            # Like list comprehension but lazy
print(next(squares))                           # 0
print(list(squares))                           # [1, 4, 9, 16]

# ---------------------------

# 9. Using Generators for Memory Efficiency
def big_range(n):
    for i in range(n):
        yield i

gen = big_range(1_000_000)
print(next(gen))                               # 0
print(next(gen))                               # 1
# Efficient: doesn't store all values in memory

# ---------------------------

# 10. yield from (Delegating to Subgenerator)
def gen_numbers():
    yield from [1, 2, 3]                       # Delegates to another iterable

for n in gen_numbers():
    print(n)

# ---------------------------

# 11. Sending Values into Generator (send())
def greeter():
    name = yield "Who are you?"                # yield asks question
    yield f"Hello, {name}"

g = greeter()
print(next(g))                                 # Start generator → "Who are you?"
print(g.send("Ja"))                            # Send value → "Hello, Ja"

# ---------------------------

# 12. Closing Generators (close())
def infinite_count():
    n = 1
    while True:
        yield n
        n += 1

gen = infinite_count()
print(next(gen))                               # 1
gen.close()                                    # Stop generator manually

# ---------------------------

# 13. Generator for Infinite Sequence
def even_numbers():
    n = 0
    while True:
        yield n
        n += 2

evens = even_numbers()
for _ in range(5):
    print(next(evens))                         # 0, 2, 4, 6, 8

# ---------------------------

# 14. Combining Generators
def odds():
    for i in range(1, 10, 2):
        yield i

def combined():
    yield from even_numbers()
    yield from odds()

# ⚠ infinite + finite → careful if calling list(combined())

# ---------------------------

# 15. Custom Infinite Iterator Class
class InfiniteCounter:
    def __init__(self, start=0):
        self.count = start

    def __iter__(self):
        return self

    def __next__(self):
        self.count += 1
        return self.count

counter = InfiniteCounter()
print(next(counter))                           # 1
print(next(counter))                           # 2

# ---------------------------

# 16. Using itertools (Advanced Iterators)
import itertools

cycle_items = itertools.cycle(['A', 'B', 'C']) # Infinite cycle
print(next(cycle_items))                       # A
print(next(cycle_items))                       # B

repeat_hello = itertools.repeat("Hello", 3)    # Repeat 3 times
for item in repeat_hello:
    print(item)

count_from_5 = itertools.count(5, 2)           # Count from 5 by 2 → 5, 7, 9, ...
print(next(count_from_5))
print(next(count_from_5))

# ---------------------------

# 17. Generator Pipeline Example
def square(nums):
    for n in nums:
        yield n * n

def double(nums):
    for n in nums:
        yield n * 2

nums = range(5)
pipeline = double(square(nums))
print(list(pipeline))                          # [0, 2, 8, 18, 32]

# ---------------------------

# 18. Generator for Reading Large Files
def read_file(filename):
    with open(filename, "r") as f:
        for line in f:
            yield line.strip()                 # Yield line by line

# for line in read_file("data.txt"):           # Efficient for big files
#     print(line)

# ---------------------------

# 19. Custom Iterator with Reset Method
class Repeater:
    def __init__(self, word):
        self.word = word
        self.count = 0

    def __iter__(self):
        self.count = 0
        return self

    def __next__(self):
        if self.count >= 3:
            raise StopIteration
        self.count += 1
        return self.word

r = Repeater("Hi")
for w in r:
    print(w)                                   # Hi, Hi, Hi