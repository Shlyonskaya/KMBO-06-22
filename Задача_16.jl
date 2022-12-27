"""
ДАНО: Робот - рядом с горизонтальной бесконечно продолжающейся в обе стороны перегородкой (под ней), в которой имеется проход шириной в одну клетку.  
Решить задачу с использованием обобщённой функции  shuttle!(stop_condition::Function, robot, side) 

РЕЗУЛЬТАТ: Робот - в клетке под проходом 
"""

function move_recursion!(robot,side) #Идет рекурсивно до стены в заданном направлении.
    if (!isborder(robot,side))
        move!(robot,side)
        move_recursion!(robot,side)
    end
end
