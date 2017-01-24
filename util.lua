function changeimage(x,y,quade,spritee)
   map[x][y].quad = quade
   map[x][y].image = spritee
end

function instantiate(preset,xx,yy)
   local instance = {}
   for i,obj in pairs(preset) do
      instance[i] = obj
   end  
   instance.x = xx
   instance.y = yy
   items[#items + 1] = instance
end

function makewall(xx,yy)
   instantiate(presets.wall,xx,yy)
end

function checkbutton(string)
   for i,obj in ipairs(btns) do
      if touch.x > obj.x and touch.x < (obj.x + obj.width) and touch.y > obj.y and touch.y < (obj.y + obj.height) then
         if obj.name == string and touch.istouching then
            return true
         else
            return false
         end
      end
   end
end

--function vision(dt)
   --for x = players[mainplayer].x - 16,players[mainplayer].x + 16,1 do
      --for y = players[mainplayer].y - 16,players[mainplayer].y + 16,1 do
         --while not (x == players[mainplayer].x and y == players[mainplayer].y) do
            --local xx = x
            --local yy = y
            
            --local iterated = {}
            
            --for i,obj in ipairs(items) do
               --if xx = obj.x
            
            --local distance = math.abs(players[mainplayer].x - x) + math.abs(players[mainplayer].y - y)
   
            --local angle = math.atan2(players[mainplayer].y - y,players[mainplayer].x - x)

            --xx = xx + (1 * math.cos(angle) * dt)
            --yy = yy + (1 * math.sin(angle) * dt)
      






function love.touchpressed(id,xx,yy)
   touch.istouching = true
   touch.x = xx
   touch.y = yy
end

function love.touchmoved(id,xx,yy)
   touch.istouching = true
   touch.x = xx
   touch.y = yy
end 

function love.touchreleased()
   touch.istouching = false
end