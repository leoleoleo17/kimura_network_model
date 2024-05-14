function [w] = weight_kimura(e)
    %Function that calculates the weight of the edge based on the kimura
    %model
    [alpha, beta] = get_params(e,100,1000);
    [P,Q,R] = sim_kimura_3(alpha,beta, beta,1);
    w = P+Q;
end