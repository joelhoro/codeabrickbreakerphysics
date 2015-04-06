physics.rectangle = function(x,y,w,h)
    local width = vec2(w,0)
    local height = vec2(0,h)
    local body = physics.body(POLYGON,
        -width/2-height/2,
         width/2-height/2,
         width/2+height/2,
        -width/2+height/2
    )
    body.x = x
    body.y = y
    return body
end
