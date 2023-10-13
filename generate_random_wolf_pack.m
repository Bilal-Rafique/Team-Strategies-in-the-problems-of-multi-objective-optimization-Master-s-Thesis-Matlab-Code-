function wolves = generate_random_wolf_pack(lot, slot, wolf_pack_size, step_size)
    wolves = {};
    i = 0;
    while i < wolf_pack_size
        path = generate_random_path(lot, slot, step_size);
        fitness = calculate_fitness(path);
        if is_feasible(path, lot.obstacles)
            wolves{end+1} = Wolf(path,fitness);
            i = i + 1;
        end
    end
    wolves = Wolf_Pack(wolves);
end