function fitness = calculate_fitness(path)
    fitness = 0;
    for i = 1:length(path)-1
        fitness = fitness + sqrt((path{i}.x-path{i+1}.x)^2+(path{i}.y-path{i+1}.y)^2);
    end
end
