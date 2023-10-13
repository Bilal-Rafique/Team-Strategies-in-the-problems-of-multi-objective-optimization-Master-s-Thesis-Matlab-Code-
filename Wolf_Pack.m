classdef Wolf_Pack < handle
    properties
        wolves
        alpha
        beta
        delta
    end
    methods
        function obj = Wolf_Pack(wolves)
            [~,sortIndex] = sort(cellfun(@(w) w.fitness, wolves));
            obj.wolves = wolves(sortIndex);
            obj.alpha = obj.wolves{1};
            obj.beta = obj.wolves{2};
            obj.delta = obj.wolves{3};
        end
    end
end
