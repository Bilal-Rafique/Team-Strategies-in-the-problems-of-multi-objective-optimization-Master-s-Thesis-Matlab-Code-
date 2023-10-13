function sol = mutate_swap(solution)
    index1 = randi(length(solution.list),1);
    index2 = randi(length(solution.list),1);
    while index1 == index2
        index2 = randi(length(solution.list),1);
    end
    [solution.list(index1),solution.list(index2)] = deal(solution.list(index2),solution.list(index1));
   
    [solution, solution.parking_lot]=solution.update_parking_lot();
   
    solution.parking_slots=solution.parking_lot.parking_slots;
    [solution , solution.fitness]=solution.update_fitness();
    sol = solution;
    
end

