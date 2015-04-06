function setupWalls()
    sides = {}
    sides[0] = Wall(vec2(0,0),vec2(0,HEIGHT))
    sides[1] = Wall(vec2(WIDTH,0),vec2(WIDTH,HEIGHT))
    sides[2] = Wall(vec2(0,HEIGHT),vec2(WIDTH,HEIGHT))
    sides[3] = Wall(vec2(0,0),vec2(WIDTH,0))
end
    
function setupBricks()
    bricksTop = vec2(0, HEIGHT-250 )
    bricksWidth = vec2(65,0)
    bricksHeight = vec2(0,30)
    width = 0.8 * bricksWidth
    height = 0.8 * bricksHeight


    bricks = {}
    level = levels[3]
    for i,row in ipairs(level) do
        for j,v in ipairs(row) do
            if v>0 then
                top = bricksTop + i * bricksHeight + j * bricksWidth
                bricks[#bricks+1] = Brick(top,width.x,height.y)
            end
        end
    end    
end

function setup()
    physics.gravity(0,0)
    ball = Ball(500,200,20)
    ball:Kick()
    ball2 = Ball(200,200,20)
    ball2:Kick()
    paddle = Paddle()
    setupBricks()
    setupWalls()
    paddle.autopilot = true
end


function collide(contact)
    bodies = {contact.bodyA,contact.bodyB}
    for i,b in ipairs(bodies) do
        if b.info.type == "brick" then b.info:destroy() end
        if b.info.type == "wall" then sound(SOUND_BLIT, 10702) end
        if b.info.type == "paddle" then sound(SOUND_POWERUP, 10702) end
    end
end

function c() 

    
    if contact.bodyA.info == "brick" then
        print(contact.bodyA)
     --   contact.bodyA.d
        contact.bodyA.info = nil
        contact.bodyA.x=3000
        print "Brick touched" 
    end
    if contact.bodyB.info == "brick" then
    --    contact.bodyB.destroy()
        print "Brick touched (b)"    
    end
end

function touched(touch)
    paddle:touched(touch)
end

function draw()
        
    background(251, 251, 251, 255)
    
    paddle:draw()
            
    pushStyle()
    fill(255, 0, 69, 255)
    for i,brick in ipairs(bricks) do
      brick:draw()
    end
    popStyle()
    
    ball:draw()
    ball2:draw()
    
end
