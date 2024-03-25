local UI = script.Parent.Parent
local CommanderPkg = script.Parent.Parent.Parent.Parent
local Packages = CommanderPkg.Parent

local Fusion = require(Packages.Fusion)
local ThemeProvider = require(UI.ThemeProvider)

local New = Fusion.New
local Children = Fusion.Children
local OnEvent = Fusion.OnEvent
local State = Fusion.State

return function(params)
    local buttonTransparencyState = State(1)
    return New "TextButton" {
        Text = "",
        BackgroundColor3 = Color3.new(0, 0, 0),
        BackgroundTransparency = buttonTransparencyState,
        Size = UDim2.fromScale(1, 1),
        LayoutOrder = params.LayoutOrder or 0,
        ZIndex = params.ZIndex or 0,

        [Children] = {
            New "UIAspectRatioConstraint" { },

            New "ImageLabel" {
                Image = params.Image,
                ImageColor3 = ThemeProvider.Color.HeaderText,
                AnchorPoint = Vector2.new(0.5, 0.5),
                BackgroundTransparency = 1,
                Position = UDim2.fromScale(0.5, 0.5),
                Size = UDim2.fromScale(0.5, 0.5),
            },

            New "UIStroke" {
                ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
                Color = ThemeProvider.Color.Separator,
            },
        },

        [OnEvent "MouseEnter"] = function()
            buttonTransparencyState:set(0.95)
        end,

        [OnEvent "MouseLeave"] = function()
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