Wall = class()

function Wall:init(v1,v2)
    local body = physics.body(EDGE,v1,v2)
    body.type = STATIC
    body.restitution = 1
    body.angularDamping=0
    body.info = self
    self.body = body
    self.type = "wall"
end

