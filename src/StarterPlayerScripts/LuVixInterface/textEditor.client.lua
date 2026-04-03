local player = game.Players.LocalPlayer
local GUI = player.PlayerGui:WaitForChild("workArea")
local main = GUI.MAIN
local UIS = game:GetService("UserInputService")

local editor = main.textEditor
local contents = ""
local lines = {}
local linesFrame = editor.Lines
local tempLine = editor.tempLine

local function makeLine(t)
    local clone = tempLine:Clone()
    local x = #lines + 1
    clone.Name = "Line" .. x
    clone.Visible = true
    clone.contents.Text = ""
    clone.contents.PlaceholderText = t or ""
    clone.lineNum.Text = x
    clone.Parent = linesFrame
    table.insert(lines, clone)
end

makeLine("Feel free to start typing!!!!!!")

local function onEnterPressed(l)
    local index = table.find(lines, l)
    makeLine() 
    
    local newLine = lines[#lines]
    local indent = l.contents.Text:match("^%s*") or ""

    newLine.contents.Text = indent


    newLine.contents:CaptureFocus()

    newLine.contents.CursorPosition = #indent + 1
end


local function setupLine(l)
    local tb = l.contents

    tb.Focused:Connect(function()
        local con
        con = UIS.InputBegan:Connect(function(x, gp)
            if gp then return end

            if x.KeyCode == Enum.KeyCode.Return then
                onEnterPressed(l)
            end
        end)
        tb.FocusLost:Connect(function()
            con:Disconnect()
        end)
    end)
end

for _, line in ipairs(lines) do
    setupLine(line)
end
setupLine(lines[1])

