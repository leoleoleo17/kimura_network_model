function [val] = test_graph(s,t, N)
    %Function that takes in a graph architecture and tests the performance
    %of error prediction for the kimura 3 parameter model
    val = 0;
    for i = 1:N
        [G_r,G_mod] = weight_edges(s,t);
        val = val + eval_performance(G_r, G_mod);
        fprintf('Iteration: %d\n',i)
    end
    val = val/N;
end