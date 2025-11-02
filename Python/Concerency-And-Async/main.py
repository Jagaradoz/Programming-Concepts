# 1. Threading – Run Code in Multiple Threads
import threading
import time

def print_numbers():
    for i in range(5):
        print(f"Number: {i}")
        time.sleep(0.5)

# Create threads
t1 = threading.Thread(target=print_numbers)
t2 = threading.Thread(target=print_numbers)

# Start threads
t1.start()
t2.start()

# Wait for threads to finish
t1.join()
t2.join()

# ---------------------------
# 2. Threading with Arguments
def greet(name):
    print(f"Hello, {name}")

t = threading.Thread(target=greet, args=("Ja",))
t.start()
t.join()

# ---------------------------
# 3. Thread Safety – Lock
lock = threading.Lock()
shared_counter = 0

def increment():
    global shared_counter
    for _ in range(1000):
        with lock:                          # Ensure thread-safe
            global shared_counter
            shared_counter += 1

threads = [threading.Thread(target=increment) for _ in range(5)]
for t in threads:
    t.start()
for t in threads:
    t.join()
print(shared_counter)                        # Safe increment

# ---------------------------
# 4. Asyncio – Asynchronous Programming
# ---------------------------
import asyncio

async def say_hello():
    print("Hello")
    await asyncio.sleep(1)                    # Non-blocking sleep
    print("World")

async def main():
    await asyncio.gather(say_hello(), say_hello())  # Run concurrently

asyncio.run(main())

# ---------------------------
# 5. Asyncio with Return Values
async def add(a, b):
    await asyncio.sleep(0.5)
    return a + b

async def main2():
    results = await asyncio.gather(add(1,2), add(3,4))
    print(results)                             # [3, 7]

asyncio.run(main2())

# ---------------------------
# 6. Async Functions with Loops
async def count():
    for i in range(3):
        print(f"Counting {i}")
        await asyncio.sleep(0.5)

asyncio.run(count())

# ---------------------------
# 7. Multiprocessing – Run Code in Separate Processes
# ---------------------------
from multiprocessing import Process, Value
import os

def worker(n):
    print(f"Process {os.getpid()} running, n={n}")

p1 = Process(target=worker, args=(10,))
p2 = Process(target=worker, args=(20,))
p1.start()
p2.start()
p1.join()
p2.join()

# ---------------------------
# 8. Shared State with multiprocessing.Value
counter = Value('i', 0)                       # 'i' = integer type

def increment_shared(counter):
    for _ in range(1000):
        counter.value += 1

processes = [Process(target=increment_shared, args=(counter,)) for _ in range(5)]
for p in processes:
    p.start()
for p in processes:
    p.join()
print(counter.value)                           # Safe shared value across processes

# ---------------------------
# 9. multiprocessing.Queue for Inter-Process Communication
from multiprocessing import Queue

def producer(q):
    for i in range(5):
        q.put(i)
        print(f"Produced {i}")

def consumer(q):
    while not q.empty():
        item = q.get()
        print(f"Consumed {item}")

q = Queue()
p1 = Process(target=producer, args=(q,))
p2 = Process(target=consumer, args=(q,))
p1.start()
p1.join()
p2.start()
p2.join()

# ---------------------------
# 10. ThreadPoolExecutor – Higher-Level Threading
from concurrent.futures import ThreadPoolExecutor

def square(n):
    return n * n

with ThreadPoolExecutor(max_workers=3) as executor:
    results = list(executor.map(square, [1,2,3,4]))
print(results)                                 # [1,4,9,16]

# ---------------------------
# 11. ProcessPoolExecutor – Higher-Level Multiprocessing
from concurrent.futures import ProcessPoolExecutor

with ProcessPoolExecutor(max_workers=2) as executor:
    results = list(executor.map(square, [5,6,7,8]))
print(results)                                 # [25,36,49,64]

# ---------------------------
# 12. Asyncio + Threading Hybrid (Run Blocking Code Async)
import asyncio
from concurrent.futures import ThreadPoolExecutor

def blocking_task(n):
    time.sleep(1)
    return n * n

async def main_hybrid():
    loop = asyncio.get_running_loop()
    with ThreadPoolExecutor() as pool:
        results = await asyncio.gather(
            loop.run_in_executor(pool, blocking_task, 2),
            loop.run_in_executor(pool, blocking_task, 3)
        )
        print(results)                           # [4, 9]

asyncio.run(main_hybrid())