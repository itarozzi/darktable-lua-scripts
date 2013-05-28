--[[
********************************
test1.lua
test script to play with main Lua objects inside darktable
********************************
--]]
darktable = require "darktable"
require "darktable.debug" 

print("****** this is the darktable object content *******")
for   key,val in pairs(darktable) do 
        print(key .. " - " .. tostring(val))


end



print("hello world")

-- *** Get and print (images) database content *** 

dt_database = darktable.database
print("This library contains ".. tostring(#dt_database)  .." images")
darktable.print("This library contains ".. tostring(#dt_database)  .." images")

for   key,val in pairs(dt_database) do 

  if tonumber(key) ~= nil then

    
    -- print the full content of darktable_db element
    for   key2,val2 in pairs(val) do 
        print(key2 .. " - " .. tostring(val2))
    end
    

    --[[
    -- print a subset of image fields
    print(key .. " - " .. val.path)
    print(val.rating) 
    print(val.exif_lens .. " - f" .. val.exif_aperture .. " - t" .. val.exif_exposure) 
    print(val.filename)
    print(val.width .. " x " .. val.height)
    --]]

  else
    print(key )
  end
  print("-----------------------------------")


end
print("DONE!")
  
-- *** Play with preferences LUA tab  (!!! doesn't work !!!) *** 
 
-- register a new preference in LUA tab
--dartktable.preferences.register("test1","preference1",bool,"label of preference 1","this is only for test purpose",true)


-- *** Play with darktable configuration *** 

-- Get and print darktable configuration
dt_pref = darktable.configuration
for   key,val in pairs(dt_pref) do 
     print(key .. " - " .. tostring(val))
   
end

-- *** Play with darktable tags *** 

-- Get and print darktable tags list
-- use ipai iterator to print tag only
-- use pair iterator to print functions too

print("------ list all tags ------")

dt_tags = darktable.tags
--for   key,val in ipairs(dt_tags) do 
for   key,val in pairs(dt_tags) do 
     print(key .. " - " .. tostring(val))
   
end

-- create some tags
dt_tags.create("firs level tag")
dt_tags.create("firs level tag|second level tag")
dt_tags.create("firs level tag|second level tag2")

-- get  all tags attached to an image
print("------ tags of image ------")
img_tags = dt_tags.get_tags(dt_database[164])
for   key,val in pairs(img_tags) do 
     print(key .. " - " .. tostring(val))
end




-- *** Play with darktable shorcut callbacks *** 

function my_callback(event_name,shortcut)

    print ("lua shortcut pressed!!!")
    print ("Event name = "..event_name)
    print ("shortcut = "..shortcut)
end

event = darktable.register_event("shortcut",my_callback,"lua shortcut1")





darktable.preferences.write("script","name","string","value1")
print (darktable.preferences.read("script","name","string"))

darktable.preferences.register("script","Test Option1","string","just to test if it works","here the tooltip","default value here")



print ("------------------>debug")
darktable.debug.debug = 1
print(darktable.debug.dump(darktable.preferences.register, "DBG:"))

print ("====================")
