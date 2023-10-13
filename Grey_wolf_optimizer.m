function lot = Grey_wolf_optimizer(lot, wolf_pack_size, number_of_iterations, step_size, a0)
    for i = 1:length(lot.parking_slots)
        slot = lot.parking_slots(i);
        fprintf('slot: %d\n', i);
        if ~isempty(slot.parked_car)
            w = GWO(lot, slot, lot.obstacles, wolf_pack_size, number_of_iterations, step_size, a0);
            lot = set_path(lot, i, w);
        end
    end
    lot.plot_path()
end