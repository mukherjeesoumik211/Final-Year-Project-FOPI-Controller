clc;
clear;

[bestKp, bestKi, bestLambda, bestIAE] = ifoa_optimize();

fprintf('\n--- Final Optimized Results ---\n');
fprintf('Best Kp: %.4f\n', bestKp);
fprintf('Best Ki: %.4f\n', bestKi);
fprintf('Best Lambda: %.4f\n', bestLambda);
fprintf('Best IAE: %.4f\n', bestIAE);
