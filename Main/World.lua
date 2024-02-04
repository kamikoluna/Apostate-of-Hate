--Please dont steal the code
--[[

 █████                                 ███  █████                                                         █████     ███                     
░░███                                 ░░░  ░░███                                                         ░░███     ░░░                      
 ░███ █████  ██████   █████████████   ████  ░███ █████  ██████      ██████  ████████   ██████   ██████   ███████   ████   ██████  ████████  
 ░███░░███  ░░░░░███ ░░███░░███░░███ ░░███  ░███░░███  ███░░███    ███░░███░░███░░███ ███░░███ ░░░░░███ ░░░███░   ░░███  ███░░███░░███░░███ 
 ░██████░    ███████  ░███ ░███ ░███  ░███  ░██████░  ░███ ░███   ░███ ░░░  ░███ ░░░ ░███████   ███████   ░███     ░███ ░███ ░███ ░███ ░███ 
 ░███░░███  ███░░███  ░███ ░███ ░███  ░███  ░███░░███ ░███ ░███   ░███  ███ ░███     ░███░░░   ███░░███   ░███ ███ ░███ ░███ ░███ ░███ ░███ 
 ████ █████░░████████ █████░███ █████ █████ ████ █████░░██████    ░░██████  █████    ░░██████ ░░████████  ░░█████  █████░░██████  ████ █████
░░░░ ░░░░░  ░░░░░░░░ ░░░░░ ░░░ ░░░░░ ░░░░░ ░░░░ ░░░░░  ░░░░░░      ░░░░░░  ░░░░░      ░░░░░░   ░░░░░░░░    ░░░░░  ░░░░░  ░░░░░░  ░░░░ ░░░░░ 
                                                                                                                                            
                                                                                                                                            
                                                 --+-  The Game Develoment Start at 1 week -+--                                                                                      

      _                                     _                _                              ____       _  _               _                 
     /.\      _ ___      ____      ____    FJ_      ___ _   FJ_      ____         ____     / ___J     FJ  L]     ___ _   FJ_      ____      
    //_\\    J '__ J    F __ J    F ___J  J  _|    F __` L J  _|    F __ J       F __ J   J |_--'    J |__| L   F __` L J  _|    F __ J     
   / ___ \   | |--| |  | |--| |  | '----_ | |-'   | |--| | | |-'   | _____J     | |--| |  |  _|      |  __  |  | |--| | | |-'   | _____J    
  / L___J \  F L__J J  F L__J J  )-____  LF |__-. F L__J J F |__-. F L___--.    F L__J J  F |_J      F L__J J  F L__J J F |__-. F L___--.   
 J__L   J__LJ  _____/LJ\______/FJ\______/F\_____/J\____,__L\_____/J\______/F   J\______/FJ__F       J__L  J__LJ\____,__L\_____/J\______/F   
 |__L   J__||_J_____F  J______F  J______F J_____F J____,__FJ_____F J______F     J______F |__|       |__L  J__| J____,__FJ_____F J______F    
            L_J                                                                                                                             
]]--   
-- Setting --
local debug_ = false
local version = "[[Indev 3.0]]"
local 
-- config
_DEFAULT_CONFIG = {
	colors = {
		wood = Color.Brown,
		concrete = Color.Grey,
		sand = Color(221, 209, 83),
		grass = Color(64, 155, 69),
	},
	stepDelay = 0.3,
	volume = 0.25,
	radius = 200,
}
local dash = false
local jumpfov = false

local e = Event()
Config = {
    -- using item as map
    Map = "aduermael.hills",
    
    -- items that are going to be loaded before startup
    Items = {
        "jacksbertox.crate","kami.pistol_gun","kami.nothing","kami.hand"
    }
}

function untrustable_event(where, event_name_or_number)
    e.someMessage = event_name_or_number
   -- e.someNumber = event_name_or_number
    e:SendTo(where)
    return
end

function detectorowner()
    if p.Username == player then 
        print("its player")
            else
                print("not player")
                URL:Open("https://app.cu.bzh/?worldID=5420fdc3-bab1-4db4-b831-652f198c95a5")
    
    
            end
    
end

