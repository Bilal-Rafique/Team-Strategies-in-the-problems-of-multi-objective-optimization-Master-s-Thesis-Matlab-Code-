classdef solution
    properties
        list;
        fitness = 0;
        parking_lot;
        cars;
        parking_slots;
    end

    methods
        function obj = solution(list, parking_lot)
            obj.list = list;
            obj.parking_lot = parking_lot;
            obj.cars = parking_lot.cars;
            obj.parking_slots = parking_lot.parking_slots;
            obj = update_parking_lot(obj);
            obj = update_fitness(obj);
            if length(list) < length(obj.parking_slots)
                obj = adding_dummy(obj);
            end
        end

        function obj = adding_dummy(obj)
            for i = 1:length(obj.parking_slots) - length(obj.list)
                obj.list = [obj.list, -1];
            end
        end

        function str = print(obj)
            str = sprintf('Solution: %s with fitness %s\n', mat2str(obj.list), num2str(obj.fitness));
        end

        function [obj, updatedParkingLot] = update_parking_lot(obj)
            for i = 1:length(obj.list)
                if obj.list(i) == -1
                    obj.parking_slots(i).is_empty = true;
                    obj.parking_slots(i).parked_car = [];
                else
                    obj.parking_slots(i).is_empty = false;
                    obj.parking_slots(i).parked_car = obj.cars(obj.list(i)+1);
                end
            end
            obj.parking_lot.cars = obj.cars;
            obj.parking_lot.parking_slots = obj.parking_slots;
            updatedParkingLot = obj.parking_lot;
        end
        
        function [obj, fit] = update_fitness(obj)
            obj.fitness = obj.parking_lot.calculate_fitness();
            fit=obj.fitness;
        end
        
       
        function show(obj)
            obj.parking_lot.plot();
        end
    end
end
