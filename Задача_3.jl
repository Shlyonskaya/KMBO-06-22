"""
 ДАНО: Робот - в произвольной клетке ограниченного прямоугольного поля    
РЕЗУЛЬТАТ: Робот - в исходном положении, и все клетки поля промаркированы. 
"""
using HorizonSideRobots
function full!(robot)
    corner!(robot)
    putmarker!(robot)
    side = Ost;
    while !isborder(robot, side)
        move!(robot, side)
        putmarker!(robot)
        if isborder(robot, side) && !isborder(robot, Nord)
            move!(robot, Nord)
            putmarker!(robot)
            side = inverse(side)
        end
    end
end

function corner!(robot)
    while !isborder(robot, Sud)
        move!(robot, Sud)
    end
    while !isborder(robot, West)
        move!(robot, West)
    end
end

inverse(side::HorizonSide) = HorizonSide((Int(side) +2)% 4)
