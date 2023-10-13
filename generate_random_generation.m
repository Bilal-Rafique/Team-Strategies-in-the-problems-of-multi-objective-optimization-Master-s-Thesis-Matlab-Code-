function gen = generate_random_generation(parking_lot, size)
    list = [];
    for i = 1:size
        list = [list, generate_random_solution(parking_lot)];
    end
    gen = generation(list);
end
