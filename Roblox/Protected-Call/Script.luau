-- Protected Call Function:
    -- Protected call or pcall() runs a function safely, catching errors so the script doesn't crash
    -- Use pcall when calling DataStore methods to handle possible errors like network issues or rate limits
    -- Returns (success:boolean, result:string)
    -- If Success returns (true, <reteived data>), otherwise returns (false, message)
    -- Protected Call receives parameters through the second arguement and so on. (pcall(function, ...))
local success, result = pcall(function(num)
    ...
    return ...
end,10)