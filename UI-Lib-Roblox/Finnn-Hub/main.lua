-- Finnn Hub UI Library

local FinnnHub = {}
local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- Keep track of active notifications
local ActiveNotifications = {}
local NotificationPadding = 10 -- Space between notifications

-- Tween Configuration
local function CreateTween(instance, properties, duration, easingStyle, easingDirection)
    local tweenInfo = TweenInfo.new(
        duration or 0.5,
        easingStyle or Enum.EasingStyle.Quint,
        easingDirection or Enum.EasingDirection.Out
    )
    
    local tween = TweenService:Create(instance, tweenInfo, properties)
    return tween
end

-- Create Main UI
function FinnnHub:CreateWindow(config)
    config = config or {}
    local windowTitle = config.Title or "Finnn Hub"
    local windowContent = config.Content or ""
    
    -- Main UI
    local HubUI = Instance.new('ScreenGui')
    HubUI.Name = "HubUI"
    HubUI.Parent = game.Players.LocalPlayer.PlayerGui
    
    local Background = Instance.new('Frame')
    Background.Name = "Background"
    Background.Parent = HubUI
    Background.BackgroundColor3 = Color3.fromRGB(77, 77, 77)
    Background.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Background.BorderSizePixel = 0
    Background.Position = UDim2.new(0.174, 0, 0.183, 0)
    Background.Size = UDim2.new(0, 500, 0, 300)
    
    local UICorner = Instance.new('UICorner')
    UICorner.Name = "UICorner"
    UICorner.Parent = Background
    
    local DestroyUI = Instance.new('ImageButton')
    DestroyUI.Name = "DestroyUI"
    DestroyUI.Parent = Background
    DestroyUI.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
    DestroyUI.BackgroundTransparency = 0.3
    DestroyUI.BorderColor3 = Color3.fromRGB(255, 255, 255)
    DestroyUI.Position = UDim2.new(0.94, 0, 0, 0)
    DestroyUI.Size = UDim2.new(0, 30, 0, 30)
    
    local UICorner_1 = Instance.new('UICorner')
    UICorner_1.Name = "UICorner"
    UICorner_1.Parent = DestroyUI
    
    local MinimizeUI = Instance.new('ImageButton')
    MinimizeUI.Name = "MinimizeUI"
    MinimizeUI.Parent = Background
    MinimizeUI.BackgroundColor3 = Color3.fromRGB(255, 255, 100)
    MinimizeUI.BackgroundTransparency = 0.3
    MinimizeUI.BorderColor3 = Color3.fromRGB(255, 255, 255)
    MinimizeUI.Position = UDim2.new(0.88, 0, 0, 0)
    MinimizeUI.Size = UDim2.new(0, 30, 0, 30)
    
    local UICorner_2 = Instance.new('UICorner')
    UICorner_2.Name = "UICorner"
    UICorner_2.Parent = MinimizeUI
    
    local TitleUI = Instance.new('TextLabel')
    TitleUI.Name = "TitleUI"
    TitleUI.Parent = Background
    TitleUI.TextScaled = true
    TitleUI.Text = windowTitle
    TitleUI.TextColor3 = Color3.fromRGB(255, 255, 255)
    TitleUI.RichText = true
    TitleUI.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TitleUI.BackgroundTransparency = 1
    TitleUI.BorderColor3 = Color3.fromRGB(0, 0, 0)
    TitleUI.BorderSizePixel = 0
    TitleUI.Size = UDim2.new(0, 440, 0, 30)
    
    local Line = Instance.new('Frame')
    Line.Name = "Line"
    Line.Parent = Background
    Line.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Line.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Line.BorderSizePixel = 0
    Line.Position = UDim2.new(0.14, 0, 0.1, 0)
    Line.Size = UDim2.new(0, 300, 0, 3)
    
    local BackgroundIn = Instance.new('Frame')
    BackgroundIn.Name = "BackgroundIn"
    BackgroundIn.Parent = Background
    BackgroundIn.BackgroundColor3 = Color3.fromRGB(16, 16, 16)
    BackgroundIn.BorderColor3 = Color3.fromRGB(0, 0, 0)
    BackgroundIn.BorderSizePixel = 0
    BackgroundIn.Position = UDim2.new(0.222, 0, 0.15, 0)
    BackgroundIn.Size = UDim2.new(0, 380, 0, 247)
    
    -- Create ScrollingFrame inside BackgroundIn to contain elements
    local ElementsContainer = Instance.new('ScrollingFrame')
    ElementsContainer.Name = "ElementsContainer"
    ElementsContainer.Parent = BackgroundIn
    ElementsContainer.BackgroundTransparency = 1
    ElementsContainer.BorderSizePixel = 0
    ElementsContainer.Size = UDim2.new(1, 0, 1, 0)
    ElementsContainer.CanvasSize = UDim2.new(0, 0, 0, 0) -- Will adjust dynamically
    ElementsContainer.ScrollBarThickness = 4
    ElementsContainer.ScrollBarImageColor3 = Color3.fromRGB(255, 255, 255)
    ElementsContainer.ScrollBarImageTransparency = 0.7
    ElementsContainer.AutomaticCanvasSize = Enum.AutomaticSize.Y -- Auto adjusts canvas size
    
    -- Add UI layout for auto spacing elements
    local UIListLayout = Instance.new('UIListLayout')
    UIListLayout.Name = "UIListLayout"
    UIListLayout.Parent = ElementsContainer
    UIListLayout.Padding = UDim.new(0, 10)
    UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
    
    -- Add padding around the edges
    local UIPadding = Instance.new('UIPadding')
    UIPadding.Parent = ElementsContainer
    UIPadding.PaddingTop = UDim.new(0, 10)
    UIPadding.PaddingBottom = UDim.new(0, 10)
    UIPadding.PaddingLeft = UDim.new(0, 5)
    UIPadding.PaddingRight = UDim.new(0, 5)
    
    local UICorner_3 = Instance.new('UICorner')
    UICorner_3.Name = "UICorner"
    UICorner_3.Parent = BackgroundIn
    
    local Tabs = Instance.new('Frame')
    Tabs.Name = "Tabs"
    Tabs.Parent = Background
    Tabs.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    Tabs.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Tabs.BorderSizePixel = 0
    Tabs.Position = UDim2.new(0.01, 0, 0.15, 0)
    Tabs.Size = UDim2.new(0, 100, 0, 247)
    
    -- Add ScrollingFrame for tabs to make them scrollable if there are many
    local TabsContainer = Instance.new('ScrollingFrame')
    TabsContainer.Name = "TabsContainer"
    TabsContainer.Parent = Tabs
    TabsContainer.BackgroundTransparency = 1
    TabsContainer.BorderSizePixel = 0
    TabsContainer.Size = UDim2.new(1, 0, 1, 0)
    TabsContainer.CanvasSize = UDim2.new(0, 0, 0, 0)
    TabsContainer.ScrollBarThickness = 4
    TabsContainer.ScrollBarImageColor3 = Color3.fromRGB(255, 255, 255)
    TabsContainer.ScrollBarImageTransparency = 0.7
    TabsContainer.AutomaticCanvasSize = Enum.AutomaticSize.Y
    
    -- Layout for tabs
    local TabsUIListLayout = Instance.new('UIListLayout')
    TabsUIListLayout.Name = "UIListLayout"
    TabsUIListLayout.Parent = TabsContainer
    TabsUIListLayout.Padding = UDim.new(0, 5)
    TabsUIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    TabsUIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
    
    -- Padding for tabs
    local TabsUIPadding = Instance.new('UIPadding')
    TabsUIPadding.Parent = TabsContainer
    TabsUIPadding.PaddingTop = UDim.new(0, 5)
    TabsUIPadding.PaddingBottom = UDim.new(0, 5)
    
    local UICorner_7 = Instance.new('UICorner')
    UICorner_7.Name = "UICorner"
    UICorner_7.Parent = Tabs
    
    -- Add window content text if provided
    if windowContent and windowContent ~= "" then
        local ContentText = Instance.new('TextLabel')
        ContentText.Name = "ContentText"
        ContentText.Parent = Background
        ContentText.Text = windowContent
        ContentText.TextColor3 = Color3.fromRGB(255, 255, 255)
        ContentText.BackgroundTransparency = 1
        ContentText.Position = UDim2.new(0.02, 0, 0.07, 0)
        ContentText.Size = UDim2.new(0, 200, 0, 15)
        ContentText.Font = Enum.Font.SourceSans
        ContentText.TextSize = 14
        ContentText.TextXAlignment = Enum.TextXAlignment.Left
    end
    
    -- Minimize and Destroy functionality
    local isMinimized = false
    local originalSize = Background.Size
    local originalPosition = Background.Position
    
    MinimizeUI.MouseButton1Click:Connect(function()
        if isMinimized then
            -- Restore
            local restoreTween = CreateTween(Background, {
                Size = originalSize,
                Position = originalPosition
            }, 0.5)
            restoreTween:Play()
            
            -- Restore content visibility
            local fadeTween = CreateTween(BackgroundIn, {BackgroundTransparency = 0}, 0.5)
            fadeTween:Play()
            
            local tabsFadeTween = CreateTween(Tabs, {BackgroundTransparency = 0}, 0.5)
            tabsFadeTween:Play()
            
            Line.Visible = true
        else
            -- Minimize
            local minimizeTween = CreateTween(Background, {
                Size = UDim2.new(0, 500, 0, 30),
                Position = UDim2.new(0.174, 0, 0.183, 0)
            }, 0.5)
            minimizeTween:Play()
            
            -- Hide content
            local fadeTween = CreateTween(BackgroundIn, {BackgroundTransparency = 1}, 0.3)
            fadeTween:Play()
            
            local tabsFadeTween = CreateTween(Tabs, {BackgroundTransparency = 1}, 0.3)
            tabsFadeTween:Play()
            
            Line.Visible = false
        end
        
        isMinimized = not isMinimized
    end)
    
    DestroyUI.MouseButton1Click:Connect(function()
        -- Destroy animation
        local closeTween = CreateTween(Background, {
            Size = UDim2.new(0, 0, 0, 0),
            Position = UDim2.new(0.174 + 0.25, 0, 0.183 + 0.15, 0)
        }, 0.5)
        closeTween:Play()
        
        local fadeTween = CreateTween(Background, {BackgroundTransparency = 1}, 0.5)
        fadeTween:Play()
        
        -- Wait for animation to complete
        closeTween.Completed:Wait()
        HubUI:Destroy()
    end)
    
    -- Draggable functionality
    local isDragging = false
    local dragInput
    local dragStart
    local startPos
    
    local function updateDrag(input)
        local delta = input.Position - dragStart
        Background.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
    
    Background.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            isDragging = true
            dragStart = input.Position
            startPos = Background.Position
            
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    isDragging = false
                end
            end)
        end
    end)
    
    Background.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement then
            dragInput = input
        end
    end)
    
    game:GetService("UserInputService").InputChanged:Connect(function(input)
        if input == dragInput and isDragging then
            updateDrag(input)
        end
    end)
    
    -- Tab management
    local tabContents = {}
    local currentTabContent = nil
    local tabCounter = 0
    
    local WindowObj = {}
    
    function WindowObj:CreateTab(tabName)
        tabCounter = tabCounter + 1
        
        -- Create tab button
        local Tab = Instance.new('TextButton')
        Tab.Name = "Tab" .. tabCounter
        Tab.Parent = TabsContainer
        Tab.Text = tabName
        Tab.TextColor3 = Color3.fromRGB(255, 255, 255)
        Tab.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Tab.BackgroundTransparency = 0.85
        Tab.BorderColor3 = Color3.fromRGB(0, 0, 0)
        Tab.BorderSizePixel = 0
        Tab.Size = UDim2.new(0, 90, 0, 25)
        Tab.LayoutOrder = tabCounter
        
        local UICorner_Tab = Instance.new('UICorner')
        UICorner_Tab.Name = "UICorner"
        UICorner_Tab.Parent = Tab
        
        -- Create content container for this tab
        local TabContent = Instance.new('ScrollingFrame')
        TabContent.Name = "TabContent_" .. tabCounter
        TabContent.Parent = BackgroundIn
        TabContent.BackgroundTransparency = 1
        TabContent.Size = UDim2.new(1, 0, 1, 0)
        TabContent.CanvasSize = UDim2.new(0, 0, 0, 0)
        TabContent.ScrollBarThickness = 4
        TabContent.ScrollBarImageColor3 = Color3.fromRGB(255, 255, 255)
        TabContent.ScrollBarImageTransparency = 0.7
        TabContent.Visible = false
        TabContent.AutomaticCanvasSize = Enum.AutomaticSize.Y
        
        -- Add UI layout for elements in this tab
        local TabUIListLayout = Instance.new('UIListLayout')
        TabUIListLayout.Name = "UIListLayout"
        TabUIListLayout.Parent = TabContent
        TabUIListLayout.Padding = UDim.new(0, 10)
        TabUIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
        TabUIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
        
        -- Add padding
        local TabUIPadding = Instance.new('UIPadding')
        TabUIPadding.Parent = TabContent
        TabUIPadding.PaddingTop = UDim.new(0, 10)
        TabUIPadding.PaddingBottom = UDim.new(0, 10)
        TabUIPadding.PaddingLeft = UDim.new(0, 5)
        TabUIPadding.PaddingRight = UDim.new(0, 5)
        
        -- Store reference to tab content
        tabContents[tabCounter] = TabContent
        
        -- Show this tab on creation if it's the first one
        if tabCounter == 1 then
            TabContent.Visible = true
            currentTabContent = TabContent
            Tab.BackgroundTransparency = 0.5 -- Highlight active tab
        end
        
        -- Switch tabs when clicked
        Tab.MouseButton1Click:Connect(function()
            if currentTabContent then
                currentTabContent.Visible = false
            end
            
            -- Reset all tab buttons
            for _, child in pairs(TabsContainer:GetChildren()) do
                if child:IsA("TextButton") then
                    CreateTween(child, {BackgroundTransparency = 0.85}, 0.3):Play()
                end
            end
            
            -- Highlight selected tab and show its content
            CreateTween(Tab, {BackgroundTransparency = 0.5}, 0.3):Play()
            
            TabContent.Visible = true
            currentTabContent = TabContent
        end)
        
        -- Tab content methods
        local TabObj = {}
        local elementCounter = 0
        
        function TabObj:CreateText(text)
            elementCounter = elementCounter + 1
            
            local TextLabel = Instance.new('TextLabel')
            TextLabel.Name = "Text_" .. elementCounter
            TextLabel.Parent = TabContent
            TextLabel.TextScaled = true
            TextLabel.Text = text
            TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
            TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            TextLabel.BackgroundTransparency = 0.9
            TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
            TextLabel.BorderSizePixel = 0
            TextLabel.Size = UDim2.new(0.95, 0, 0, 22)
            TextLabel.LayoutOrder = elementCounter
            
            local UICorner_Text = Instance.new('UICorner')
            UICorner_Text.Name = "UICorner"
            UICorner_Text.Parent = TextLabel
            
            -- Animation
            TextLabel.BackgroundTransparency = 1
            TextLabel.TextTransparency = 1
            CreateTween(TextLabel, {BackgroundTransparency = 0.9, TextTransparency = 0}, 0.5):Play()
            
            return TextLabel
        end
        
        function TabObj:CreateToggle(config)
            elementCounter = elementCounter + 1
            
            local toggleConfig = config or {}
            local toggleTitle = toggleConfig.Title or "Toggle Button"
            local toggleCallback = toggleConfig.Callback or function() end
            
            local ToggleButton = Instance.new('Frame')
            ToggleButton.Name = "Toggle_" .. elementCounter
            ToggleButton.Parent = TabContent
            ToggleButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            ToggleButton.BackgroundTransparency = 0.9
            ToggleButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
            ToggleButton.BorderSizePixel = 0
            ToggleButton.Size = UDim2.new(0.95, 0, 0, 30)
            ToggleButton.LayoutOrder = elementCounter
            
            local UICorner_Toggle = Instance.new('UICorner')
            UICorner_Toggle.Name = "UICorner"
            UICorner_Toggle.Parent = ToggleButton
            
            local ToggleButtonTitle = Instance.new('TextLabel')
            ToggleButtonTitle.Name = "ToggleButtonTitle"
            ToggleButtonTitle.Parent = ToggleButton
            ToggleButtonTitle.Text = toggleTitle
            ToggleButtonTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
            ToggleButtonTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            ToggleButtonTitle.BackgroundTransparency = 1
            ToggleButtonTitle.BorderColor3 = Color3.fromRGB(0, 0, 0)
            ToggleButtonTitle.BorderSizePixel = 0
            ToggleButtonTitle.Position = UDim2.new(0.02, 0, 0, 0)
            ToggleButtonTitle.Size = UDim2.new(0.7, 0, 1, 0)
            ToggleButtonTitle.TextXAlignment = Enum.TextXAlignment.Left
            
            local ToggleButtonSwitch = Instance.new('TextButton')
            ToggleButtonSwitch.Name = "ToggleButton"
            ToggleButtonSwitch.Parent = ToggleButton
            ToggleButtonSwitch.Text = ""
            ToggleButtonSwitch.TextColor3 = Color3.fromRGB(0, 0, 0)
            ToggleButtonSwitch.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            ToggleButtonSwitch.BorderColor3 = Color3.fromRGB(0, 0, 0)
            ToggleButtonSwitch.BorderSizePixel = 0
            ToggleButtonSwitch.Position = UDim2.new(0.85, 0, 0.1, 0)
            ToggleButtonSwitch.Size = UDim2.new(0, 50, 0, 24)
            ToggleButtonSwitch.AnchorPoint = Vector2.new(0.5, 0)
            
            local UICorner_ToggleSwitch = Instance.new('UICorner')
            UICorner_ToggleSwitch.Name = "UICorner"
            UICorner_ToggleSwitch.Parent = ToggleButtonSwitch
            
            local Dot = Instance.new('Frame')
            Dot.Name = "Dot"
            Dot.Parent = ToggleButtonSwitch
            Dot.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
            Dot.BorderColor3 = Color3.fromRGB(0, 0, 0)
            Dot.BorderSizePixel = 0
            Dot.Size = UDim2.new(0, 24, 0, 24)
            
            local UICorner_Dot = Instance.new('UICorner')
            UICorner_Dot.Name = "UICorner"
            UICorner_Dot.Parent = Dot
            
            -- Animation
            ToggleButton.BackgroundTransparency = 1
            ToggleButtonTitle.TextTransparency = 1
            ToggleButtonSwitch.BackgroundTransparency = 1
            Dot.BackgroundTransparency = 1
            
            CreateTween(ToggleButton, {BackgroundTransparency = 0.9}, 0.5):Play()
            CreateTween(ToggleButtonTitle, {TextTransparency = 0}, 0.5):Play()
            CreateTween(ToggleButtonSwitch, {BackgroundTransparency = 0}, 0.5):Play()
            CreateTween(Dot, {BackgroundTransparency = 0}, 0.5):Play()
            
            -- Toggle functionality
            local toggled = false
            
            ToggleButtonSwitch.MouseButton1Click:Connect(function()
                toggled = not toggled
                
                if toggled then
                    -- Move dot to right
                    local dotTween = CreateTween(Dot, {Position = UDim2.new(0.5, 0, 0, 0)}, 0.3)
                    dotTween:Play()
                    
                    -- Change colors
                    local colorTween = CreateTween(ToggleButtonSwitch, {BackgroundColor3 = Color3.fromRGB(0, 170, 255)}, 0.3)
                    colorTween:Play()
                else
                    -- Move dot to left
                    local dotTween = CreateTween(Dot, {Position = UDim2.new(0, 0, 0, 0)}, 0.3)
                    dotTween:Play()
                    
                    -- Reset colors
                    local colorTween = CreateTween(ToggleButtonSwitch, {BackgroundColor3 = Color3.fromRGB(255, 255, 255)}, 0.3)
                    colorTween:Play()
                end
                
                -- Call user callback
                toggleCallback(toggled)
            end)
            
            local ToggleObj = {
                Instance = ToggleButton,
                Value = false,
                SetValue = function(self, value)
                    toggled = value
                    if toggled then
                        Dot.Position = UDim2.new(0.5, 0, 0, 0)
                        ToggleButtonSwitch.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
                    else
                        Dot.Position = UDim2.new(0, 0, 0, 0)
                        ToggleButtonSwitch.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    end
                    toggleCallback(toggled)
                end
            }
            
            return ToggleObj
        end
        
        function TabObj:CreateButton(config)
            elementCounter = elementCounter + 1
            
            local buttonConfig = config or {}
            local buttonTitle = buttonConfig.Title or "Button"
            local buttonCallback = buttonConfig.Callback or function() end
            
            local Button = Instance.new('TextButton')
            Button.Name = "Button_" .. elementCounter
            Button.Parent = TabContent
            Button.Text = ""
            Button.TextColor3 = Color3.fromRGB(255, 255, 255)
            Button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Button.BackgroundTransparency = 0.9
            Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
            Button.BorderSizePixel = 0
            Button.Size = UDim2.new(0.95, 0, 0, 30)
            Button.LayoutOrder = elementCounter
            
            local UICorner_Button = Instance.new('UICorner')
            UICorner_Button.Name = "UICorner"
            UICorner_Button.Parent = Button
            
            local ButtonTitle = Instance.new('TextLabel')
            ButtonTitle.Name = "ButtonTitle"
            ButtonTitle.Parent = Button
            ButtonTitle.Text = buttonTitle
            ButtonTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
            ButtonTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            ButtonTitle.BackgroundTransparency = 1
            ButtonTitle.BorderColor3 = Color3.fromRGB(0, 0, 0)
            ButtonTitle.BorderSizePixel = 0
            ButtonTitle.Position = UDim2.new(0.02, 0, 0, 0)
            ButtonTitle.Size = UDim2.new(0.96, 0, 1, 0)
            ButtonTitle.TextXAlignment = Enum.TextXAlignment.Center
            
            -- Animation
            Button.BackgroundTransparency = 1
            ButtonTitle.TextTransparency = 1
            
            CreateTween(Button, {BackgroundTransparency = 0.9}, 0.5):Play()
            CreateTween(ButtonTitle, {TextTransparency = 0}, 0.5):Play()
            
            -- Button click animation and callback
            Button.MouseButton1Click:Connect(function()
                -- Animation: darken and then restore
                local clickTween = CreateTween(Button, {BackgroundTransparency = 0.7}, 0.15)
                clickTween:Play()
                
                buttonCallback()
                
                -- Restore original appearance
                wait(0.15)
                local restoreTween = CreateTween(Button, {BackgroundTransparency = 0.9}, 0.15)
                restoreTween:Play()
            end)
            
            -- Button hover effects
            Button.MouseEnter:Connect(function()
                local hoverTween = CreateTween(Button, {BackgroundTransparency = 0.8}, 0.2)
                hoverTween:Play()
            end)
            
            Button.MouseLeave:Connect(function()
                local leaveTween = CreateTween(Button, {BackgroundTransparency = 0.9}, 0.2)
                leaveTween:Play()
            end)
            
            return Button
        end
        
        function TabObj:CreateTextBox(config)
            elementCounter = elementCounter + 1
            
            local textBoxConfig = config or {}
            local textBoxTitle = textBoxConfig.Title or "Input Box"
            local textBoxCallback = textBoxConfig.Callback or function() end
            
            local Input_Box = Instance.new('Frame')
            Input_Box.Name = "InputBox_" .. elementCounter
            Input_Box.Parent = TabContent
            Input_Box.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Input_Box.BackgroundTransparency = 0.9
            Input_Box.BorderColor3 = Color3.fromRGB(0, 0, 0)
            Input_Box.BorderSizePixel = 0
            Input_Box.Size = UDim2.new(0.95, 0, 0, 30)
            Input_Box.LayoutOrder = elementCounter
            
            local UICorner_InputBox = Instance.new('UICorner')
            UICorner_InputBox.Name = "UICorner"
            UICorner_InputBox.Parent = Input_Box
            
            local InputTextTitle = Instance.new('TextLabel')
            InputTextTitle.Name = "InputTextTitle"
            InputTextTitle.Parent = Input_Box
            InputTextTitle.Text = textBoxTitle
            InputTextTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
            InputTextTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            InputTextTitle.BackgroundTransparency = 1
            InputTextTitle.BorderColor3 = Color3.fromRGB(0, 0, 0)
            InputTextTitle.BorderSizePixel = 0
            InputTextTitle.Position = UDim2.new(0.02, 0, 0, 0)
            InputTextTitle.Position = UDim2.new(0.02, 0, 0, 0)
