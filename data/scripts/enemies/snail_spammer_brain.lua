function snail_spammer_brain(body)
    local brain = {}
    local vel_x = body.values[1] or body.vel_x
    local vel_y = body.values[2] or body.vel_y
	local stuck_count = body.values[3] or 0
	local wiggle_count = body.values[4] or 0
	local stuck_and_wiggle_count = body.values[5] or 0
	local movement_dir = body.values[6]

	if movement_dir == 0 then
		local randval = rand_int(1,3)
		if randval == 1 then
			movement_dir = -1
		else
			movement_dir = 1
		end
	end

	
	vel_x = body.vel_x
	vel_y = body.vel_y
	stuck_count = stuck_count + 1
	if stuck_count > 300 then
		stuck_count = 0
		brain.ability = false
	elseif stuck_count > 250 then
		brain.ability = true
	else 
		brain.ability = false
	end
    brain.movement = brain.movement or 0
    brain.rotation = brain.rotation or 0

	if body.wall_dist > 100 then
		brain.movement = 1
		local target_x = body.cost_center_x + (body.wall_dx * -1200)
		local target_y = body.cost_center_y + (body.wall_dy * -1200)
		move_towards(body, brain, target_x, target_y)
	else
		--brain.ability = true
		brain.movement = 0.5 * movement_dir
	end


    -- Update any custom brain values
    brain.values = {}

    brain.values[1] = vel_x
    brain.values[2] = vel_y
	brain.values[3] = stuck_count
	brain.values[4] = wiggle_count
	brain.values[5] = stuck_and_wiggle_count
	brain.values[6] = movement_dir

    return brain
end
