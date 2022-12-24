"""
 ДАНО: На ограниченном внешней прямоугольной рамкой поле имеется ровно одна внутренняя перегородка в форме прямоугольника. 
Робот - в произвольной клетке поля между внешней и внутренней перегородками.     
РЕЗУЛЬТАТ: Робот - в исходном положении и по всему периметру внутренней, как внутренней, так и внешней, перегородки поставлены маркеры. 
"""
using HorizonSideRobots
function around!(robot)
   corner!(robot)
end


function corner!(robot)
    while !isborder(robot, Sud)
        move!(robot, Sud)
    end
    while !isborder(robot, West)
        move!(robot, Ost)
    end
end


inverse(side::HorizonSide) = HorizonSide((Int(side) +2)% 4)
