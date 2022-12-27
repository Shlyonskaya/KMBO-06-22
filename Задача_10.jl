"""
ДАНО: Робот - в произвольной клетке ограниченного прямоугольного поля (без внутренних перегородок)   

РЕЗУЛЬТАТ: Робот - в исходном положении, и на всем поле расставлены маркеры в шахматном порядке клетками размера N*N (N-параметр функции), 
начиная с юго-западного угла 
"""
function find_corner!(robot) #Функция, направляющая робота в угол и считающая шаги
    num_steps_Sud=0
    num_steps_West=0
    while (!isborder(robot,Sud))
        move!(robot,Sud)
        num_steps_Sud+=1
    end
    while (!isborder(robot,West))
        move!(robot,West)
        num_steps_West+=1
    end
    return num_steps_Sud, num_steps_West
end

function go_to_home!(robot,num_steps_Sud,num_steps_West) #Возвращает робота в исходное положение
    for _ in 1:num_steps_Sud
        move!(robot,Nord)
    end
    for _ in 1:num_steps_West
        move!(robot,Ost)
    end
end

function chess!(robot,N) #Рисовать
    while (!isborder(robot,Nord))
        for _ in 1:N #Рисуем N строк 
            while (!isborder(robot,Ost))
                point!(robot,N)
                moving!(robot,N)
            end
            while (!isborder(robot,West))
                move!(robot,West)
            end
                try_move!(robot,Nord)
        end

        for _ in 1:N
            while (!isborder(robot,Ost))
                moving!(robot,N)
                point!(robot,N)
            end
            while (!isborder(robot,West))
                move!(robot,West)
            end
            try_move!(robot,Nord)
        end
    end
end

function point!(robot,N) #Рисуем часть точки
        for _ in 1:N
            putmarker!(robot)
            if (try_move!(robot,Ost)==false)
                return
            end
        end
end

function moving!(robot,N) #Расстояние между частями точки
    for _ in 1:N
        try_move!(robot,Ost)
    end
end

function try_move!(robot,side) 
#делает попытку одного шага в заданном направлении и  возвращает true, в случае, если это возможно, и false - в  противном случае (робот остается в исходном положении) 
    if (!isborder(robot,side))
        move!(robot,side)
        return true
    else
        return false
    end
end

function go_to_corner!(robot) #уходим снова в юго-западный угол
    while (!isborder(robot,Sud))
        move!(robot,Sud)
    end

    while (!isborder(robot,West))
        move!(robot,West)
    end
end

function solve!(robot,N::Int)
   num_steps_Sud,num_steps_West=find_corner!(robot)
   chess!(robot,N)
   go_to_corner!(robot)
   go_to_home!(robot,num_steps_Sud,num_steps_West)
end
