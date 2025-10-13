local moduleScript = {
    myString = "Hello World!",              -- A string property in the table
    myNumber = 10                           -- A number property in the table
}

function moduleScript.firstFunction()       -- Define a normal function
    return ...
end

function moduleScript:secondFunction()      -- Define a self passed function (using colon)
    print(self)                             -- self refers to the object (moduleScript)
    return ...
end
