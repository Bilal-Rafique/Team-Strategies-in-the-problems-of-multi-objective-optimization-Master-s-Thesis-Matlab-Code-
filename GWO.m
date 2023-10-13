function path = GWO(lot, slot, obstacles, wolf_pack_size, number_of_iterations, step_size, a0)
    path = {Position(slot.parked_car.position.x, slot.parked_car.position.y), Position(slot.position.x, slot.position.y)};
    if is_feasible(path, obstacles)
        fprintf('feasible\n');
        return;
    end
    w = generate_random_wolf_pack(lot, slot, wolf_pack_size, step_size);
    fitnesses = [];
    for i = 1:number_of_iterations
        a = a0 - i * (a0 / number_of_iterations);
        r_vector = generate_r_vector(step_size);
        A = 2 * a * r_vector - a;
        C = 2 * r_vector;
        wolves = {w.wolves{1}, w.wolves{2}, w.wolves{3}};
        fitnesses = [fitnesses, w.wolves{1}.fitness];
        for j = 4:wolf_pack_size
            first = true;
            while first
                X = w.wolves{j};
                D1x=C .* w.alpha.Xs - X.Xs;
                D1y=C .* w.alpha.Ys - X.Ys;
                D2x=C .* w.beta.Xs - X.Xs;
                D2y=C .* w.beta.Ys - X.Ys;
                D3x=C .* w.delta.Xs - X.Xs;
                D3y=C .* w.delta.Ys - X.Ys;
                A_abs=calculate_det(A);
                if A_abs <1 
                    X1x=w.alpha.Xs-A_abs*D1x;
                    X1y=w.alpha.Ys-A_abs*D1y;
                    X2x=w.beta.Xs-A_abs*D2x;
                    X2y=w.beta.Ys-A_abs*D2y;
                    X3x=w.delta.Xs-A_abs*D3x;
                    X3y=w.delta.Ys-A_abs*D3y;
                else 
                    X1x=w.alpha.Xs+A_abs*D1x;
                    X1y=w.alpha.Ys+A_abs*D1y;
                    X2x=w.beta.Xs+A_abs*D2x;
                    X2y=w.beta.Ys+A_abs*D2y;
                    X3x=w.delta.Xs+A_abs*D3x;
                    X3y=w.delta.Ys+A_abs*D3y;
                end
                Xx=X1x(2:length(X1x)-1)+X2x(2:length(X2x)-1)+X3x(2:length(X3x)-1);
                Xy=X1y(2:length(X1y)-1)+X2y(2:length(X2x)-1)+X3y(2:length(X3x)-1);
                Xx=Xx/3;
                Xy=Xy/3;
                p=get_path(Xx,Xy);
                p={slot.parked_car.position, p{:}, slot.position};
                f=calculate_fitness(p);
                if is_feasible(p, obstacles)
                    wolves{end+1} = Wolf(p, f);
                    first = false;
                else
                    r_vector = generate_r_vector(step_size);
                    A = 2 * a * r_vector - a;
                    C = 2 * r_vector;
                end
            end
        end
        w = Wolf_Pack(wolves);
        fitnesses = [fitnesses, w.wolves{1}.fitness];
        fprintf('iteration: %d, fitness: %f\n', i, w.wolves{1}.fitness);
    end
    plot_fitness_slot(fitnesses, slot.id, number_of_iterations);
    path = w.alpha.path;
end