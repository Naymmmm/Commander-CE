local UI = script.Parent
local CommanderPkg = script.Parent.Parent.Parent
local Packages = CommanderPkg.Parent

local Fusion = require(Packages.Fusion)
local ThemeProvider = require(UI.ThemeProvider)

local New = Fusion.New
local Children = Fusion.Children

local function windowControl(params)
    return New "Frame" {
        BackgroundColor3 = ThemeProvider.Color.WindowControlBackground,
        BorderSizePixel = 0,
        Size = UDim2.new(1, 0, 0, 32),

        [Children] = {
            New "UIStroke" {
                Color = ThemeProvider.Color.Separator,
            },

            New "UIPadding" {
                PaddingTop = UDim.new(0, 1),
            },

            New "TextLabel" {
                BackgroundTransparency = 1,
                Text = params.Title or "Window",
                Font = ThemeProvider.Font.Headline.Type,
                TextSize = ThemeProvider.Font.Headline.Size,
                TextColor3 = ThemeProvider.Color.AltText,
                TextXAlignment = Enum.TextXAlignment.Left,
                Size = UDim2.fromScale(0, 1),
                Position = UDim2.fromOffset(9, 0),
            },

            New "TextButton" {
                BackgroundTransparency = 1,
                Text = "",
                AnchorPoint = Vector2.new(1, 0),
                Size = UDim2.fromScale(1, 1),
                Position = UDim2.fromScale(1, 0),

                [Children] = {
                    New "ImageLabel" {
                        BackgroundTransparency = 1,
                        Image = "rbxassetid://10747384394",
                        ImageColor3 = ThemeProvider.Color.AltText,
                        AnchorPoint = Vector2.new(0.5, 0.5),
                        Size = UDim2.fromScale(0.6, 0.6),
                        Position = UDim2.fromScale(0.5, 0.5),
                    },

                    New "UIAspectRatioConstraint" {
                        AspectRatio = 1,
                    },
                },
            },

            New "TextButton" {
                Text = "",
                AnchorPoint = Vector2.new(0.5, 0),
                BackgroundTransparency = 1,
                Position = UDim2.fromScale(0.5, 0),
                Size = UDim2.fromScale(0.15, 1),

                [Children] = {
                    New "ImageButton" {
                        Image = "rbxassetid://2935604064",
                        ImageColor3 = ThemeProvider.Color.AltAltText,
                        ScaleType = Enum.ScaleType.Slice,
                        SliceCenter = Rect.new(256, 256, 256, 256),
                        AnchorPoint = Vector2.new(0, 0.5),
                        BackgroundTransparency = 1,
                        Position = UDim2.fromScale(0, 0.5),
                        Size = UDim2.new(1, 0, 0, 2),
                    },
                },
            },
        }
    }
end

return function(params)
	return New "CanvasGroup" {
		GroupTransparency = params.GroupTransparency,
		BackgroundColor3 = ThemeProvider.Color.MainBackground,
		BorderSizePixel = 0,
		Size = UDim2.fromScale(1, 1),
		Parent = params.Parent,

		[Children] = {
			New "UICorner" {
				CornerRadius = UDim.new(0, 6),
			},

			New "UIStroke" {
				Color = Color3.new(0, 0, 0),
				Thickness = 2,
				Transparency = 0.8,
			},

			New "UISizeConstraint" {
				MinSize = params.MinSize or Vector2.new(450, 300)
			},

			New "UIAspectRatioConstraint" {
				AspectRatio = params.AspectRatio or 1.3,
				AspectType = Enum.AspectType.ScaleWithParentSize,
				DominantAxis = Enum.DominantAxis.Height,
			},

			windowControl {

            },

            New "Frame" {
                BackgroundTransparency = 1,
                Size = UDim2.new(1, 0, 1, -32),
                Position = UDim2.fromOffset(0, 32),

                [Children] = params[Children]
            }
		},
	}
end