--[[
********************************
csv-list.lua
Storage script: export selected images as csv file
********************************
--]]
dt = require "darktable"
require "darktable.debug" 
dt.debug.debug = 0

print ("****** Lua - script load: csv-list.lua *****")

-- ** Register Lua preference: output_path **
dt.preferences.register("csv-list","Lua Storage output path","string","Where to place output files from Lua Storage","write an absolute path here","~/Images")

-- ** init variables **
SEPARATOR = ","
FILENAME="darktable-images.csv"
out_line = ""
first_line=true

-- ** Write header of the file **
output_file = dt.preferences.read("csv-list","Lua Storage output path","string").."/"..FILENAME
csvfile = io.open(output_file,"w")
if (csvfile ~= nil) then

    outline = "id,filename,path,duplicate_index,title,description,creator,publisher,rights,rating,red,blue,green,yellow,purple,width,height,exif_maker,exif_model,exif_lens,exif_aperture,exif_exposure,exif_focal_length,exif_iso,exif_datetime_taken,exif_focus_distance,iexif_crop\n"

    csvfile:write(outline)
    csvfile:close()
else
    dt.print_error("Error opening write file: "..output_file)
end


-- ** Store callback: called each time an images is exported **
function store_callback(storage,image,format,filename,num,total,high_quality,extra_data) 
    print("@@@@@@@@@@@@@@@@@STORE@@@@@@@@@@@@@")
    outline = ""
    
    outline = outline..tostring(image.id)..SEPARATOR
    outline = outline..tostring(image.filename)..SEPARATOR
    outline = outline..tostring(image.path)..SEPARATOR
    outline = outline..tostring(image.duplicate_index)..SEPARATOR
    
    outline = outline..tostring(image.title)..SEPARATOR
    outline = outline..tostring(image.description)..SEPARATOR
    outline = outline..tostring(image.creator)..SEPARATOR
    outline = outline..tostring(image.publisher)..SEPARATOR
    outline = outline..tostring(image.rights)..SEPARATOR
    
    outline = outline..tostring(image.rating)..SEPARATOR
    outline = outline..tostring(image.red)..SEPARATOR
    outline = outline..tostring(image.blue)..SEPARATOR
    outline = outline..tostring(image.green)..SEPARATOR
    outline = outline..tostring(image.yellow)..SEPARATOR
    outline = outline..tostring(image.purple)..SEPARATOR
    
    outline = outline..tostring(image.width)..SEPARATOR
    outline = outline..tostring(image.height)..SEPARATOR
    
    outline = outline..tostring(image.exif_maker)..SEPARATOR
    outline = outline..tostring(image.exif_model)..SEPARATOR
    outline = outline..tostring(image.exif_lens)..SEPARATOR
    outline = outline..tostring(image.exif_aperture)..SEPARATOR
    outline = outline..tostring(image.exif_exposure)..SEPARATOR
    outline = outline..tostring(image.exif_focal_length)..SEPARATOR
    outline = outline..tostring(image.exif_iso)..SEPARATOR
    outline = outline..tostring(image.exif_datetime_taken)..SEPARATOR
    outline = outline..tostring(image.exif_focus_distance)..SEPARATOR
    outline = outline..tostring(image.exif_crop)..SEPARATOR



    -- ** Write (append) to file **
    output_file = dt.preferences.read("csv-list","Lua Storage output path","string").."/"..FILENAME
    csvfile = io.open(output_file,"a+")
    if (csvfile ~= nil) then
        csvfile:write(outline.."\n")
        csvfile:close()
    else
    	dt.print_error("Error opening write file: "..output_file)

    end
    
    --[[
    for key,val in pairs (image) do
        print ("  >>"..tostring(val))
    end
    --]]

end


-- ** Finalize callback: called when all images are exported **
function store_finalize(storage,image_table)
    print("@@@@@@@@@@@@@@@@@FINALIZE@@@@@@@@@@@@@")
    
	dt.print("CSV file saved to "..dt.configuration.tmp_dir.."/file.csv")
end

-- ** Register the storage callbacks **
dt.register_storage("module_csv_list","Export images to CSV list",
    store_callback, store_finalize)
