# Apostate-of-Hate
# Mod Guides
## FIRST YOU NEED TO ADD TABLE FOR MOD
```lua
MOD_CONFIG = {
    NAME = "MOD_NAME",
    VERSION = "v1.0",
    DESCRIPTION = "test"
    PNG_EMBED = "LINK"
}
```



```lua
mod:acclerate()
```

# - refrence : 
Remove a object from mod :
```lua
mod:remove(object)
```
Add a object from mod function:
```lua
mod:AddObject(object)
```
Change mod text :
```lua
mod:Text(string,color,table)
```
Change Player Physic By:
```lua 
mod.Player.Physic:ChangeBy(var)
```
Lua To Python
```lua
mod.lua:ToPython(script)
```
Python To Lua 
```lua
mod.lua:ToLua(script)
```
On Read :
```lua
mod:multi()
```

```lua
mod:IsLoaded(function())
```
```lua
mod:IsRemoved(function())
```
```lua
mod:Connect(function())
```
```lua
mod:warn("text")
```
```lua 
mod:jsDecodeBy(string)
```
```lua
mod:preLoadedDone(function())
```
```lua
mod:waituntil(callback)
```
```lua 
mod.ui = statement
```
```lua 
mod:Refresh()
```
```lua 
mod:Reload()
```

```lua
mod:Rename(obj,text,mod)
```
