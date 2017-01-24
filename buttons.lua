function touchregister()
function love.touchpressed(id,xx,yy)
beingpressed = true
pressx = xx
pressy = yy
end

 
function love.touchmoved(id,xx,yy)
beingpressed = true
pressx = xx
pressy = yy
end 

function love.touchreleased()
beingpressed = false
end
end

function checkbutton(button)

for i,obj in ipairs(btns) do
if pressx > obj.x and pressx < (obj.x + obj.width) and pressy > obj.y and pressy < (obj.y + obj.height) then
if obj.name == button and beingpressed then
return true
end
end
end
end