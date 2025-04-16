-- Finnn Hub UI Library

local FinnnHub = {}
local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

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
            
            for _, child in pairs(BackgroundIn:GetChildren()) do
                if child:IsA("Frame") or child:IsA("TextLabel") or child:IsA("TextButton") or child:IsA("TextBox") then
                    CreateTween(child, {BackgroundTransparency = child.BackgroundTransparency}, 0.5):Play()
                end
            end
            
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
            
            for _, child in pairs(BackgroundIn:GetChildren()) do
                if child:IsA("Frame") or child:IsA("TextLabel") or child:IsA("TextButton") or child:IsA("TextBox") then
                    CreateTween(child, {BackgroundTransparency = 1}, 0.3):Play()
                end
            end
            
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
        Tab.Parent = Tabs
        Tab.Text = tabName
        Tab.TextColor3 = Color3.fromRGB(255, 255, 255)
        Tab.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Tab.BackgroundTransparency = 0.85
        Tab.BorderColor3 = Color3.fromRGB(0, 0, 0)
        Tab.BorderSizePixel = 0
        Tab.Position = UDim2.new(0, 0, 0.089 * (tabCounter - 1), 0)
        Tab.Size = UDim2.new(0, 100, 0, 22)
        
        local UICorner_Tab = Instance.new('UICorner')
        UICorner_Tab.Name = "UICorner"
        UICorner_Tab.Parent = Tab
        
        -- Create content container for this tab
        local TabContent = Instance.new('Frame')
        TabContent.Name = "TabContent_" .. tabCounter
        TabContent.Parent = BackgroundIn
        TabContent.BackgroundTransparency = 1
        TabContent.Size = UDim2.new(1, 0, 1, 0)
        TabContent.Visible = false
        
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
            for _, child in pairs(Tabs:GetChildren()) do
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
        
        function TabObj:CreateText(text)
            local TextLabel = Instance.new('TextLabel')
            TextLabel.Name = "ExampleText"
            TextLabel.Parent = TabContent
            TextLabel.TextScaled = true
            TextLabel.Text = text
            TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
            TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            TextLabel.BackgroundTransparency = 0.9
            TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
            TextLabel.BorderSizePixel = 0
            TextLabel.Position = UDim2.new(0, 0, 0.03 * (#TabContent:GetChildren() + 1), 0)
            TextLabel.Size = UDim2.new(0, 380, 0, 22)
            
            -- Animation
            TextLabel.BackgroundTransparency = 1
            TextLabel.TextTransparency = 1
            CreateTween(TextLabel, {BackgroundTransparency = 0.9, TextTransparency = 0}, 0.5):Play()
            
            return TextLabel
        end
        
        function TabObj:CreateToggle(config)
            local toggleConfig = config or {}
            local toggleTitle = toggleConfig.Title or "Toggle Button"
            local toggleCallback = toggleConfig.Callback or function() end
            
            local ToggleButton = Instance.new('Frame')
            ToggleButton.Name = "ToggleButton"
            ToggleButton.Parent = TabContent
            ToggleButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            ToggleButton.BackgroundTransparency = 0.9
            ToggleButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
            ToggleButton.BorderSizePixel = 0
            ToggleButton.Position = UDim2.new(0, 0, 0.125 * (#TabContent:GetChildren() + 1), 0)
            ToggleButton.Size = UDim2.new(0, 380, 0, 30)
            
            local ToggleButtonTitle = Instance.new('TextLabel')
            ToggleButtonTitle.Name = "ToggleButtonTitle"
            ToggleButtonTitle.Parent = ToggleButton
            ToggleButtonTitle.Text = toggleTitle
            ToggleButtonTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
            ToggleButtonTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            ToggleButtonTitle.BackgroundTransparency = 1
            ToggleButtonTitle.BorderColor3 = Color3.fromRGB(0, 0, 0)
            ToggleButtonTitle.BorderSizePixel = 0
            ToggleButtonTitle.Position = UDim2.new(0.018421052023768425, 0, 0, 0)
            ToggleButtonTitle.Size = UDim2.new(0, 193, 0, 30)
            
            local ToggleButtonSwitch = Instance.new('TextButton')
            ToggleButtonSwitch.Name = "ToggleButton"
            ToggleButtonSwitch.Parent = ToggleButton
            ToggleButtonSwitch.Text = ""
            ToggleButtonSwitch.TextColor3 = Color3.fromRGB(0, 0, 0)
            ToggleButtonSwitch.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            ToggleButtonSwitch.BorderColor3 = Color3.fromRGB(0, 0, 0)
            ToggleButtonSwitch.BorderSizePixel = 0
            ToggleButtonSwitch.Position = UDim2.new(0.813, 0, 0.067, 0)
            ToggleButtonSwitch.Size = UDim2.new(0, 50, 0, 25)
            
            local UICorner_Toggle = Instance.new('UICorner')
            UICorner_Toggle.Name = "UICorner"
            UICorner_Toggle.Parent = ToggleButtonSwitch
            
            local Dot = Instance.new('Frame')
            Dot.Name = "Dot"
            Dot.Parent = ToggleButtonSwitch
            Dot.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
            Dot.BorderColor3 = Color3.fromRGB(0, 0, 0)
            Dot.BorderSizePixel = 0
            Dot.Size = UDim2.new(0, 25, 0, 25)
            
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
            local buttonConfig = config or {}
            local buttonTitle = buttonConfig.Title or "Button"
            local buttonCallback = buttonConfig.Callback or function() end
            
            local Button = Instance.new('TextButton')
            Button.Name = "TextButton"
            Button.Parent = TabContent
            Button.Text = ""
            Button.TextColor3 = Color3.fromRGB(255, 255, 255)
            Button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Button.BackgroundTransparency = 0.9
            Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
            Button.BorderSizePixel = 0
            Button.Position = UDim2.new(0, 0, 0.125 * (#TabContent:GetChildren() + 1), 0)
            Button.Size = UDim2.new(0, 380, 0, 30)
            
            local ButtonTitle = Instance.new('TextLabel')
            ButtonTitle.Name = "ButtonTitle"
            ButtonTitle.Parent = Button
            ButtonTitle.Text = buttonTitle
            ButtonTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
            ButtonTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            ButtonTitle.BackgroundTransparency = 1
            ButtonTitle.BorderColor3 = Color3.fromRGB(0, 0, 0)
            ButtonTitle.BorderSizePixel = 0
            ButtonTitle.Position = UDim2.new(0.018421052023768425, 0, 0, 0)
            ButtonTitle.Size = UDim2.new(0, 193, 0, 30)
            
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
            local textBoxConfig = config or {}
            local textBoxTitle = textBoxConfig.Title or "Input Box"
            local textBoxCallback = textBoxConfig.Callback or function() end
            
            local Input_Box = Instance.new('Frame')
            Input_Box.Name = "Input Box"
            Input_Box.Parent = TabContent
            Input_Box.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Input_Box.BackgroundTransparency = 0.9
            Input_Box.BorderColor3 = Color3.fromRGB(0, 0, 0)
            Input_Box.BorderSizePixel = 0
            Input_Box.Position = UDim2.new(0, 0, 0.125 * (#TabContent:GetChildren() + 1), 0)
            Input_Box.Size = UDim2.new(0, 380, 0, 30)
            
            local InputTextTitle = Instance.new('TextLabel')
            InputTextTitle.Name = "InputTextTitle"
            InputTextTitle.Parent = Input_Box
            InputTextTitle.Text = textBoxTitle
            InputTextTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
            InputTextTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            InputTextTitle.BackgroundTransparency = 1
            InputTextTitle.BorderColor3 = Color3.fromRGB(0, 0, 0)
            InputTextTitle.BorderSizePixel = 0
            InputTextTitle.Position = UDim2.new(0.018421052023768425, 0, -0.03333333507180214, 0)
            InputTextTitle.Size = UDim2.new(0, 193, 0, 30)
            
            local TextBox = Instance.new('TextBox')
            TextBox.Name = "TextBox"
            TextBox.Parent = Input_Box
            TextBox.Text = ""
            TextBox.PlaceholderText = "Enter text here..."
            TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
            TextBox.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
            TextBox.BackgroundTransparency = 0.5
            TextBox.BorderColor3 = Color3.fromRGB(0, 0, 0)
            TextBox.BorderSizePixel = 0
            TextBox.Position = UDim2.new(0.237, 0, 0, 0)
            TextBox.Size = UDim2.new(0, 277, 0, 29)
            
            local UICorner_TextBox = Instance.new('UICorner')
            UICorner_TextBox.Name = "UICorner"
            UICorner_TextBox.Parent = TextBox
            
            -- Animation
            Input_Box.BackgroundTransparency = 1
            InputTextTitle.TextTransparency = 1
            TextBox.BackgroundTransparency = 1
            TextBox.TextTransparency = 1
            
            CreateTween(Input_Box, {BackgroundTransparency = 0.9}, 0.5):Play()
            CreateTween(InputTextTitle, {TextTransparency = 0}, 0.5):Play()
            CreateTween(TextBox, {BackgroundTransparency = 0.5, TextTransparency = 0}, 0.5):Play()
            
            -- TextBox focus animations and callback
            TextBox.Focused:Connect(function()
                local focusTween = CreateTween(TextBox, {BackgroundColor3 = Color3.fromRGB(60, 60, 60)}, 0.2)
                focusTween:Play()
            end)
            
            TextBox.FocusLost:Connect(function(enterPressed)
                local unfocusTween = CreateTween(TextBox, {BackgroundColor3 = Color3.fromRGB(40, 40, 40)}, 0.2)
                unfocusTween:Play()
                
                if enterPressed then
                    textBoxCallback(TextBox.Text)
                end
            end)
            
            return TextBox
        end
        
        return TabObj
    end
    
    return WindowObj
end

-- Notification System
function FinnnHub:Notify(config)
    config = config or {}
    local notifyTitle = config.Title or "Notify"
    local notifyContent = config.Content or "Content"
    local notifyDuration = config.Duration or 3
    
    -- Create Notification UI
    local Notify = Instance.new('ScreenGui')
    Notify.Name = "Notify"
    Notify.Parent = game.Players.LocalPlayer.PlayerGui
    
    local Notify_1 = Instance.new('Frame')
    Notify_1.Name = "Notify"
    Notify_1.Parent = Notify
    Notify_1.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    Notify_1.BackgroundTransparency = 0.2
    Notify_1.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Notify_1.BorderSizePixel = 0
    Notify_1.Position = UDim2.new(1.1, 0, 0.859, 0)  -- Start offscreen
    Notify_1.Size = UDim2.new(0, 300, 0, 100)
    
    local UICorner = Instance.new('UICorner')
    UICorner.Name = "UICorner"
    UICorner.Parent = Notify_1
    
    local TitleNotify = Instance.new('TextLabel')
    TitleNotify.Name = "TitleNotify"
    TitleNotify.Parent = Notify_1
    TitleNotify.Text = notifyTitle
    TitleNotify.TextColor3 = Color3.fromRGB(255, 255, 255)
    TitleNotify.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TitleNotify.BackgroundTransparency = 1
    TitleNotify.BorderColor3 = Color3.fromRGB(0, 0, 0)
    TitleNotify.BorderSizePixel = 0
    TitleNotify.Position = UDim2.new(0.014, 0, 0, 0)
    TitleNotify.Size = UDim2.new(0, 295, 0, 28)
    TitleNotify.Font = Enum.Font.SourceSansBold
    TitleNotify.TextSize = 20
    
    local ContentNotify = Instance.new('TextLabel')
    ContentNotify.Name = "ContentNotify"
    ContentNotify.Parent = Notify
    ContentNotify.Text = notifyContent
    ContentNotify.TextColor3 = Color3.fromRGB(255, 255, 255)
    ContentNotify.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    ContentNotify.BackgroundTransparency = 1
    ContentNotify.BorderColor3 = Color3.fromRGB(0, 0, 0)
    ContentNotify.BorderSizePixel = 0
    ContentNotify.Position = UDim2.new(0.014, 0, 0.28, 0)
    ContentNotify.Size = UDim2.new(0, 295, 0, 61)
    ContentNotify.Font = Enum.Font.SourceSans
    ContentNotify.TextSize = 16
    ContentNotify.TextWrapped = true
    
    -- Animation for notification
    -- Slide in animation
    local slideInTween = CreateTween(Notify_1, {
        Position = UDim2.new(0.834, 0, 0.859, 0)
    }, 0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out)
    
    -- Slide out animation
    local slideOutTween = CreateTween(Notify_1, {
        Position = UDim2.new(1.1, 0, 0.859, 0)
    }, 0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.In)
    
    -- Fade in animation
    TitleNotify.TextTransparency = 1
    ContentNotify.TextTransparency = 1
    
    local fadeInTitle = CreateTween(TitleNotify, {TextTransparency = 0}, 0.5)
    local fadeInContent = CreateTween(ContentNotify, {TextTransparency = 0}, 0.5)
    
    -- Play animations
    slideInTween:Play()
    wait(0.2)
    fadeInTitle:Play()
    fadeInContent:Play()
    
    -- Wait for duration and then remove
    task.spawn(function()
        wait(notifyDuration)
        
        -- Fade out text first
        local fadeOutTitle = CreateTween(TitleNotify, {TextTransparency = 1}, 0.3)
        local fadeOutContent = CreateTween(ContentNotify, {TextTransparency = 1}, 0.3)
        
        fadeOutTitle:Play()
        fadeOutContent:Play()
        wait(0.3)
        
        -- Then slide out
        slideOutTween:Play()
        slideOutTween.Completed:Wait()
        
        -- Destroy the notification
        Notify:Destroy()
    end)
    
    return Notify_1
end

return FinnnHub
