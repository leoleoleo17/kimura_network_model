function val =eval_performance(G_r, G_mod)
    %Compare the least error prone path from a to b in both graphs and
    %determine how similar they are
    s = G_r.Edges{1,1}(1);
    t = G_r.Edges{end,1}(2);
    Pr = shortestpath(G_r,s,t);
    Pmod = shortestpath(G_mod,s,t);
    if length(Pr) == length(Pmod)
        val = (sum(Pr==Pmod)/length(Pmod)) -0.4;
    else
        val = 0;
    end
    
end