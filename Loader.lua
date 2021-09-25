local background = script.Parent
local barBG = gui:WaitForChild("BarBackground")
local bar = barBG:WaitForChild("Bar")
local loadingText = barBG:WaitForChild("Status")
--// Replace those with your owns

local toLoad = workspace:GetChildren() 
local ContentProvider = game:GetService("ContentProvider") -- Service that allows to load parts
 
for i, v in pairs(toLoad) do
  
    local total = #toLoad
    local rapport = i/total -- Holding the division and keep tracking of the loop status
    local prcnt = math.floor(rapport * 100) -- Rounding up the number to avoid getting like "10.56%" and mulitpliyng by 100 to get 50 and not 0.05
    
    bar:TweenSize(UDim2.new(rapport, 0, 1, 0), Enum.EasignDirection.Out, Enum.EasingStyle.Linear, .1, false) 
    
    ContentProvider:PreLoadAsync({v}) -- Using "PreLoadAsync" function to actually load the current part. Putting v in brackets because the function takes a table
    
    loadingText.Text = prcnt.."%"
end
 
loadingText.Text = "Loaded!" -- Loop ended, letting player know everything is loaded
 
--// After that you can tween the GUI to go offscreen or just destroy it
