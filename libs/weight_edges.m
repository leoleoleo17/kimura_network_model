function [G_r, G_mod] = weight_edges(s,t)
    %Function that receives the edges of the graph and weights the full
    %graph according to the channel error simulation and the kimura 3 parameter
    %model
    %G_r is the real weighted graph
    %G_mod is the weighted graph according to the kimura model
    G_r = graph(s,t);
    G_mod = graph(s,t);
    l = numedges(G_r);
    w_r= zeros(1,l);
    w_mod = zeros(1,l);
    for i = 1:l
        bn = s(i);
        endn = t(i);
        %Get snr and ber
        snr = unifrnd(-5,5);
        ber = unifrnd(0,1);
        e = Edge(ber,snr);

        %Weight of real graph
        w_r(i) = e.weight;
        %Weight according to the kimura model
        w_mod(i) = weight_kimura(e);
    end
    G_r.Edges.Weight = w_r';
    G_mod.Edges.Weight = w_mod';
end