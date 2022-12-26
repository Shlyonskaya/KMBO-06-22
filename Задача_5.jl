"""
 ДАНО: На ограниченном внешней прямоугольной рамкой поле имеется ровно одна внутренняя перегородка в форме прямоугольника. 
Робот - в произвольной клетке поля между внешней и внутренней перегородками.     
РЕЗУЛЬТАТ: Робот - в исходном положении и по всему периметру внутренней, как внутренней, так и внешней, перегородки поставлены маркеры. 
"""
using HorizonSideRobots

function move_to_angle!(robot)
 return (side = Nord, num_steps =  numsteps_along!(robot, Sud)), 
 (side = Ost,  num_steps =  numsteps_along!(robot, West)),
 (side = Nord, num_steps =  numsteps_along!(robot, Sud)) 
 
end  

function move_to_back!(robot, back_path)     
 for next in back_path       
  along!(robot, next.side, next.num_steps)    
 end 
end

function find_internal_border!(robot) 
 function find_in_row(side) # - это определение локальной вспомогательной функции         
  while !isborder(robot, Nord) &&  !isborder(robot, side)             
   move!(robot, side)         
  end     
 end  
 side = Ost     
 find_in_row(side)     
 while !isborder(robot, Nord)         
  move!(robot, Nord)         
  side = inverse(side)         
  find_in_row(side)     
 end 
end   

function move_to_internal_sudwest!(robot)     
 while isborder(robot, Nord)         
  move!(robot, West) 
 end 
end   

function mark_external_rect!(robot)     
 for side in (Ost, Nord, West, Sud)         
  mark_along!(robot, side)     
 end 
end 

function mark_along!(robot, side)     
 while !isborder(robot, side)         
  move!(robot, side)         
  punmarker!(robot)     
 end 
end    
function mark_internal_rect!(robot)     
 for side in (Ost, Nord, West, Sud)         
  mark_along!(robot, side, left(side))     
 end 
end  
function mark_along!(robot, move_side, border_side)      
 while isborder(robot, border_side)         
  move!(robot, move_side)         
  putmarker!(robot)     
 end 
end 
