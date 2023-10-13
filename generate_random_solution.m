function sol = generate_random_solution(parking_lot)
    list = -1*ones(1,length(parking_lot.parking_slots));
    car_indices = randperm(length(parking_lot.parking_slots))-1;
    num_dummy = length(parking_lot.parking_slots) - length(parking_lot.cars);
    car_indices = car_indices - num_dummy;
    car_indices(car_indices < 0) = -1;
    list = car_indices;
    sol = solution(list,parking_lot);
end
