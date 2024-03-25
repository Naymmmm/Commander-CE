local UI = script.Parent
local CommanderPkg = script.Parent.Parent.Parent
local Packages = CommanderPkg.Parent

local Fusion = require(Packages.Fusion)
local ThemeProvider = require(UI.ThemeProvider)

local New = Fusion.New
local Children = Fusion.Children
local OnEvent = Fusion.OnEvent
local State = Fusion.State
local Computed = Fusion.Computed

return function(params)
    local buttonTransparencyState = State(1)
    return New "TextButton" {
        Text = "",
        AutomaticSize = Enum.AutomaticSize.X,
        BackgroundColor3 = ThemeProvider.Color.ButtonBackground,
        LayoutOrder = params.LayoutOrder,
        Size = UDim2.fromOffset(0, 38),

        [Children] = {
            New "UICorner" {
                CornerRadius = UDim.new(0, 6),
            },

            New "UIStroke" {
                ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
                Color = ThemeProvider.Color.Separator,
            },

            New "Frame" {
                AutomaticSize = Enum.AutomaticSize.X,
                BackgroundColor3 = Color3.new(0, 0, 0),
                BackgroundTransparency = buttonTransparencyState,
                BorderSizePixel = 0,
                Size = UDim2.fromScale(0, 1),

                [Children] = {
                    New "UIPadding" {
                        PaddingBottom = UDim.new(0, 12),
                        PaddingLeft = UDim.new(0, 24),
                        PaddingRight = UDim.new(0, 24),
                        PaddingTop = UDim.new(0, 12),
                    },

                    New "UIListLayout" {
                        FillDirection = Enum.FillDirection.Horizontal,
                        SortOrder = Enum.SortOrder.LayoutOrder,
                        VerticalAlignment = Enum.VerticalAlignment.Center,
                    },

                    New "TextLabel" {
                        Font = ThemeProvider.Font.Body.Type,
                        TextColor3 = ThemeProvider.Color.MainText,
                        TextSize = ThemeProvider.Font.Body.Size,
                        TextWrapped = true,
                        Text = params.Title,
                        AutomaticSize = Enum.AutomaticSize.X,
                        BackgroundTransparency = 1,
                        LayoutOrder = 1,
                        Size = UDim2.fromOffset(0, 14),
                    },

                    New "ImageLabel" {
                        Image = params.Icon,
                        ImageColor3 = ThemeProvider.Color.MainText,
                        BackgroundTransparency = 1,
                        Size = UDim2.fromOffset(18, 18),
                        Visible = Computed(function()
                            return params.Icon:get() ~= ""
                        end),
                    },

                    New "UICorner" {
                        CornerRadius = UDim.new(0, 6),
                    },
                }
            }
        },

        [OnEvent "MouseEnter"] = function()
            buttonTransparencyState:set(0.95)
        end,

        [OnEvent "MouseLeaave"] = function()
            buttonTransparencyState:set(1)
        end,

        [OnEvent "MouseButton1Down"] = function()
            buttonTransparencyState:set(0.85)
        end,

        [OnEvent "MouseButton1Click"] = function()
            buttonTransparencyState:set(1)
            if params.OnClick then params.OnClick() end
        end,
    }
end