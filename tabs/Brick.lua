Brick = class()

function Brick:init(top,width,height)
--    print(width,height,top.x,top.y)
    local body = physics.rectangle(top.x,top.y,width,height)
    body.restitution = 1
    body.info = self
    body.type = STATIC
    self.top = top
    self.body = body
    self.width = width
    self.height = height
    self.type = "brick"
    self.active = true
end

function Brick:destroy()
    sound(SOUND_BLIT, 10703)
    self.active = false
    self.body:destroy()
end

function Brick:draw()
    if self.active then
        rect(self.body.x-self.width/2,self.body.y-self.height/2,self.width,self.height) 
    end
end

