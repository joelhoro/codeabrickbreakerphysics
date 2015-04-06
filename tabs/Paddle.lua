Paddle = class()

function Paddle:init()
    self.width = 100
    self.height = 20
    self.speed = 500
    self.x = WIDTH/2
    self.y = 50
    local body = physics.rectangle(self.x,self.y,self.width,self.height)
    body.type = KINEMATIC
    body.restitution = 1
    body.x = self.x
    body.y = self.y
    body.info = self
    self.body = body
    self.type = "paddle"
end

function Paddle:draw()
    self.body.y = self.y
    if self.autopilot then
        if ball.body.y < ball2.body.y then
            self.body.x = ball.body.x
        else
            self.body.x = ball2.body.x
        end
    end
    fill(255, 0, 62, 255)
    rect(self.body.x-self.width/2,self.body.y-self.height/2,self.width,self.height) 
end

function Paddle:Move(dir)
    local step = ( { left=-1, right=1, still = 0 } )[dir] * self.speed
    local velocity = vec2(step,0)
    self.body.linearVelocity = velocity
end
    
function Paddle:touched(touch)
    if touch.state == BEGAN then
        if touch.x < WIDTH/4 then self:Move("left") end
        if touch.x > 3*WIDTH/4 then self:Move("right") end
    elseif touch.state == ENDED then
        self:Move("still")
    end
end
