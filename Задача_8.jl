"""
ДАНО: Где-то на неограниченном со всех сторон поле без внутренних перегородок имеется единственный маркер. Робот - в произвольной клетке этого поля.    

РЕЗУЛЬТАТ: Робот - в клетке с маркером. 
"""

using HorizonSideRobots

function find_marker!(robot)
	max_num_steps = 1
	side = Nord
	while !ismarker(robot)
		find_marker_along!(robot, side, max_num_steps)
		side = left(side)
		find_marker_along!(robot, side, max_num_steps)
		max_num_steps += 1
		side = left(side)
	end
end

function find_marker_along!(robot, side, max_num_steps)
	num_steps = 0
	while num_steps < max_num_steps && !ismarker(robot)
		move!(robot, side)
		num_steps += 1
	end
end
