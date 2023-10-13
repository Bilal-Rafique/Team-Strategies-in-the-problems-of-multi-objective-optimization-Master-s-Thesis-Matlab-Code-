function path = get_path(Xx,Xy)
    path = {};
    for i = 1:length(Xx)
        path{end+1} = Position(Xx(i), Xy(i));
    end
end