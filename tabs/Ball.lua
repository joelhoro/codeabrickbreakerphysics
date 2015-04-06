Ball = class()

function Ball:init(x,y,r)
    local ball = physics.body(CIRCLE,r)
    ball.x = x
    ball.y = y
    ball.friction = 0
    ball.linearDamping = 0
    ball.angularDamping = 0
    ball.restitution = 1
    ball.info = self
    ball.type = DYNAMIC
    self.r = r
    self.body = ball
    self.type = "ball"
end

function Ball:Kick()
    self.body.linearVelocity = vec2(200,0):rotate(math.random(45,135)/180*math.pi)    
end

function Ball:update()
    if false and math.abs(self.body.linearVelocity.y)<200 then
        print(self.body.linearVelocity)        
        self.body.linearVelocity = self.body.linearVelocity * 1.1 + vec2(0,1)
        print(self.body.linearVelocity)        
    end
    if self.body.linearVelocity:dist(vec2(0,0)) < 400 then
        print("acc")
        self.body.linearVelocity = self.body.linearVelocity * 1.2
    end
end

function Ball:draw()  
    self:update()  
    pushStyle()
    fill(171, 165, 54, 255)
    ellipse(self.body.x,self.body.y,2*self.r)
    popStyle()
end

