function plot_fitness_slot(fitnesses, slotIndex, number_of_iterations)
    plot(fitnesses);
    xlabel('Iteration');
    ylabel('Fitness');
    title(['slot: ', num2str(slotIndex), ' number of iterations: ', num2str(number_of_iterations)]);
end
