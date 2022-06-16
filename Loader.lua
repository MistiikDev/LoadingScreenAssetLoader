local background = script.Parent
local barBG = gui:WaitForChild("BarBackground")
local bar = barBG:WaitForChild("Bar")
local loadingText = barBG:WaitForChild("Status")
--// Replace those with your owns

local toLoad = workspace:GetChildren() 
local ContentProvider = game:GetService("ContentProvider") -- Service that allows to load parts
 
for i, v in pairs(toLoad) do
  
    local total = #toLoad
    local rapport = i/total
    local prcnt = math.floor(rapport * 100)
    
    bar:TweenSize(UDim2.new(rapport, 0, 1, 0), Enum.EasignDirection.Out, Enum.EasingStyle.Linear, .1, false) 
    
    ContentProvider:PreLoadAsync({v}, function() 
        loadingText.Text = "Currently loading asset : "..tostring(v.Name)..prcnt.."%"
    end))    
end
 
loadingText.Text = "Loaded!"
