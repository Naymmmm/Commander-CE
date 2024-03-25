local UI = script.Parent
local CommanderPkg = script.Parent.Parent.Parent
local Packages = CommanderPkg.Parent

local Fusion = require(Packages.Fusion)
local ThemeProvider = require(UI.ThemeProvider)

local New = Fusion.New
local Children = Fusion.Children
local Computed = Fusion.Computed

return function(params)
    return New "Frame" {
        AutomaticSize = Enum.AutomaticSize.Y,
        BackgroundTransparency = 1,
        LayoutOrder = params.LayoutOrder or 0,
        Size = UDim2.fromScale(1, 0),
        Visible = Computed(function()
            return next(params[Children]:get()) ~= nil
        end),

        [Children] = {
            New "TextLabel" {
                Font = ThemeProvider.Font.Headline.Type,
                TextSize = ThemeProvider.Font.Headline.Size,
                Text = params.Title,
                TextColor3 = ThemeProvider.Color.AltAltText,
                TextXAlignment = Enum.TextXAlignment.Left,
                AutomaticSize = Enum.AutomaticSize.Y,
                Visible = Computed(function()
                    return params.Title:get() and params.Title:get() ~= ""
                end),
                BackgroundTransparency = 1,
                Size = UDim2.new(1, 0, 0, 16),
            },

            New "UIPadding" {
                PaddingBottom = UDim.new(0, 12),
                PaddingLeft = UDim.new(0, 24),
                PaddingRight = UDim.new(0, 24),
            },

            New "UIListLayout" {
                Padding = UDim.new(0, 8),
                SortOrder = Enum.SortOrder.LayoutOrder,
            },

            New "Frame" {
                AutomaticSize = Enum.AutomaticSize.Y,
                BackgroundColor3 = ThemeProvider.Color.TableBackground,
                ClipsDescendants = true,
                LayoutOrder = 1,
                Size = UDim2.fromScale(1, 0),

                [Children] = {
                    New "UICorner" {
                        CornerRadius = UDim.new(0, 6),
                    },

                    New "UIStroke" {
                        Color = ThemeProvider.Color.Separator,
                    },

                    New "UIListLayout" {
                        Padding = UDim.new(0, 1),
                        SortOrder = Enum.SortOrder.LayoutOrder,
                    },

                    New "UIPadding" {
                        PaddingTop = UDim.new(0, 1),
                    },

                    params[Children],
                }
            },
        }
    }
end