# 1. String Creation
s1 = 'Hello'
s2 = "World"
s3 = '''Triple quotes allow
multiline strings'''
s4 = """Also valid for
multiline strings"""

# ---------------------------

# 2. String Concatenation & Repetition
a = "Hello"
b = "World"

print(a + " " + b)        # Concatenation → "Hello World"
print(a * 3)              # Repetition → "HelloHelloHello"

# ---------------------------

# 3. String Indexing & Slicing
s = "Python"

print(s[0])               # First character → 'P'
print(s[-1])              # Last character → 'n'
print(s[0:4])             # Slice → 'Pyth'
print(s[:3])              # From start → 'Pyt'
print(s[3:])              # To end → 'hon'
print(s[::-1])            # Reversed → 'nohtyP'

# ---------------------------

# 4. String Length & Membership
print(len(s))             # Length → 6
print('t' in s)           # Membership → True
print('z' not in s)       # Non-membership → True

# ---------------------------

# 5. String Immutability
s = "Hello"
# s[0] = 'h'             # ❌ Error: Strings are immutable
s = "h" + s[1:]          # ✅ New string created → "hello"

# ---------------------------

# 6. String Methods (Alphabetical Overview)

txt = "  Python Programming  "

# Case Conversion
print(txt.lower())        # "  python programming  "
print(txt.upper())        # "  PYTHON PROGRAMMING  "
print(txt.title())        # "  Python Programming  "
print(txt.capitalize())   # "  python programming  "
print(txt.swapcase())     # "  pYTHON pROGRAMMING  "

# ---------------------------

# Whitespace Handling
print(txt.strip())        # "Python Programming"
print(txt.lstrip())       # "Python Programming  "
print(txt.rstrip())       # "  Python Programming"

# ---------------------------

# Searching & Counting
print(txt.find("thon"))   # 3 (first index)
print(txt.rfind("o"))     # 12 (last index)
print(txt.index("thon"))  # 3 (raises error if not found)
print(txt.count("o"))     # 2

# ---------------------------

# Checking String Type
print(txt.startswith("  Py"))  # True
print(txt.endswith("ing  "))   # True
print("123".isdigit())         # True
print("3.14".isnumeric())      # False
print("abc".isalpha())         # True
print("abc123".isalnum())      # True
print(" ".isspace())           # True
print("Python".istitle())      # True if each word capitalized
print("python".islower())      # True
print("PYTHON".isupper())      # True

# ---------------------------

# Replace & Split
s = "apple,banana,cherry"
print(s.replace("banana", "mango"))   # "apple,mango,cherry"
print(s.split(","))                   # ['apple', 'banana', 'cherry']
print(s.rsplit(",", 1))               # ['apple,banana', 'cherry']
print("   ".join(['A', 'B', 'C']))    # "A   B   C"
print(" - ".join(['red', 'green', 'blue']))  # "red - green - blue"

# ---------------------------

# Joining & Combining
words = ["Python", "is", "fun"]
print(" ".join(words))                # "Python is fun"

# ---------------------------

# String Alignment
print("Python".center(20, "-"))      # "-------Python-------"
print("Python".ljust(20, "."))       # "Python.............."
print("Python".rjust(20, "."))       # "..............Python"
print("42".zfill(5))                 # "00042"

# ---------------------------

# Partitioning
text = "user:password"
print(text.partition(":"))            # ('user', ':', 'password')
print(text.rpartition(":"))           # ('user', ':', 'password')

# ---------------------------

# Splitlines
multi_line = "Line1\nLine2\nLine3"
print(multi_line.splitlines())        # ['Line1', 'Line2', 'Line3']

# ---------------------------

# Encoding & Decoding
utf8_bytes = "Hello".encode("utf-8")
print(utf8_bytes)                     # b'Hello'
decoded = utf8_bytes.decode("utf-8")
print(decoded)                        # "Hello"

# ---------------------------

# 7. String Formatting Techniques

name = "Alice"
age = 25

# %-formatting (old style)
print("Name: %s, Age: %d" % (name, age))

# str.format() method
print("Name: {}, Age: {}".format(name, age))
print("Name: {1}, Age: {0}".format(age, name))   # Positional
print("Name: {n}, Age: {a}".format(n=name, a=age)) # Named

