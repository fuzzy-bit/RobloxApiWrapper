--SERVICES--
local HttpService = game:GetService("HttpService")
local ServerStorage = game:GetService("ServerStorage")



--MODULES--
local RobloxApi = require(ServerStorage:WaitForChild("RobloxApi"))
local DumpJSON = require(script.DumpJSON) -- update this every once in a blue moon



--PRIVATE VARIABLES--
local UseHttpService = true
local DumpURL = "https://raw.githubusercontent.com/MaximumADHD/Roblox-Client-Tracker/roblox/Mini-API-Dump.json"

local ApiObject



--PRIVATE FUNCTIONS--
local function CreateApiObject()
	if UseHttpService then
		local Success, Error = pcall(function()
			ApiObject = RobloxApi.new(DumpURL, true)
		end)

		if not Success then
			warn("Could not use DumpURL! Falling back to local JSON data.")
			ApiObject = RobloxApi.new(HttpService:JSONDecode(DumpJSON), true)
		end
	else
		ApiObject = RobloxApi.new(HttpService:JSONDecode(DumpJSON), true)
	end
end



--INIT--
CreateApiObject()
print(ApiObject:GetClass("Part"))
print(ApiObject:GetMember("Part", "Position"))