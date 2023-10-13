function [new_solution1, new_solution2] = crossover_one_point(solution1, solution2)
    % crossover at a random point
    index = 0;
    while true
        index = randi([1, length(solution1.list)],1);
        if index ~= 1 && index ~= length(solution1.list)
            break
        end
    end
    number_of_dummy = length(solution1.list) - length(solution1.cars);
    new_list1 = solution1.list(1:index);
    for i = 1:length(new_list1)
        if new_list1(i) == -1
            number_of_dummy = number_of_dummy - 1;
        end
    end
    for i = index:length(solution2.list)
        if ~ismember(solution2.list(i),new_list1) || (solution2.list(i) == -1 && number_of_dummy > 0)
            new_list1 = [new_list1, solution2.list(i)];
            if solution2.list(i) == -1
                number_of_dummy = number_of_dummy - 1;
            end
        end
    end
    for i = index:length(solution1.list)
        if ~ismember(solution1.list(i),new_list1) || (solution1.list(i) == -1 && number_of_dummy > 0)
            new_list1 = [new_list1, solution1.list(i)];
            if solution1.list(i) == -1
                number_of_dummy = number_of_dummy - 1;
            end
        end
    end

    number_of_dummy = length(solution1.list) - length(solution1.cars);
    new_list2 = solution2.list(1:index);
    for i = 1:length(new_list2)
        if new_list2(i) == -1
            number_of_dummy = number_of_dummy - 1;
        end
    end
    for i = index:length(solution1.list)
        if ~ismember(solution1.list(i),new_list2) || (solution1.list(i) == -1 && number_of_dummy > 0)
            new_list2 = [new_list2, solution1.list(i)];
            if solution1.list(i) == -1
                number_of_dummy = number_of_dummy - 1;
            end
        end
    end
    for i = index:length(solution2.list)
        if ~ismember(solution2.list(i),new_list2) || (solution2.list(i) == -1 && number_of_dummy > 0)
            new_list2 = [new_list2, solution2.list(i)];
            if solution2.list(i) == -1
                number_of_dummy = number_of_dummy - 1;
            end
        end
    end

    new_solution1 = solution(new_list1,solution1.parking_lot);
    new_solution2 = solution(new_list2,solution2.parking_lot);
end