InputTextTitle.Size = UDim2.new(0.4, 0, 1, 0)
InputTextTitle.TextXAlignment = Enum.TextXAlignment.Left

local InputBox = Instance.new('TextBox')
InputBox.Name = "TextBox"
InputBox.Parent = Input_Box
InputBox.Text = ""
InputBox.PlaceholderText = "Enter text..."
InputBox.TextColor3 = Color3.fromRGB(255, 255, 255)
InputBox.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
InputBox.BorderColor3 = Color3.fromRGB(0, 0, 0)
InputBox.BorderSizePixel = 0
InputBox.Position = UDim2.new(0.45, 0, 0.15, 0)
InputBox.Size = UDim2.new(0.53, 0, 0.7, 0)
InputBox.ClearTextOnFocus = false

local UICorner_TextBox = Instance.new('UICorner')
UICorner_TextBox.Name = "UICorner"
UICorner_TextBox.Parent = InputBox

-- Animation
Input_Box.BackgroundTransparency = 1
InputTextTitle.TextTransparency = 1
InputBox.BackgroundTransparency = 1
InputBox.TextTransparency = 1

CreateTween(Input_Box, {BackgroundTransparency = 0.9}, 0.5):Play()
CreateTween(InputTextTitle, {TextTransparency = 0}, 0.5):Play()
CreateTween(InputBox, {BackgroundTransparency = 0.2, TextTransparency = 0}, 0.5):Play()

