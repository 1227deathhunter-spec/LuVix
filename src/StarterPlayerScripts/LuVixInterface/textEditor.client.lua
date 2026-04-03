local player = game.Players.LocalPlayer
local GUI = player.PlayerGui.workArea
local main = GUI.MAIN
local UIS = game:GetService("UserInputService")

local editor = main.textEditor
local contents = ""
local lines = {}
local linesFrame = editor.Lines
local tempLine = linesFrame.tempLine

local function makeLine()
    local clone = tempLine:Clone()
    local x = #lines + 1
    clone.Name = "Line" .. x
    clone.Visible = true
    clone.contents = ""
    clone.lineNum.Text = x
    table.insert(lines, clone)
end

makeLine()

local function onEnterPressed(l)
    local index = table.find(lines, l)
    makeLine()
    local newLine = lines[#lines]
    
    local i = l.contents:match("^%s*") or ""
end