function parking_lot = generate_random_parking_lot(num_cars, num_slots, num_obstacles, width, height)
    % Generate random positions for cars and slots
    cars=[];
    for i = 1:num_cars
        t = Position(randi([0, width]), randi([0, height]));
        cars=[cars, Car(i,t,false,[])];
    end

    slots =[];
    for i = 1:num_slots
        t=Position(randi([0, width]), randi([0, height]));
        slots=[slots, Slot(i,t,[])];
    end

    road = [];

    obs = [];
    for i = 1:num_obstacles
        obs = [obs, Obstacle(Position(randi([0, width]), randi([0, height])), 1, 1)];
    end

    % Create the parking lot object
    parking_lot = ParkingLot(width, height, slots, cars, road, obs);
end
