classdef Position
    properties
        x
        y
    end
    methods
        function obj = Position(x, y)
            obj.x = x;
            obj.y = y;
        end
        function disp(obj)
            fprintf('(%d, %d)', obj.x, obj.y)
        end
    end
end