# f-strings (modern)
print(f"Name: {name}, Age: {age}")
print(f"{name.upper()} is {age * 2} years in dog years")

# Formatting numbers
pi = 3.141592653589
print(f"{pi:.2f}")                     # 3.14
print(f"{pi:10.3f}")                   # Right-aligned float
print(f"{1234:,}")                     # Adds commas → 1,234
print(f"{255:x}")                      # Hexadecimal → 'ff'
print(f"{255:b}")                      # Binary → '11111111'

# ---------------------------

# 8. Escape Sequences
s = "Line1\nLine2\tTabbed\\Backslash\'Quote\""
print(s)

# Common escape sequences:
# \n → newline
# \t → tab
# \\ → backslash
# \' → single quote
# \" → double quote
# \r → carriage return
# \b → backspace
# \f → form feed
# \ooo → octal value
# \xhh → hex value

# ---------------------------

# 9. Raw Strings (ignore escape sequences)
path = r"C:\Users\Alice\Desktop"
print(path)             # Prints exactly as written

# ---------------------------

# 10. Multiline Strings & Formatting
multi = """This is
a multiline
string."""
print(multi)

# Triple quotes are useful for documentation (docstrings)

# ---------------------------

# 11. String Comparison
print("apple" == "apple")   # True
print("apple" != "banana")  # True
print("a" < "b")            # True (lexicographical)
print("Zoo" > "apple")      # False (case-sensitive: uppercase < lowercase)

# ---------------------------

# 12. Advanced Techniques

# a) Reverse a string
s = "Python"
print(s[::-1])              # "nohtyP"

# b) Count vowels in string
vowels = "aeiou"
word = "beautiful"
count = sum(1 for ch in word if ch in vowels)
print(count)                # 5

# c) Remove punctuation
import string
text = "Hello, world!!!"
clean = text.translate(str.maketrans('', '', string.punctuation))
print(clean)                # "Hello world"

# d) Character frequency
from collections import Counter
freq = Counter("banana")
print(freq)                 # {'a':3,'b':1,'n':2}

# e) Check palindrome
word = "level"
print(word == word[::-1])   # True

# ---------------------------

# 13. String Translation & Mapping
table = str.maketrans("aeiou", "12345")
print("hello world".translate(table))   # h2ll4 w4rld

# Reverse mapping
reverse_table = str.maketrans("12345", "aeiou")
print("h2ll4".translate(reverse_table)) # hello

# ---------------------------

# 14. String Constants (from string module)
import string
print(string.ascii_lowercase)  # 'abcdefghijklmnopqrstuvwxyz'
print(string.ascii_uppercase)  # 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
print(string.digits)           # '0123456789'
print(string.punctuation)      # !"#$%&'()*+,-./:;<=>?@[\]^_`{|}~
print(string.whitespace)       # space, tab, newline, etc.

# ---------------------------

# 15. Useful Built-ins
print(len("Python"))           # 6
print(sorted("python"))        # ['h','n','o','p','t','y']
print(max("abcxyz"))           # 'z'
print(min("abcxyz"))           # 'a'
print(all(ch.isalpha() for ch in "Hello"))  # True
print(any(ch.isdigit() for ch in "abc123")) # True

# ---------------------------

# 16. String to List and Back
s = "one two three"
words = s.split()              # ['one', 'two', 'three']
joined = "-".join(words)       # "one-two-three"

# ---------------------------

# 17. String Padding / Truncation
print(f"{'Python':<10}")       # Left align
print(f"{'Python':>10}")       # Right align
print(f"{'Python':^10}")       # Center align
print(f"{'Python':.3}")        # Truncate → "Pyt"

# ---------------------------

# 18. String Evaluation (use cautiously)
expr = "2 + 3 * 4"
print(eval(expr))              # 14 (⚠️ Use with trusted input only)

# ---------------------------

# 19. Bytes & Strings Conversion
data = b"Hello"
print(data.decode())           # bytes → str
print("World".encode())        # str → bytes

# ---------------------------

# 20. Practical Examples
sentence = "Python is powerful and fun"
print(sentence.replace("fun", "awesome"))
print(sentence.upper().split())
print(any(word.startswith("P") for word in sentence.split()))
print(sentence.lower().count("p"))   # count 'p' case-insensitive
print(sentence.find("power"))        # index of substring