-- TextBox functionality
InputBox.FocusLost:Connect(function(enterPressed)
    if enterPressed then
        textBoxCallback(InputBox.Text)
    end
end)

local TextBoxObj = {
    Instance = Input_Box,
    TextBox = InputBox,
    GetText = function(self)
        return InputBox.Text
    end,
    SetText = function(self, text)
        InputBox.Text = text
    end
}

return TextBoxObj
end

function TabObj:CreateSlider(config)
    elementCounter = elementCounter + 1
    
    local sliderConfig = config or {}
    local sliderTitle = sliderConfig.Title or "Slider"
    local minValue = sliderConfig.Min or 0
    local maxValue = sliderConfig.Max or 100
    local defaultValue = sliderConfig.Default or minValue
    local sliderCallback = sliderConfig.Callback or function() end
    
    -- Ensure default is within bounds
    defaultValue = math.clamp(defaultValue, minValue, maxValue)
    
    local SliderFrame = Instance.new('Frame')
    SliderFrame.Name = "Slider_" .. elementCounter
    SliderFrame.Parent = TabContent
    SliderFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    SliderFrame.BackgroundTransparency = 0.9
    SliderFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
    SliderFrame.BorderSizePixel = 0
    SliderFrame.Size = UDim2.new(0.95, 0, 0, 45)
    SliderFrame.LayoutOrder = elementCounter
    
    local UICorner_Slider = Instance.new('UICorner')
    UICorner_Slider.Name = "UICorner"
    UICorner_Slider.Parent = SliderFrame
    
    local SliderTitle = Instance.new('TextLabel')
    SliderTitle.Name = "SliderTitle"
    SliderTitle.Parent = SliderFrame
    SliderTitle.Text = sliderTitle
    SliderTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
    SliderTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    SliderTitle.BackgroundTransparency = 1
    SliderTitle.BorderColor3 = Color3.fromRGB(0, 0, 0)
    SliderTitle.BorderSizePixel = 0
    SliderTitle.Position = UDim2.new(0.02, 0, 0, 0)
    SliderTitle.Size = UDim2.new(0.96, 0, 0, 20)
    SliderTitle.TextXAlignment = Enum.TextXAlignment.Left
    
    local SliderBar = Instance.new('Frame')
    SliderBar.Name = "SliderBar"
    SliderBar.Parent = SliderFrame
    SliderBar.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    SliderBar.BorderColor3 = Color3.fromRGB(0, 0, 0)
    SliderBar.BorderSizePixel = 0
    SliderBar.Position = UDim2.new(0.05, 0, 0.6, 0)
    SliderBar.Size = UDim2.new(0.9, 0, 0, 5)
    
    local UICorner_SliderBar = Instance.new('UICorner')
    UICorner_SliderBar.Name = "UICorner"
    UICorner_SliderBar.Parent = SliderBar
    
    local SliderFill = Instance.new('Frame')
    SliderFill.Name = "SliderFill"
    SliderFill.Parent = SliderBar
    SliderFill.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
    SliderFill.BorderColor3 = Color3.fromRGB(0, 0, 0)
    SliderFill.BorderSizePixel = 0
    SliderFill.Size = UDim2.new(0, 0, 1, 0)
    
    local UICorner_SliderFill = Instance.new('UICorner')
    UICorner_SliderFill.Name = "UICorner"
    UICorner_SliderFill.Parent = SliderFill
    
    local SliderKnob = Instance.new('Frame')
    SliderKnob.Name = "SliderKnob"
    SliderKnob.Parent = SliderBar
    SliderKnob.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    SliderKnob.BorderColor3 = Color3.fromRGB(0, 0, 0)
    SliderKnob.BorderSizePixel = 0
    SliderKnob.Position = UDim2.new(0, -6, 0.5, -6)
    SliderKnob.Size = UDim2.new(0, 12, 0, 12)
    SliderKnob.AnchorPoint = Vector2.new(0, 0.5)
    
    local UICorner_SliderKnob = Instance.new('UICorner')
    UICorner_SliderKnob.Name = "UICorner"
    UICorner_SliderKnob.CornerRadius = UDim.new(1, 0)
    UICorner_SliderKnob.Parent = SliderKnob
    
    local ValueLabel = Instance.new('TextLabel')
    ValueLabel.Name = "ValueLabel"
    ValueLabel.Parent = SliderFrame
    ValueLabel.Text = tostring(defaultValue)
    ValueLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    ValueLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    ValueLabel.BackgroundTransparency = 1
    ValueLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
    ValueLabel.BorderSizePixel = 0
    ValueLabel.Position = UDim2.new(0.9, 0, 0, 0)
    ValueLabel.Size = UDim2.new(0.1, 0, 0, 20)
    ValueLabel.TextXAlignment = Enum.TextXAlignment.Right
    
    -- Animation
    SliderFrame.BackgroundTransparency = 1
    SliderTitle.TextTransparency = 1
    SliderBar.BackgroundTransparency = 1
    SliderFill.BackgroundTransparency = 1
    SliderKnob.BackgroundTransparency = 1
    ValueLabel.TextTransparency = 1
    
    CreateTween(SliderFrame, {BackgroundTransparency = 0.9}, 0.5):Play()
    CreateTween(SliderTitle, {TextTransparency = 0}, 0.5):Play()
    CreateTween(SliderBar, {BackgroundTransparency = 0}, 0.5):Play()
    CreateTween(SliderFill, {BackgroundTransparency = 0}, 0.5):Play()
    CreateTween(SliderKnob, {BackgroundTransparency = 0}, 0.5):Play()
    CreateTween(ValueLabel, {TextTransparency = 0}, 0.5):Play()
    
    -- Set default value
    local function updateSlider(value)
        local percent = (value - minValue) / (maxValue - minValue)
        percent = math.clamp(percent, 0, 1)
        
        -- Update fill and knob position
        SliderFill.Size = UDim2.new(percent, 0, 1, 0)
        SliderKnob.Position = UDim2.new(percent, -6, 0.5, -6)
        
        -- Update value label
        ValueLabel.Text = tostring(math.floor(value))
        
        -- Call callback
        sliderCallback(value)
    end
    
    -- Initialize with default value
    updateSlider(defaultValue)
    
    -- Slider interaction
    local isDragging = false
    
    SliderBar.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            isDragging = true
            
            -- Calculate value based on mouse position
            local mousePos = input.Position.X
            local sliderPos = SliderBar.AbsolutePosition.X
            local sliderWidth = SliderBar.AbsoluteSize.X
            local relativePos = mousePos - sliderPos
            local percent = math.clamp(relativePos / sliderWidth, 0, 1)
            local value = minValue + (maxValue - minValue) * percent
            
            updateSlider(value)
        end
    end)
    
    SliderKnob.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            isDragging = true
        end
    end)
    
    game:GetService("UserInputService").InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            isDragging = false
        end
    end)
    
    game:GetService("UserInputService").InputChanged:Connect(function(input)
        if isDragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            -- Calculate value based on mouse position
            local mousePos = input.Position.X
            local sliderPos = SliderBar.AbsolutePosition.X
            local sliderWidth = SliderBar.AbsoluteSize.X
            local relativePos = mousePos - sliderPos
            local percent = math.clamp(relativePos / sliderWidth, 0, 1)
            local value = minValue + (maxValue - minValue) * percent
            
            updateSlider(value)
        end
    end)
    
    local SliderObj = {
        Instance = SliderFrame,
        Value = defaultValue,
        SetValue = function(self, value)
            local clampedValue = math.clamp(value, minValue, maxValue)
            updateSlider(clampedValue)
            self.Value = clampedValue
        end,
        GetValue = function(self)
            return tonumber(ValueLabel.Text)
        end
    }
    
    return SliderObj
