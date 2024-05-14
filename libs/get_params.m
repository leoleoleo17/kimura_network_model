function [alpha, beta]= get_params(edge, N, len)
    %Function to calculate the parameters for the Kimura model for a given
    %edge of the graph
    %N is the number of iterations for the Monte Carlo method
    %len the length of the test message
    %edge is the channel to be simulated
    alphas = zeros(N,1);
    betas = zeros(N,1);
    for i = 1:N
        as = 0;
        bs = 0;
        data = randi([0 1], len, 1);
        a = sim_send_message(edge,data);
        for ii = 1:len
            if data(ii) == 1
                as = as + (data(ii) ~= a(ii));
            else
                bs = bs + (data(ii) ~= a(ii));
            end
        end
        alphas(i) = as/len;
        betas(i) = bs/len;
    end
    alpha = sum(alphas)/N;
    beta = sum(betas)/N;
end