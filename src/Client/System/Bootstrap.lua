local Commander = require(script.Parent.Parent.Parent)
local Window = Commander.Window
local Parameters = {
    Title = "WOw"

}

local self = {}

        
    function self.Init(Parameters)
        Window(Parameters)
    end

return self