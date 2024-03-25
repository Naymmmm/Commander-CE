local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage:WaitForChild("Packages")
local Commander = require(Packages.Commander)

Commander.Bootstrap:Init()