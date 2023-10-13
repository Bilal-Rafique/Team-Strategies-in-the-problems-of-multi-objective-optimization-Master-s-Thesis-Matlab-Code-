classdef Road
    properties
        position
    end
    methods
        function obj = Road(position)
            obj.position = position;
        end
        function disp(obj)
            fprintf('Road at (%d, %d)\n', obj.position.x, obj.position.y)
        end
    end
end