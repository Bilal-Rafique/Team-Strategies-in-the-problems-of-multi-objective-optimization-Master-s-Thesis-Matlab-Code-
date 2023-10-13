classdef Obstacle
    properties
        position
        width
        height
    end
    methods
        function obj = Obstacle(position, width, height)
            obj.position = position;
            obj.width = width;
            obj.height = height;
        end
        function disp(obj)
            fprintf('Obstacle(position=(%d, %d), width=%d, height=%d)\n', obj.position.x, obj.position.y, obj.width, obj.height)
        end
    end
end