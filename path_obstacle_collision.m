function collision = path_obstacle_collision(path, obstacle)
    collision = 0; % Initialize the return variable. 0 means no collision
    for i = 1:length(path)-1
        start_point = path{i}; % Get the start point
        end_point = path{i+1}; % Get the end point

        % Check all the points along the line between start point and end point
        for t = 0:0.001:1
            x = start_point.x + t * (end_point.x - start_point.x);
            y = start_point.y + t * (end_point.y - start_point.y);
            
            % Check if the point lies within the obstacle
            if (x >= obstacle.position.x && x <= (obstacle.position.x + obstacle.width) && ...
                y >= obstacle.position.y && y <= (obstacle.position.y + obstacle.height))
                collision = 1; % Change the return variable to 1 which means collision detected
                return; % Return the result immediately after the collision detected
            end
        end
    end
end
