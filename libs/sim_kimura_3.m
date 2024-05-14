function [P, Q, R] = sim_kimura_3(alpha, beta, gamma, t)
    % Function that calculates the value of the K3M at a time t with
    % parameters alpha, beta, gamma

    %The simulation employs the analytical solution given by Kimura in his
    %original paper

    lambda1 = -4*(alpha + beta);
    lambda2 = -4*(alpha + gamma);
    lambda3 = -4*(beta + gamma);
    
    e1 = exp(lambda1*t);
    e2 = exp(lambda2*t);
    e3 = exp(lambda3*t);

    P = (1-e1-e2+e3)/4;
    Q = (1-e1+e2-e3)/4;
    R = (1+e1-e2-e3)/4;
end