classdef Slot
    properties
        id
        position
        parked_car
        is_empty
    end
    methods
        function obj = Slot(id, position, parked_car)
            if nargin < 3
                parked_car = [];
            end
            obj.id = id;
            obj.position = position;
            obj.parked_car = parked_car;
            obj.is_empty = isempty(parked_car);
        end
        function disp(obj)
            if isempty(obj.parked_car)
                fprintf('Slot %d at (%d, %d) is empty\n', obj.id, obj.position.x, obj.position.y)
            else
                fprintf('Slot %d at (%d, %d) has car %d\n', obj.id, obj.position.x, obj.position.y, obj.parked_car.id)
            end
        end
    end
end