end

function TabObj:CreateDropdown(config)
    elementCounter = elementCounter + 1
    
    local dropdownConfig = config or {}
    local dropdownTitle = dropdownConfig.Title or "Dropdown"
    local dropdownOptions = dropdownConfig.Options or {"Option 1", "Option 2"}
    local defaultOption = dropdownConfig.Default or dropdownOptions[1]
    local dropdownCallback = dropdownConfig.Callback or function() end
    
    local DropdownFrame = Instance.new('Frame')
    DropdownFrame.Name = "Dropdown_" .. elementCounter
    DropdownFrame.Parent = TabContent
    DropdownFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    DropdownFrame.BackgroundTransparency = 0.9
    DropdownFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
    DropdownFrame.BorderSizePixel = 0
    DropdownFrame.Size = UDim2.new(0.95, 0, 0, 30)
    DropdownFrame.LayoutOrder = elementCounter
    DropdownFrame.ClipsDescendants = true -- Important for dropdown animation
    
    local UICorner_Dropdown = Instance.new('UICorner')
    UICorner_Dropdown.Name = "UICorner"
    UICorner_Dropdown.Parent = DropdownFrame
    
    local DropdownTitle = Instance.new('TextLabel')
    DropdownTitle.Name = "DropdownTitle"
    DropdownTitle.Parent = DropdownFrame
    DropdownTitle.Text = dropdownTitle
    DropdownTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
    DropdownTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    DropdownTitle.BackgroundTransparency = 1
    DropdownTitle.BorderColor3 = Color3.fromRGB(0, 0, 0)
    DropdownTitle.BorderSizePixel = 0
    DropdownTitle.Position = UDim2.new(0.02, 0, 0, 0)
    DropdownTitle.Size = UDim2.new(0.4, 0, 1, 0)
    DropdownTitle.TextXAlignment = Enum.TextXAlignment.Left
    
    local DropdownButton = Instance.new('TextButton')
    DropdownButton.Name = "DropdownButton"
    DropdownButton.Parent = DropdownFrame
    DropdownButton.Text = defaultOption
    DropdownButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    DropdownButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    DropdownButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
    DropdownButton.BorderSizePixel = 0
    DropdownButton.Position = UDim2.new(0.45, 0, 0.15, 0)
    DropdownButton.Size = UDim2.new(0.53, 0, 0.7, 0)
    
    local UICorner_Button = Instance.new('UICorner')
    UICorner_Button.Name = "UICorner"
    UICorner_Button.Parent = DropdownButton
    
    local DropdownArrow = Instance.new('TextLabel')
    DropdownArrow.Name = "DropdownArrow"
    DropdownArrow.Parent = DropdownButton
    DropdownArrow.Text = "▼"
    DropdownArrow.TextColor3 = Color3.fromRGB(255, 255, 255)
    DropdownArrow.BackgroundTransparency = 1
    DropdownArrow.Position = UDim2.new(0.92, 0, 0, 0)
    DropdownArrow.Size = UDim2.new(0, 20, 1, 0)
    
    local OptionsFrame = Instance.new('Frame')
    OptionsFrame.Name = "OptionsFrame"
    OptionsFrame.Parent = DropdownFrame
    OptionsFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    OptionsFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
    OptionsFrame.BorderSizePixel = 0
    OptionsFrame.Position = UDim2.new(0.45, 0, 0.85, 0)
    OptionsFrame.Size = UDim2.new(0.53, 0, 0, 0) -- Start with height 0
    OptionsFrame.Visible = false
    OptionsFrame.ZIndex = 2
    
    local UICorner_Options = Instance.new('UICorner')
    UICorner_Options.Name = "UICorner"
    UICorner_Options.Parent = OptionsFrame
    
    -- Animation
    DropdownFrame.BackgroundTransparency = 1
    DropdownTitle.TextTransparency = 1
    DropdownButton.BackgroundTransparency = 1
    DropdownButton.TextTransparency = 1
    DropdownArrow.TextTransparency = 1
    
    CreateTween(DropdownFrame, {BackgroundTransparency = 0.9}, 0.5):Play()
    CreateTween(DropdownTitle, {TextTransparency = 0}, 0.5):Play()
    CreateTween(DropdownButton, {BackgroundTransparency = 0.2, TextTransparency = 0}, 0.5):Play()
    CreateTween(DropdownArrow, {TextTransparency = 0}, 0.5):Play()
    
    -- Create option buttons
    local function createOptions()
        -- Clear existing options
        for _, child in pairs(OptionsFrame:GetChildren()) do
            if child:IsA("TextButton") then
                child:Destroy()
            end
        end
        
        -- Calculate height based on number of options
        local optionHeight = 25
        local totalHeight = #dropdownOptions * optionHeight
        
        -- Create option buttons
        for i, option in ipairs(dropdownOptions) do
            local OptionButton = Instance.new('TextButton')
            OptionButton.Name = "Option_" .. i
            OptionButton.Parent = OptionsFrame
            OptionButton.Text = option
            OptionButton.TextColor3 = Color3.fromRGB(255, 255, 255)
            OptionButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
            OptionButton.BackgroundTransparency = 0.2
            OptionButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
            OptionButton.BorderSizePixel = 0
            OptionButton.Position = UDim2.new(0, 0, 0, (i-1) * optionHeight)
            OptionButton.Size = UDim2.new(1, 0, 0, optionHeight)
            OptionButton.ZIndex = 3
            OptionButton.TextXAlignment = Enum.TextXAlignment.Center
            
            -- Option hover effect
            OptionButton.MouseEnter:Connect(function()
                CreateTween(OptionButton, {BackgroundTransparency = 0}, 0.2):Play()
            end)
            
            OptionButton.MouseLeave:Connect(function()
                CreateTween(OptionButton, {BackgroundTransparency = 0.2}, 0.2):Play()
            end)
            
            -- Option selection
            OptionButton.MouseButton1Click:Connect(function()
                DropdownButton.Text = option
                dropdownCallback(option)
                
                -- Close dropdown
                local closeTween = CreateTween(OptionsFrame, {Size = UDim2.new(0.53, 0, 0, 0)}, 0.3)
                closeTween:Play()
                
                closeTween.Completed:Connect(function()
                    OptionsFrame.Visible = false
                    DropdownFrame.Size = UDim2.new(0.95, 0, 0, 30) -- Reset container size
                    DropdownArrow.Text = "▼" -- Reset arrow
                end)
            end)
            
            -- Round corners of the first and last options
            if i == 1 or i == #dropdownOptions then
                local UICorner_Option = Instance.new('UICorner')
                UICorner_Option.Name = "UICorner"
                UICorner_Option.Parent = OptionButton
                
                -- Only round top corners for first option
                if i == 1 then
                    UICorner_Option.CornerRadius = UDim.new(0, 5)
                end
                
                -- Only round bottom corners for last option
                if i == #dropdownOptions then
                    UICorner_Option.CornerRadius = UDim.new(0, 5)
                end
            end
        end
        
        return totalHeight
    end
    
    -- Dropdown toggle
    local isOpen = false
    
    DropdownButton.MouseButton1Click:Connect(function()
        if isOpen then
            -- Close dropdown
            local closeTween = CreateTween(OptionsFrame, {Size = UDim2.new(0.53, 0, 0, 0)}, 0.3)
            closeTween:Play()
            
            CreateTween(DropdownFrame, {Size = UDim2.new(0.95, 0, 0, 30)}, 0.3):Play()
            DropdownArrow.Text = "▼"
            
            closeTween.Completed:Connect(function()
                OptionsFrame.Visible = false
            end)
        else
            -- Open dropdown
            local optionsHeight = createOptions()
            OptionsFrame.Visible = true
            
            local openTween = CreateTween(OptionsFrame, {Size = UDim2.new(0.53, 0, 0, optionsHeight)}, 0.3)
            openTween:Play()
            
            -- Expand container to fit dropdown
            local expandTween = CreateTween(DropdownFrame, {Size = UDim2.new(0.95, 0, 0, 30 + optionsHeight + 5)}, 0.3)
            expandTween:Play()
            
            DropdownArrow.Text = "▲"
        end
        
        isOpen = not isOpen
    end)
    
    local DropdownObj = {
        Instance = DropdownFrame,
        Value = defaultOption,
        SetOption = function(self, option)
            if table.find(dropdownOptions, option) then
                DropdownButton.Text = option
                self.Value = option
                dropdownCallback(option)
            end
        end,
        GetOption = function(self)
            return DropdownButton.Text
        end,
        SetOptions = function(self, newOptions)
            dropdownOptions = newOptions
            if not table.find(newOptions, DropdownButton.Text) and #newOptions > 0 then
                DropdownButton.Text = newOptions[1]
                self.Value = newOptions[1]
                dropdownCallback(newOptions[1])
            end
        end
    }
    
    return DropdownObj