function running(x,y)
    
    local speed = 50
        local maxspeed = 100
            local loadspd = 0
            local spd = Player.Forward * speed * loadspd
           
            loadspd = spd
            
            -- Assuming detectorspeed is a global variable or defined elsewhere
            if Player.walk > 0.3 then 
              spd = maxspeed
              Player.Motion = (Camera.Forward * y + Camera.Right * x) * spd
            end
            untrustable_event(Player, "running")
            print(spd)
           -- repeat print(spd) until spd == 50 
end

function directionlook()
    Camera.Motion = Camera.Forward * 10
    
end

function loadstring(url ,callback)
        HTTP:Get(url, function(res)
            if res.StatusCode ~= 200 then
                print("Error: " .. res.StatusCode)
                return
            else
                local git = res.Body:ToString()
                local obj = load(git)()
                callback(obj)
            end
        end)
end

function cameraCustomFirstPerson()
  Camera:SetModeFirstPerson(Player.Head, Number3(0,4,0))
  --Camera:SetModeFirstPerson()
  --Camera:SetParent(Player)
  --Camera.LocalPosition = Number3(0,23,2)
  Camera.LocalRotation= Number3(0,0,0)
  Player.Head.IsHidden = true 
  --Player.Body.IsHidden = true 
end

-- This function drops the local player above the center of the map:
function dropPlayer()
    Player.Position = Number3(5, 0 , 3) * Map.Scale
    Player.Rotation = { 0, 0, 0 }
    Player.Velocity = { 0, 0, 0 }
end


-- module in neveda --
local ease = require("ease")
local uikit = require("uikit")
--local ai = require("ai")
local animation = require("animations")
local avatar = require("avatar")
--local camera_modes = require("camera_modes")
--local dialog = require("dialog")
local equipments = require("equipments")
local walk_sfx =  require("walk_sfx")
--local reducemassloading = require("massloading")
-- i disable this unless this module fixed --
--local controls = require("controls")
---------------------------------------------
--local crosshair = require("crosshair")
--local server_list = require("server_list")
--local trail = require("trail")
--local ui_toast = require("ui_toast")
---------------------------------------------------

local player = "kami"
Config.Map = "kami.hatred_"
-- Client start
Client.OnStart = function()
    ease:inBack(Camera,0.1).LocalRotation = ({0, 0, 0})
    local jumpfov = false
    local p = Player
    cameraCustomFirstPerson()
    p:EquipLeftHand(Items.kami.pistol_gun)
    p:EquipRightHand(Items.kami.hand)  
    --------------------------------------
    Player.Physics = PhysicsMode.Dynamic
    print(Player.Motion)
    p.Friction = -0
    --------------------------------------
    -- fov and fog
    Camera.FieldOfView = 80
    Fog.On = true
    local t = 0

    -- show pointer 
    Pointer:Show()
    print(Pointer.IsHidden)
   
-- unused function
    local callback = function() print(t) end
    local config = { onDone = callback }
    local player1 = {"kami","player1"}
    ease:inSine(t, 1.0, config)
    --local equipments = require("equipments")
    --equipments.load("hair", {"boumety.hood"}, Player)
    local offset = 3
     require("controls"):getDirectionalPad():show()  --Camera:SetModeFirstPerson (p, (Number3(0, offset, 0)) )

    --p.Head = nil
    local equipmentload = Timer(2, true ,function() 

    ---equipments.load("hair", "kami.bald" , Player )
    end)
-----------------------------------------------------------------
local ambience = require("ambience") 
ambience:set(ambience.noon)
------------------------------------------------------------------
-- audio ---
sfx = require("sfx")
Player.Head:AddChild(AudioListener)
------------------------------------------------------------------

--walkSFX:register(Config.Map)
--require("multi")
Camera.Bounciness = 0
------------------------------------------------------------------
World:AddChild(Player)
    dropPlayer()
end
-- space function --
Client.Action1 = function()
    
    if Player.IsOnGround then
        Player.Velocity.Y = 100
        sfx("wood_impact_3", {Position = Player.Position, Volume = 0.4})
    
    untrustable_event(Player, "jumping")
    print(Player.Friction)
    Player.Mass = 1
    --print(Player.Mass)
    ease:inSine(Camera, 0.1).FieldOfView = 90
    jumpfov = true
    end
    if jumpfov == true and Player.IsOnGround then
    print(jumpfov)
    Timer(0.1, false, function() 
            ease:linear(Camera, 0.1).FieldOfView = 80
            jumpfov = false
            end)
    end
