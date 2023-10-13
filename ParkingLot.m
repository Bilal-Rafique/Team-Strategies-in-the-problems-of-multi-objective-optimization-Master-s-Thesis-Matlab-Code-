classdef ParkingLot
    properties
        width
        height
        parking_slots
        cars
        road
        obstacles
        best_solution
    end
    methods
        function obj = ParkingLot(width, height, parking_slots, cars, road, obstacles, best_solution)
            if nargin < 7
                best_solution = [];
                if nargin < 6
                    obstacles = [];
                end
            end
            obj.width = width;
            obj.height = height;
            obj.parking_slots = parking_slots;
            obj.cars = cars;
            obj.road = road;
            obj.obstacles = obstacles;
            obj.best_solution = best_solution;
        end
        function disp(obj)
            fprintf('ParkingLot %dx%d with %d slots and %d cars\n', obj.width, obj.height, length(obj.parking_slots), length(obj.cars))
        end
        
        function plot(obj)
            figure;
            hold on;
            xlim([0, obj.width]);
            ylim([0, obj.height]);
            
            % Plot cars
            for i = 1:length(obj.cars)
                if ~isa(obj.cars(i), 'Car')
                    error('Expected obj.cars(i) to be an instance of class Car');
                end
                if ~isa(obj.cars(i).position, 'Position')
                    error('Expected obj.cars(i).position to be an instance of class Position');
                end
                plot(obj.cars(i).position.x, obj.cars(i).position.y, 'ro');
            end
            
            % Plot slots
            for i = 1:length(obj.parking_slots)
                if isempty(obj.parking_slots(i).parked_car)
                    plot(obj.parking_slots(i).position.x, obj.parking_slots(i).position.y, 'bs');
                else
                    plot(obj.parking_slots(i).position.x, obj.parking_slots(i).position.y, 'bx');
                    plot([obj.parking_slots(i).parked_car.position.x, obj.parking_slots(i).position.x], [obj.parking_slots(i).parked_car.position.y, obj.parking_slots(i).position.y], 'g--');
                end
            end
            
            % Plot roads
            for i = 1:length(obj.road)
                plot(obj.road(i).position.x, obj.road(i).position.y, 'k.');
            end
        
            % Plot obstacles
            for i = 1:length(obj.obstacles)
                rectangle('Position', [obj.obstacles(i).position.x, obj.obstacles(i).position.y, obj.obstacles(i).width, obj.obstacles(i).height], 'FaceColor', [0.5 0.5 0.5]);
            end

        
            % Adding legend
            legend('Car', 'Empty Slot', 'Occupied Slot', 'Car to Slot', 'Obstacle', 'Location', 'Best');
            hold off;
        end

        
        %function plot_with_disturbance(obj)
            % This function needs to be implemented
        %end

        %function add_road(obj, start_position, end_position)
            % This function needs to be implemented
       % end

        function unpark_all(obj)
            for i = 1:length(obj.parking_slots)
                obj.parking_slots(i).parked_car = [];
                obj.parking_slots(i).is_empty = true;
            end
            for i = 1:length(obj.cars)
                obj.cars(i).is_parked = false;
            end
        end

        function total_distance = calculate_fitness(obj)
            total_distance = 0;
            for i = 1:length(obj.parking_slots)
                if isempty(obj.parking_slots(i).parked_car)
                    continue;
                end
                car_position = obj.parking_slots(i).parked_car.position;
                slot_position = obj.parking_slots(i).position;
                distance = sqrt((car_position.x - slot_position.x)^2 + (car_position.y - slot_position.y)^2);
                total_distance = total_distance + distance;
            end
        end

        function discrete_lot(obj, steps)
            for i = 1:length(obj.parking_slots)
                if isempty(obj.parking_slots(i).parked_car)
                    continue;
                end
                obj.parking_slots(i).parked_car.path = discrete_path(obj.parking_slots(i).parked_car, obj.parking_slots(i), steps);
                
            end
        end


        function lot=set_path(obj, index_slot, path)
            obj.parking_slots(index_slot).parked_car.path = path;
            lot=obj;
        end

        function plot_path(obj)
            figure; 
            hold on;
            xlim([0 obj.width]);
            ylim([0 obj.height]);
            
            % Plot roads
            for i = 1:length(obj.road)
                plot(obj.road(i).position.x, obj.road(i).position.y, 'k.', 'DisplayName','Road');
            end
        
            % Plot obstacles
            for i = 1:length(obj.obstacles)
                rectangle('Position',[obj.obstacles(i).position.x, obj.obstacles(i).position.y, obj.obstacles(i).width, obj.obstacles(i).height], 'FaceColor',[0.5 0.5 0.5]);
            end
        
            % Plot parking slots
            for i = 1:length(obj.parking_slots)
                if isempty(obj.parking_slots(i).parked_car)
                    plot(obj.parking_slots(i).position.x, obj.parking_slots(i).position.y, 'bs', 'DisplayName','Empty Slot');
                else
                    plot(obj.parking_slots(i).position.x, obj.parking_slots(i).position.y, 'bx', 'DisplayName','Occupied Slot');
        
                    % Plot path
                    path = obj.parking_slots(i).parked_car.path;
                    for j = 1:length(path) - 1
                        plot([path{j}.x, path{j+1}.x], [path{j}.y, path{j+1}.y], 'r-', 'DisplayName','Path');
                    end
                end
            end
        
            % Plot cars
            for i = 1:length(obj.cars)
                plot(obj.cars(i).position.x, obj.cars(i).position.y, 'ro', 'DisplayName','Car');
            end
        

            hold off;
        end

    end
end
