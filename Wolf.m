classdef Wolf < handle
    properties
        path
        fitness
        Xs
        Ys
    end
    methods
        function obj = Wolf(path, fitness)
            obj.path = path;
            obj.fitness = fitness;
            obj.Xs = cellfun(@(p) p.x, path);
            obj.Ys = cellfun(@(p) p.y, path);
        end
        function str = char(obj)
            str = num2str(obj.fitness);
        end
    end
end