function plot_fitness(f)
    plot(f);
    ylabel('Fitness');
    xlabel('Generation');
    legend('Fitness', 'Location', 'northwest');
    grid on;
end
