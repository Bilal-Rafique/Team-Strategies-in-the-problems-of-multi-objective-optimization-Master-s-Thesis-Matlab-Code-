function [best, lot] = GA(parking_lot, number_of_generations, size_of_generation, mutation_rate, crossover_rate)

    mutantN = round(size_of_generation * mutation_rate);
    crossoverN = round(size_of_generation * crossover_rate);
    EliteN = size_of_generation - mutantN - crossoverN;

    gen = generate_random_generation(parking_lot, size_of_generation);
    number_of_generations = number_of_generations - 1;

    best = gen.list_of_solutions(1);
    f = [];
    for i = 1:number_of_generations
        new_list = gen.list_of_solutions(1:EliteN);
        crossovered = crossoverN;

        for j = 2:crossoverN + 1
            [temp1, temp2] = crossover_one_point(gen.list_of_solutions(1), gen.list_of_solutions(j));
            new_list = [new_list, temp1, temp2];
            
            crossovered = crossovered - 2;
            if crossovered <= 0
                break;
            end
        end

        for j = 1:mutantN
            new_list = [new_list, mutate_random_resetting(gen.list_of_solutions(size_of_generation - j + 1))];
        end

        gen = generation(new_list);
        if gen.list_of_solutions(1).fitness < best.fitness
            best = gen.list_of_solutions(1);
        end
    
        fprintf('Generation %d best fitness: %f\n', i+1, best.fitness);
        f = [f, best.fitness];
    end

    plot_fitness(f);
    [best, lot] = best.update_parking_lot();
    best.show();

end
