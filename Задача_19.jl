"""
 Написать рекурсивную функцию, перемещающую робота до упора в заданном направлении
"""

function move_recursion!(robot,side) #Идет рекурсивно до стены в заданном направлении.
    if (!isborder(robot,side))
        move!(robot,side)
        move_recursion!(robot,side)
    end
end