end

return TabObj
end

return WindowObj
end

-- Notification System
function FinnnHub:CreateNotification(config)
    config = config or {}
    local title = config.Title or "Notification"
    local content = config.Content or ""
    local duration = config.Duration or 5
    
    -- Create notification GUI
    local NotificationGui = Instance.new('ScreenGui')
    NotificationGui.Name = "NotificationGui_" .. tostring(#ActiveNotifications + 1)
    NotificationGui.Parent = game.Players.LocalPlayer.PlayerGui
    
    local NotificationFrame = Instance.new('Frame')
    NotificationFrame.Name = "NotificationFrame"
    NotificationFrame.Parent = NotificationGui
    NotificationFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    NotificationFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
    NotificationFrame.BorderSizePixel = 0
    NotificationFrame.Position = UDim2.new(1, 10, 0.8, 0) -- Start off-screen
    NotificationFrame.Size = UDim2.new(0, 250, 0, 80)
    NotificationFrame.AnchorPoint = Vector2.new(0, 1)
    
    local UICorner = Instance.new('UICorner')
    UICorner.Parent = NotificationFrame
    
    local NotifTitle = Instance.new('TextLabel')
    NotifTitle.Name = "Title"
    NotifTitle.Parent = NotificationFrame
    NotifTitle.BackgroundTransparency = 1
    NotifTitle.Size = UDim2.new(1, -10, 0, 25)
    NotifTitle.Position = UDim2.new(0, 5, 0, 5)
    NotifTitle.Font = Enum.Font.SourceSansBold
    NotifTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
    NotifTitle.TextSize = 18
    NotifTitle.Text = title
    NotifTitle.TextXAlignment = Enum.TextXAlignment.Left
    
    local ContentText = Instance.new('TextLabel')
    ContentText.Name = "Content"
    ContentText.Parent = NotificationFrame
    ContentText.BackgroundTransparency = 1
    ContentText.Size = UDim2.new(1, -10, 1, -35)
    ContentText.Position = UDim2.new(0, 5, 0, 30)
    ContentText.Font = Enum.Font.SourceSans
    ContentText.TextColor3 = Color3.fromRGB(200, 200, 200)
    ContentText.TextSize = 16
    ContentText.Text = content
    ContentText.TextWrapped = true
    ContentText.TextXAlignment = Enum.TextXAlignment.Left
    ContentText.TextYAlignment = Enum.TextYAlignment.Top
    
    local CloseButton = Instance.new('TextButton')
    CloseButton.Name = "CloseButton"
    CloseButton.Parent = NotificationFrame
    CloseButton.BackgroundTransparency = 1
    CloseButton.Size = UDim2.new(0, 20, 0, 20)
    CloseButton.Position = UDim2.new(1, -25, 0, 5)
    CloseButton.Font = Enum.Font.SourceSansBold
    CloseButton.TextColor3 = Color3.fromRGB(255, 100, 100)
    CloseButton.TextSize = 18
    CloseButton.Text = "X"
    
    -- Position notification based on active notifications
    local position = #ActiveNotifications * (NotificationFrame.Size.Y.Offset + NotificationPadding)
    
    -- Add to active notifications
    table.insert(ActiveNotifications, NotificationGui)
    
    -- Show notification with animation
    local showTween = CreateTween(NotificationFrame, {
        Position = UDim2.new(0.99, -10, 0.95, -position)
    }, 0.5, Enum.EasingStyle.Back)
    
    showTween:Play()
    
    -- Close button functionality
    local function closeNotification()
        -- Remove from active notifications
        for i, notif in ipairs(ActiveNotifications) do
            if notif == NotificationGui then
                table.remove(ActiveNotifications, i)
                break
            end
        end
        
        -- Update positions of remaining notifications
        for i, notif in ipairs(ActiveNotifications) do
            local newPos = (i - 1) * (NotificationFrame.Size.Y.Offset + NotificationPadding)
            local repositionTween = CreateTween(notif.NotificationFrame, {
                Position = UDim2.new(0.99, -10, 0.95, -newPos)
            }, 0.3)
            repositionTween:Play()
        end
        
        -- Close animation
        local closeTween = CreateTween(NotificationFrame, {
            Position = UDim2.new(1.1, 0, NotificationFrame.Position.Y.Scale, NotificationFrame.Position.Y.Offset),
            BackgroundTransparency = 1
        }, 0.5)
        
        closeTween:Play()
        
        -- Wait for animation then destroy
        closeTween.Completed:Wait()
        NotificationGui:Destroy()
    end
    
    CloseButton.MouseButton1Click:Connect(closeNotification)
    
    -- Auto close after duration
    if duration and duration > 0 then
        spawn(function()
            wait(duration)
            if NotificationGui and NotificationGui.Parent then
                closeNotification()
            end
        end)
    end
    
    return NotificationGui
end

-- Return the library
return FinnnHub
