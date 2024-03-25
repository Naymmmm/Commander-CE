local UI = script.Parent.Parent
local CommanderPkg = script.Parent.Parent.Parent.Parent
local Packages = CommanderPkg.Parent

local Fusion = require(Packages.Fusion)
local ThemeProvider = require(UI.ThemeProvider)

local New = Fusion.New
local Children = Fusion.Children
local OnEvent = Fusion.OnEvent
local State = Fusion.State
local Computed = Fusion.Computed

local function leftTableItem(params)
	return New "Frame" {
		AutomaticSize = Enum.AutomaticSize.X,
		BackgroundTransparency = 1,
		Size = UDim2.new(0.75, 0, 0, 46),

		[Children] = {
			New "UIListLayout" {
				SortOrder = Enum.SortOrder.LayoutOrder,
				VerticalAlignment = Enum.VerticalAlignment.Center,
			},

			New "UIPadding" {
				PaddingLeft = UDim.new(0, 9),
			},

			New "TextLabel" {
				Font = ThemeProvider.Font.Body.Type,
				TextColor3 = ThemeProvider.Color.MainText,
				TextSize = ThemeProvider.Font.Body.Size,
				TextWrapped = true,
				Text = params.Title,
				TextXAlignment = Enum.TextXAlignment.Left,
				AutomaticSize = Enum.AutomaticSize.X,
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 0, 14),
			},

			New "TextLabel" {
				Font = ThemeProvider.Font.Subheadline.Type,
				TextColor3 = ThemeProvider.Color.AltText,
				TextSize = ThemeProvider.Subheadline.Size,
				TextWrapped = true,
				Text = params.Description,
				Visible = Computed(function()
					return params.Description:get() and params.Description:get() ~= ""
				end),
				TextXAlignment = Enum.TextXAlignment.Left,
				AutomaticSize = Enum.AutomaticSize.Y,
				BackgroundTransparency = 1,
				LayoutOrder = 1,
				Size = UDim2.new(1, 0, 0, 14),
			}
		}
	}
end

local function rightTableItem(params)
	return New "Frame" {
		BackgroundTransparency = 1,
		Size = UDim2.new(0.25, 0, 0, 46),

		[Children] = {
			New "UIListLayout" {
				FillDirection = Enum.FillDirection.Horizontal,
				HorizontalAlignment = Enum.HorizontalAlignment.Right,
				SortOrder = Enum.SortOrder.LayoutOrder,
				VerticalAlignment = Enum.VerticalAlignment.Center,
			},

			New "UIPadding" {
				PaddingRight = UDim.new(0, 9),
			},

			params[Children],
		}
	}
end

return function(params)
	local buttonTransparencyState = State(1)
	return New "TextButton" {
		AutomaticSize = Enum.AutomaticSize.Y,
		BackgroundColor3 = Color3.new(0, 0, 0),
		BackgroundTransparency = buttonTransparencyState,
		Text = "",
		LayoutOrder = params.LayoutOrder or 1,
		Size = UDim2.new(1, 0, 0, 46),

		[Children] = {
			New "Frame" {
				BackgroundColor3 = ThemeProvider.Color.Separator,
				BorderSizePixel = 0,
				Position = UDim2.fromScale(0, 1),
				Size = UDim2.new(1, 0, 0, 1),
			},

			rightTableItem(params),

			leftTableItem(params),
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