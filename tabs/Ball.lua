Ball = class()

function Ball:init(x,y,r)
    local ball = physics.body(CIRCLE,r)
    ball.x = x
    ball.y = y
    ball.friction = 0
    ball.linearDamping = 0
    ball.angularDamping = 0
    ball.restitution = 0.5
    ball.info = self
    ball.type = DYNAMIC
    self.r = r
    self.body = ball
    self.type = "ball"
end

function Ball:Kick()
    self.body.linearVelocity = vec2(1000,0):rotate(math.random(45,135)/180*math.pi)    
end

function Ball:draw()    
    pushStyle()
    fill(13, 13, 13, 255)
    ellipse(self.body.x,self.body.y,2*self.r)
    popStyle()
end

