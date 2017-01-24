function load_images()
floors = {
   image = love.graphics.newImage("floors.png"),
   gray = love.graphics.newQuad(0,0,32,32,1056,1056),
   space = love.graphics.newQuad(96,768,32,32,1056,1056)
      
}
walls = {
   image = love.graphics.newImage("walls.png"),
   wall = love.graphics.newQuad(0,0,32,32,22 * 32,22 * 32)
}
human = {
   image = love.graphics.newImage("human.png"),
   south = love.graphics.newQuad(64,0,32,32,480,480),
   north = love.graphics.newQuad(96,0,32,32,480,480),
   east = love.graphics.newQuad(128,0,32,32,480,480),
   west = love.graphics.newQuad(160,0,32,32,480,480)
}
end

function loadmap_box()
   for x = 1,1000,1 do
			    map[x] = {}
			    for y = 1,1000,1 do
          map[x][y] = {oxygen = 19.24,nitrogen = 81.04,co2 = 1.03,plasma = 0,image = floors.image,quad = floors.space,items = {}}
	    		end
	  	end

   for x = 5,10,1 do
      for y = 5,10,1 do
				      instantiate(presets.floor,x,y)
      end
   end
   
   for x = 5,10,1 do
      instantiate(presets.wall,x,5)
   end
end
