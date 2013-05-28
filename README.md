darktable-lua-scripts
=====================

Unofficial collection of Lua scripts for darktable.

Description
-----------
Since few weeks ago, [darktable](https://github.com/darktable-org) master branch supports Lua scripting.

You can find informations and documentations in the darktable project pages:
- http://www.darktable.org/redmine/projects/darktable/wiki/LuaUsage
- http://www.darktable.org/redmine/projects/darktable/wiki/LuaAPI

This repository contains some script that I use to study, test and debug Lua scripting in darktable.


Thanks to Boucman for the great work on integrating Lua in darktable!


Quick Start
-----------
1. Clone this repository to your directory
2. Copy the script you want to use/test into ~/.config/darktable/lua/ directory
3. Import the script editing the /.config/darktable/rc.lua file

    require "the_script_name"


Whishlist and ToDo list
-----------------------
- [ ] Script: quick tag assignement
- [ ] Script: auto-import new images 

- [ ] ToDo: how to use dialog with Lua?


Notes
-----
I'm not a Lua programmer, my know-how on Lua scripting is really limited, so please don't use these script in a production system without verify them.
Main purpose of this collection is to learn and test, so you are advised :)

