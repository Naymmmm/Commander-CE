local UI = script.Parent
local CommanderPkg = script.Parent.Parent.Parent
local Packages = CommanderPkg.Parent

local Fusion = require(Packages.Fusion)
local ThemeProvider = require(UI.ThemeProvider)

local New = Fusion.New
local Children = Fusion.Children

local component = require(script.Parent.Window)
local headerComp = require(script.Parent.Header)
local headerItemComp = require(script.Parent.Header.HeaderItem)

return function(target)
    local newComp = component {
        Parent = target,

        [Children] = {
            headerComp {
                Left = {
                    [Children] = {
                        headerItemComp {
                            Image = "rbxassetid://7734058165",
                        }
                    }
                },
                Right = {
                    [Children] = {
                        headerItemComp {
                            Image = "rbxassetid://7734052925",
                        },

                        headerItemComp {
                            LayoutOrder = 1,
                            Image = "rbxassetid://7743876054",
                        },
                    }
                },
            }
        }
    }
    
    return function()
        newComp:Destroy()
    end
end