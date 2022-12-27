"""
ДАНО: Робот - рядом с горизонтальной бесконечно продолжающейся в обе стороны перегородкой (под ней), в которой имеется проход шириной в одну клетку.  
Решить задачу с использованием обобщённой функции  shuttle!(stop_condition::Function, robot, side) 

РЕЗУЛЬТАТ: Робот - в клетке под проходом 
"""

function shuttle!(stop_condition::Function, robot, side) #перемещает робота взад вперед (челнок)
    n=0 
    while !stop_condition() 
    n += 1
    along!(robot, side, n)
    side = inverse(side)
    end
end

function along!(robot, side, n) #Просто ходит по кол-ву шагов
    for _i in 1:n
    move!(robot,side)
    end
end

function solve!(robot,side) #смотрит с какой стороны граница
    if (isborder(robot,left(side)))
        shuttle!(()->!isborder(robot,left(side)),robot,side)
    elseif (isborder(robot,right(side)))
        shuttle!(()->!isborder(r,right(side)),robot,side)
    end
end

right(side::HorizonSide)::HorizonSide = HorizonSide(mod(Int(side)+1, 4))
left(side::HorizonSide)::HorizonSide = HorizonSide(mod(Int(side)-1, 4))
inverse(side::HorizonSide)::HorizonSide = HorizonSide(mod(Int(side)+2, 4))
