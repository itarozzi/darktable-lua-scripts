--[[
********************************
test-dummy.lua
test script to execute lua snippets inside darktable
********************************
--]]
darktable = require "darktable"
require "darktable.debug" 

print(dt.preferences.read("csv-list","Lua Storage output path","string"))


file = io.open("darktable-images.csv","w")
file:write("save your data here")
file:close()


