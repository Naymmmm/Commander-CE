local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage:WaitForChild("Packages")
local Commander = require(Packages.Commander)
local Parameters = {
    Title = "WOw"

}

Commander.Window.WindowControl(Parameters)