function isFeasible = is_feasible(path, obstacles)
    for i = 1:length(obstacles)
        if path_obstacle_collision(path, obstacles(i))
            isFeasible = false;
            return;
        end
    end
    isFeasible = true;
end