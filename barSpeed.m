% This function gives bar an initial speed. 

function q_speed = barSpeed(q0, speed)
	q0((end/2+2):3:end) = speed;
	q_speed = q0;
end
