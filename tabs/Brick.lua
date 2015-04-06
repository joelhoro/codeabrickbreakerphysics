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
    local colors = { color(189, 216, 47, 255),color(85, 70, 178, 255),color(115, 73, 73, 255),
        color(216, 46, 208, 255),color(24, 222, 57, 255)}
    self.color = colors[math.random(1,5)]
end

function Brick:destroy()
    log:print("Brick destroyed")
    sound(SOUND_BLIT, 10703)
    self.active = false
    self.body:destroy()
end

function Brick:draw()
    if self.active then
        pushStyle()
        fill(self.color)
        rect(self.body.x-self.width/2,self.body.y-self.height/2,self.width,self.height) 
        popStyle()
    end
end

