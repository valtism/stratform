function _init()
    p = {}
    for x = 1, 15 do
        for y = 1, 15 do
            local sprite = mget(x, y)
            if (sprite == 1) then
                p.x = x
                p.y = y
                p.dir = "right"
                mset(x, y, 0)
            end
            if (sprite == 2) then
                p.x = x
                p.y = y
                p.dir = "left"
                mset(x, y, 0)
            end
        end
    end
end

function _update() move_player() end

function _draw()
    cls()
    map(0, 0)
    spr(1, p.x * 8, p.y * 8)
end

function await_input()
    if (btnp(4)) then move_player("step") end
    if (btnp(5)) then move_player("jump") end
end

function move_player(input)
    local next = {x = p.x, y = p.y}
    local movement = nil
    local is_falling = ~is_collision(p.x, p.y+1)
    if (input == "step" and is_falling) then 
        if ()
    end

    if (btnp(0)) then next.x = p.x - 1 end
    if (btnp(1)) then next.x = p.x + 1 end
    if (btnp(2)) then next.y = p.y - 1 end
    if (btnp(3)) then next.y = p.y + 1 end
    if (p.x ~= next.x or p.y ~= next.y) then
        if can_move(next) then p = next end
    end
end

function is_collision(x,y)
    local sprite = mget(x, y)
    return fget(sprite) == 1
end

function can_move(p)
    local map_sprite = mget(p.x, p.y)
    local flag = fget(map_sprite)

    return flag ~= 1
end
