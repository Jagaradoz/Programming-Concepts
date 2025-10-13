local DataStoreService = game:GetService("DataStoreService")

local orderedDataStore = DataStoreService:GetOrderedDataStore("MyOrderedDataStore")

-- Methods:
    -- 1. :GetSortedAsync(ascending, pageSize): Retrieves a page of sorted data; returns a page object
    -- 2. :GetCurrentPage(): Returns a table of entries for the current page
    -- 3. :AdvanceToNextPageAsync(): Loads the next page of sorted entries (returns new page or nil if none)
local page = orderedDataStore:GetSortedAsync(false, 50)
local currentPageEntries = page:GetCurrentPage()
local nextPage = page:AdvanceToNextPageAsync()

-- Usage Exmaple:
local success, page = pcall(function()
    return orderedDataStore:GetSortedAsync(false, 50)
end)

if success and page then
    while success and page do
        local entries = page:GetCurrentPage()
        for _, entry in ipairs(entries) do
            print("Key:", entry.key, "Value:", entry.value)
        end
        success, page = pcall(function()
            return page:AdvanceToNextPageAsync()
        end)
    end
else
    warn("Failed to get sorted data")
end
