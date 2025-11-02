# 1. Opening Files
# open(filename, mode, encoding)
# Common modes: 'r' = read, 'w' = write, 'a' = append, 'x' = create new, 'b' = binary, '+' = read/write
file = open("example.txt", "r")                 # Open file for reading
file = open("example.txt", "w")                 # Open file for writing (overwrites)
file = open("example.txt", "a")                 # Open file for appending
file = open("example.txt", "r+", encoding="utf-8") # Open for reading & writing with UTF-8 encoding

# ---------------------------

# 2. Reading Files
file = open("example.txt", "r")
content = file.read()                           # Read entire file as a string
print(content)

file.seek(0)                                   # Move cursor to start
line = file.readline()                          # Read one line
lines = file.readlines()                        # Read all lines as list of strings
print(lines)
file.close()                                    # Always close the file

# ---------------------------

# 3. Writing Files
file = open("example.txt", "w")
file.write("Hello, World!\n")                   # Overwrites file with text
file.writelines(["Line 1\n", "Line 2\n"])       # Write multiple lines
file.close()

# ---------------------------

# 4. Appending to Files
file = open("example.txt", "a")
file.write("New line added!\n")                 # Adds content at end of file
file.close()

# ---------------------------

# 5. Using with Statement (Recommended)
# Automatically closes the file after use
with open("example.txt", "r") as f:
    data = f.read()
    print(data)

with open("output.txt", "w") as f:
    f.write("File created safely!")             # No need to call close()

# ---------------------------

# 6. Checking if File Exists
import os

print(os.path.exists("example.txt"))            # True if file exists
print(os.path.isfile("example.txt"))            # True if it's a regular file
print(os.path.isdir("my_folder"))               # True if it's a directory

# ---------------------------

# 7. Deleting Files
import os

if os.path.exists("to_delete.txt"):
    os.remove("to_delete.txt")                  # Delete a file safely
else:
    print("File not found")

# ---------------------------

# 8. Renaming and Moving Files
import os

os.rename("old.txt", "new.txt")                 # Rename file
os.replace("new.txt", "backup/new.txt")         # Move or replace file

# ---------------------------

# 9. Creating and Removing Directories
import os

os.mkdir("new_folder")                          # Create single folder
os.makedirs("nested/folder/structure")          # Create nested directories
os.rmdir("new_folder")                          # Remove empty directory
os.removedirs("nested/folder/structure")        # Remove nested empty directories

# ---------------------------

# 10. Reading Files Line by Line
with open("example.txt", "r") as f:
    for line in f:
        print(line.strip())                     # Read one line at a time (memory efficient)

# ---------------------------

# 11. File Positioning
file = open("example.txt", "r")
print(file.tell())                              # Get current cursor position
file.seek(5)                                    # Move cursor to byte 5
print(file.read())                              # Read from position 5 onward
file.close()

# ---------------------------

# 12. Binary File Reading/Writing
with open("image.jpg", "rb") as f:
    data = f.read()                             # Read binary data

with open("copy.jpg", "wb") as f:
    f.write(data)                               # Write binary data to new file

# ---------------------------

# 13. Working with JSON Files
import json

data = {"name": "Alice", "age": 25, "city": "Paris"}

with open("data.json", "w") as f:
    json.dump(data, f, indent=4)                # Write JSON to file

with open("data.json", "r") as f:
    loaded = json.load(f)                       # Read JSON from file
    print(loaded)

# ---------------------------

# 14. CSV File Handling
import csv

# Writing CSV
with open("data.csv", "w", newline="") as f:
    writer = csv.writer(f)
    writer.writerow(["Name", "Age", "City"])
    writer.writerow(["Alice", 25, "Paris"])
    writer.writerows([["Bob", 30, "London"], ["Eve", 28, "Berlin"]])

# Reading CSV
with open("data.csv", "r") as f:
    reader = csv.reader(f)
    for row in reader:
        print(row)

# ---------------------------

# 15. File Info and Metadata
import os
info = os.stat("example.txt")
print(info.st_size)                             # File size in bytes
print(info.st_mtime)                            # Last modification time (timestamp)

# ---------------------------

# 16. File Encoding
with open("utf_file.txt", "w", encoding="utf-8") as f:
    f.write("สวัสดี")                          # Write Thai text safely

with open("utf_file.txt", "r", encoding="utf-8") as f:
    print(f.read())                             # Read with proper encoding

# ---------------------------

# 17. Exception Handling in Files
try:
    with open("missing.txt", "r") as f:
        print(f.read())
except FileNotFoundError:
    print("File not found!")                    # Handle missing file safely
except PermissionError:
    print("Permission denied!")
finally:
    print("Done checking file.")

# ---------------------------

# 18. Copying Files
import shutil

shutil.copy("example.txt", "backup.txt")        # Copy file
shutil.copy2("example.txt", "backup/")          # Copy with metadata
shutil.move("backup.txt", "archive/backup.txt") # Move file

# ---------------------------

# 19. Reading Large Files Efficiently
def read_large_file(filename):
    with open(filename, "r") as f:
        for line in f:
            yield line.strip()                  # Use generator for memory efficiency

for line in read_large_file("bigfile.txt"):
    print(line)