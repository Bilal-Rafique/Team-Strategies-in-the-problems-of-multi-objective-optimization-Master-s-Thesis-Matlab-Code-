classdef generation
    properties
        list_of_solutions;
    end

    methods
        function obj = generation(list_of_solutions)
            [~,sortIdx] = sort([list_of_solutions.fitness]);
            obj.list_of_solutions = list_of_solutions(sortIdx);
        end

        function str = print(obj)
            str = '';
            for i = 1:length(obj.list_of_solutions)
                str = sprintf('%s%s\n', str, obj.list_of_solutions(i).print());
            end
        end
    end
end