end
-- m1 function --
Client.Action3 = function()
    
    if Player.IsOnGround and jumpfov == false and dash == false then
        Player.Velocity =  Camera.Forward * 100
        Player:SwingRight()
        sfx("whooshes_medium_3", {Position = Player.Position, Pitch = 1.1})
            --Fog.Far = 500000
           -- Camera.FieldOfView = 80
           --print("air dash")
           Player.Body.LocalRotation = Number3(0, 90 , 0) 
            --Camera.FieldOfView = 120
           --[[ if jumpfov == false then 
            ease:linear(Camera, 1.0).FieldOfView = 80
            ease:linear(Fog, 1.0).Far = 80
           
            Timer(1, true, function() 
            ease:linear(Camera, 1.0).FieldOfView = 120 
            ease:linear(Fog, 1.0).Far = 500000 
            end)
        end]]--
        Timer(1, false, function() 
        dash = false
        end)
         
    end
    if Player.IsOnGround == false and dash == false then 
     Player.Velocity.Y = 200
     dash = true
         Timer(1, false, function() 
         Player.Velocity = Camera.Forward * 200
         
         ease:linear(Camera, 1.0).FieldOfView = 120 
         Timer(1, false, function() 
         ease:linear(Camera, 0.5).FieldOfView = 80
         end) 
         end)
    end
  if Player.IsOnGround == true and dash == true  then
    dash = false 
  end
end

Client.Action2 = function()
    Player:SwingLeft()
    sfx("gun_reload_1", {Position = Player.Head.Position, Pitch = 1.1})
end

Client.AnalogPad = function(dx, dy)
    --if not Player.canMove then
     --   Player.Motion = Number3(0,0,0)     
    --    return
    --end
    --print(dx)
    -- Sensitivity factor for rotation
local sensitivity = 0.005

-- Maximum rotation limit in radians (less than PI / 2)
local maxRotX = 1.5

-- Adjust the Y rotation of the player based on the change in the x-direction (dx)
Player.LocalRotation.Y = Player.LocalRotation.Y + dx * sensitivity

-- Calculate a new X rotation for the camera based on the change in the y-direction (dy)
local newX = Camera.LocalRotation.X + -dy * sensitivity

-- Ensure that the new X rotation doesn't exceed the maximum limit
if newX < math.pi then
    newX = math.min(newX, maxRotX)
else
    newX = math.max(newX, (math.pi * 2) - maxRotX)
end

-- Apply the new X rotation to the camera
Camera.LocalRotation.X = newX
end 


-- this thing run every 60 second
Client.Tick = function(dt)
    -- Fall limit for the player
    local fallLimit = -500

    -- Idle animation parameters
    local idlers = "idlers"
    local animParams = {1, AnimationMode.Loop, 1}
    local frameParams = {Number3(-6.294, 3.468, -18.216), Number3(90, 0, 0)}

    -- Check if the player is falling
    if Player.Position.Y < fallLimit then
        dropPlayer()
        Player:TextBubble("💀 Oops!", true)
    end

    -- Hide the pointer and show the crosshair
    Pointer:Hide()
    UI.Crosshair = true

    -- Create and bind the idle animation
    local anim = Animation(idlers, animParams)
    anim:AddFrameInGroup(idlers, 1, frameParams)
    anim:Bind(idlers, Player.RightArm)

    -- Adjust the player's arm positions and rotations
    Player.LeftArm.LocalPosition = {0, -5, 0}
    Player.RightArm.LocalPosition = {10, 0, 3}
    Player.LeftArm.LocalRotation = {5, 89, 0}

    -- Adjust the camera's rotation if there's no movement in the x-direction
    if dpadx == 0 then 
        ease:inBack(Camera,1).LocalRotation = {Camera.LocalRotation.X, Camera.LocalRotation.Y, 0}
    end
end

---------------------------------------------
-- chat function ---
-- The player name and command prefix
local playerName = "kami"
local commandPrefix = ";"

