local HttpService = game:GetService("HttpService")

-- Properties
HttpService.HttpEnabled = true                                                      -- Must be enabled in Studio settings too

-- Methods
local guid = HttpService:GenerateGUID(false)                                        -- Generate a GUID (Globally Unique Identifier)
local jsonData = HttpService:JSONEncode({name = "TestUser", score = 123})           -- Encode Lua table to JSON
local decodedTable = HttpService:JSONDecode(jsonData)                               -- Decode JSON to Lua table

-- :GetAsync(url) — Simple GET request, returns response body as string.
local function makeGetRequest()
    local url = "https://jsonplaceholder.typicode.com/posts/1"
    local success, result = pcall(function()
        return HttpService:GetAsync(url)
    end)
    
    if success then
        local data = HttpService:JSONDecode(result)
        print("GET Title:", data.title)
    else
        warn("GET failed:", result)
    end
end

-- :PostAsync(url, data, contentType) — Sends data via POST, usually JSON.
local function makePostRequest()
    local url = "https://httpbin.org/post"
    local payload = HttpService:JSONEncode({ message = "Hello from Roblox" })
    
    local success, response = pcall(function()
        return HttpService:PostAsync(url, payload, Enum.HttpContentType.ApplicationJson)
    end)

    if success then
        print("POST Response:", response)
    else
        warn("POST failed:", response)
    end
end

-- :RequestAsync(options) — Full custom request (method, headers, body, etc.).
local function makeRequestAsync()
    local response = HttpService:RequestAsync({
        Url = "https://httpbin.org/anything",
        Method = "POST",
        Headers = {
            ["Content-Type"] = "application/json"
        },
        Body = HttpService:JSONEncode({ user = "Roblox", score = 999 })
    })

    if response.Success then
        print("RequestAsync status:", response.StatusCode)
        print("Body:", response.Body)
    else
        warn("RequestAsync failed:", response.StatusCode, response.StatusMessage)
    end
end

makeGetRequest()
makePostRequest()
makeRequestAsync()
