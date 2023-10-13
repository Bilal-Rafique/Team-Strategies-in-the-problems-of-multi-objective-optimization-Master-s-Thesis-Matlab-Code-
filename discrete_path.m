function path = discrete_path(car, slot, steps)
    path = [];
    x_diff = slot.position.x - car.position.x;
    y_diff = slot.position.y - car.position.y;
    x_step = x_diff / (steps-1);
    y_step = y_diff / (steps-1);
    for i = 0:(steps-1)
        path = [path; Position(car.position.x + x_step * i, car.position.y + y_step * i];
    end
end
