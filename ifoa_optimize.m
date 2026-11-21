function [bestKp, bestKi, bestLambda, bestIAE, fitness_curve] = ifoa_optimize()

    % Parameters
    n_foxes = 10;
    max_iter = 50;
    lb = [0.1, 0.1, 0.1];  % Lower bounds for Kp, Ki, Lambda
    ub = [10, 10, 2];      % Upper bounds

    % Initialize foxes
    foxes = lb + rand(n_foxes, 3) .* (ub - lb);
    fitness = zeros(n_foxes, 1);
    fitness_curve = zeros(max_iter, 1);

    for iter = 1:max_iter
        for i = 1:n_foxes
            fitness(i) = evaluate_fopi(foxes(i, :));
        end

        [best_IAE, idx] = min(fitness);
        best_fox = foxes(idx, :);

        % Save current best IAE for plotting
        fitness_curve(iter) = best_IAE;

        % Fox movement (random update example)
        for i = 1:n_foxes
            foxes(i, :) = best_fox + 0.2 * (rand(1, 3) - 0.5);
            foxes(i, :) = max(min(foxes(i, :), ub), lb);
        end
    end

    % Final results
    bestKp = best_fox(1);
    bestKi = best_fox(2);
    bestLambda = best_fox(3);
    bestIAE = best_IAE;

    % Plot the fitness graph
    figure;
    plot(1:max_iter, fitness_curve, '-o', 'LineWidth', 2);
    grid on;
    title('Fitness Curve - IAE vs Iteration');
    xlabel('Iteration');
    ylabel('IAE');
end