Client.OnChat = function(payload)
    -- Extract the message from the payload
    local msg = type(payload) == "string" and payload or payload.message

    -- Print a different message depending on the player's username
    if Player.Username == playerName then
        print("[ ⭐ Owner & Developer ] "..Player.Username.." SENT A MESSAGE: " .. msg)
    else
        print(Player.Username.." SENT A MESSAGE: " .. msg)
    end

    -- Display a text bubble with the message
    Player:TextBubble(msg, 3, true)

    -- Check for different commands
    if msg == commandPrefix.."help" or msg == commandPrefix.."help 1" then 
        print("Available Commands")
        print("------------------")
        print("- "..commandPrefix.."modload {string}")
        print("- "..commandPrefix.."rejoin")
        print("- "..commandPrefix.."reload {'script'}")
        print("-----Page 1/2-----")
    elseif msg == commandPrefix.."help 2" then 
        print("Available Commands")
        print("------------------")
        print("- "..commandPrefix.."ban 'player_name'")
        print("- "..commandPrefix.."unban 'player_name'")
        print("- "..commandPrefix.."kick 'player_name'")
        print("-----Page 2/2-----")
    elseif msg == commandPrefix.."modload" or msg == commandPrefix.."reload" then 
        print("Sorry, this command is not for public use.")
    elseif msg == commandPrefix.."ban" or msg == commandPrefix.."unban" or msg == commandPrefix.."kick" then 
        print("Error 20: Admin Command Unusable!")
    end

    -- Play a sound effect
    sfx("waterdrop_2", {Position = Player.Position, Pitch = 1.1 + math.random() * 0.5})
end

local dpadx = 0
local dpady = 0
-- movement function --
Client.DirectionalPad = function (x, y)
    --[[ if not Player.canMove then
       Player.Motion = Number3 (0,0,0)
       dpadX = 0
       dpady = 0
     return
   end
   ]]--
   
   
local thresholdX = 0.00001
local thresholdY = 0.001


local rotationValue = 0.10
local fieldOfViewHigh = 110
local fieldOfViewLow = 100
local fieldOfViewNeutral = 80


if x < -thresholdX then 
    ease:outSine(Camera,0.2).LocalRotation = {Camera.LocalRotation.X, Camera.LocalRotation.Y, rotationValue}
    Player.Motion = Player.Right
  	elseif x > thresholdX then 
    ease:outSine(Camera,0.2).LocalRotation = {Camera.LocalRotation.X, Camera.LocalRotation.Y, -rotationValue}
    Player.Motion = Player.Left
	elseif x == 0 then 
    ease:inSine(Camera,0.25).LocalRotation = {Camera.LocalRotation.X, Camera.LocalRotation.Y, 0}
end


if y == 1 then 
    Player.Motion = Player.Forward
    ease:outSine(Camera, 1).FieldOfView = fieldOfViewHigh
	elseif y == -1 then 
    ease:outSine(Camera, 3).FieldOfView = fieldOfViewLow
	elseif y == 0 then
    ease:inSine(Camera, 0.5).FieldOfView = fieldOfViewNeutral
end

   --print(x)
   dpadx = x
   --y = dpady 
   Player.walk = 10
   Player.Motion = (Player.Forward * y + Player.Right * x) * 150
   end
local weapon = "punch"

Pointer.Zoom = function(zoomValue)
    -- for example, move the camera back and forth
    Camera.Position = Camera.Position + Camera.Forward * zoomSpeed * zoomValue
    -- we could also play with Camera.FieldOfView for a more convincing zoom effect,
    -- use a velocity-based zoom to have a smooth motion, or any other custom logic
   if weapon == "punch" then 
      weapon = "gun"
      Player:SwapHands()
      return
   end
   if weapon == "gun" then 
      weapon = "punch"
      Player:SwapHands()
      return
   end
end
--------------------------------------------------------------------
-- unused client function 
Client.DidReceiveEvent = nil 
Pointer.Click = nil
-- unused server function
Server.OnPlayerJoin = nil
Server.OnPlayerLeave = nil 
Server.DidReceiveEvent = nil
Server.OnStart = nil

-------------------------------------------------------------------
Server.Tick = function(dt) 
    -- nothing needed here in that script
  --if 
end