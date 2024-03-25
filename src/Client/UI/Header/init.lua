local UI = script.Parent
local CommanderPkg = script.Parent.Parent.Parent
local Packages = CommanderPkg.Parent

local Fusion = require(Packages.Fusion)
local ThemeProvider = require(UI.ThemeProvider)

local New = Fusion.New
local Children = Fusion.Children

return function(params)
    return New "Frame" {
        BackgroundColor3 = ThemeProvider.Color.HeaderBackground,
        BackgroundTransparency = 0,
        BorderSizePixel = 0,
        Size = UDim2.new(1, 0, 0, 40),
        ZIndex = params.ZIndex or 0,

        [Children] = {
            New "UIStroke" {
                Color = ThemeProvider.Color.Separator,
                Thickness = 2,
            },

            New "Frame" {
                BackgroundTransparency = 1,
                Size = UDim2.fromScale(1, 1),

                [Children] = {
                    New "UIListLayout" {
                        Padding = UDim.new(0, 1),
                        FillDirection = Enum.FillDirection.Horizontal,
                        HorizontalAlignment = Enum.HorizontalAlignment.Right,
                        SortOrder = Enum.SortOrder.LayoutOrder,
                    },

                    params.Right[Children],
                }
            },

            New "Frame" {
                BackgroundTransparency = 1,
                Size = UDim2.fromScale(1, 1),

                [Children] = {
                    New "UIListLayout" {
                        Padding = UDim.new(0, 1),
                        FillDirection = Enum.FillDirection.Horizontal,
                        SortOrder = Enum.SortOrder.LayoutOrder,
                    },

                    params.Left[Children],
                }
            },
        }
    }
end