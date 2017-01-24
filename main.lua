-- TODO
-- 1# fix the walking timer system
-- 2# UI and inventories
-- 3# A T M O S


require("assets")
require("util")
require("presetsfile")
function love.load()
    love.window.setMode(love.graphics.getWidth(),love.graphics.getHeight(),{resizable = true})

   screen = {
      width = love.graphics.getWidth(),
      height = love.graphics.getHeight()
   }
   touch = {x = 0,y = 0,istouching = false}
   
   mobile = true
   btns = {
      {name = "down",x = 900,y = 900,width = 150,height = 75},
      {name = "up",x = 900,y = 800,width = 150,height = 75},
      {name = "left",x = 725,y = 900,width = 150,height = 75},
      {name = "right",x = 1075,y = 900,width = 150,height = 75}
   }

   map = {}
   items = {}
   load_images()
   load_presets()
   loadmap_box()
   players = {
      {x = 1,y = 1,race = human,quad = "south",timer = {max = 10,counter = -1}}
   }
   framecount = 0
   mainplayer = 1
   camera = {dx = (players[mainplayer].x + 16) * 32,dy = (players[mainplayer].y + 16) * 32}
end

function love.update(dt)
   
   if (framecount == 0) then
	  	
	  	end
	  	
	  	
	  	if players[mainplayer].timer.counter < 0 then
        
        function love.keypressed(key)
          
          if key == "w" then
             players[mainplayer].y = players[mainplayer].y - 1
             players[mainplayer].quad = "north"
             players[mainplayer].timer.counter = players[mainplayer].timer.max
          end
          
          if key == "s" then
             players[mainplayer].y = players[mainplayer].y + 1
             players[mainplayer].quad = "south"
             players[mainplayer].timer.counter = players[mainplayer].timer.max
          end
          
          if key == "a" then
             players[mainplayer].x = players[mainplayer].x - 1
             players[mainplayer].quad = "west"
             players[mainplayer].timer.counter = players[mainplayer].timer.max
          end
          
          if key == "d" then
             players[mainplayer].x = players[mainplayer].x + 1
             players[mainplayer].quad = "east"
             players[mainplayer].timer.counter = players[mainplayer].timer.max
          end
          
        end
    end
	  	players[mainplayer].timer.counter = players[mainplayer].timer.counter - 1
	  	
	  	
	  	
	  	
	  	
	   
	  	framecount = framecount + 1
	  	
	  	camera.dx = (-players[mainplayer].x + 16)* 32
	  	camera.dy = (-players[mainplayer].y + 16)* 32

end



function love.draw()
   
   local drawsize = math.floor(((screen.height / 32) / 32) + 0.5)

   love.graphics.translate(camera.dx * drawsize,camera.dy * drawsize)
   for x = players[mainplayer].x - 16,players[mainplayer].x + 16,1 do
      if not(map[x] == nil) then
         for y = players[mainplayer].x - 16,players[mainplayer].y + 16,1 do
            if not(map[x][y] == nil) then
               love.graphics.draw(map[x][y].image,map[x][y].quad,x * 32 + drawsize,y * 32 + drawsize,0,drawsize,drawsize,32 / 2 + drawsize,32 / 2 + drawsize)
            end
         end
      end
   	end
   	
   	for i,obj in ipairs(items) do
   	   if obj.x >= players[mainplayer].x - 16 and obj.x <= players[mainplayer].x + 16 and obj.y >= players[mainplayer].y - 16 and obj.y <= players[mainplayer].y + 16 then
   	      love.graphics.draw(obj.image,obj.quad,obj.x * 32 + drawsize,obj.y * 32 + drawsize,0,drawsize,drawsize,32 / 2 + drawsize,32 / 2 + drawsize)
   	   end
   	end
   	
   	
   	for i,obj in ipairs(players) do
   	   love.graphics.draw(obj.race.image,obj.race[obj.quad],obj.x * 32 + drawsize,obj.y * 32 + drawsize,0,drawsize,drawsize,32 / 2 + drawsize,32 / 2 + drawsize)
   	end
   	
   	
   	if mobile then
   	   for i,obj in pairs(btns) do
   	      love.graphics.rectangle("fill",obj.x - camera.dx,obj.y - camera.dy,obj.width,obj.height)
   	   end
   	end
   if checkbutton("up") then
      	love.graphics.print("true",70,70)
   	end
   	love.graphics.print("x = " .. touch.x .. " y = " .. touch.y,0,50,0,3)
   	love.graphics.print(players[1].x .. " " .. players[1].y .. " " .. players[1].timer.counter,0 - camera.dx,0 - camera.dy,0,3)
   	
end