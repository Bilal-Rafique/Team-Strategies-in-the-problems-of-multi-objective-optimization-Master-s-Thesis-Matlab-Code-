function path = generate_random_path(lot, slot, step_size)
    max_x = lot.width;
    max_y = lot.height;
    x_dif = slot.position.x - slot.parked_car.position.x;
    x_dif = x_dif/(step_size-1);
    step_size = step_size - 2;
    path = {Position(slot.parked_car.position.x, slot.parked_car.position.y)};

    for i = 1:step_size
        path{end+1} = Position(path{end}.x + x_dif, rand()*max_y);
    end
    path{end+1} = Position(slot.position.x, slot.position.y);
end
