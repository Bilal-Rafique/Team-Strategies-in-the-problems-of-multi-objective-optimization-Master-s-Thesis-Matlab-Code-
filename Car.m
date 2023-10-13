classdef Car
    properties
        id
        position
        is_parked
        path
    end
    methods
        function obj = Car(id, position, is_parked, path)
            if nargin < 4
                path = [];
            end
            obj.id = id;
            obj.position = position;
            obj.is_parked = is_parked;
            obj.path = path;
        end
        function disp(obj)
            fprintf('Car %d at (%d, %d) is_parked: %d\n', obj.id, obj.position.x, obj.position.y, obj.is_parked)
        end
    end
end
