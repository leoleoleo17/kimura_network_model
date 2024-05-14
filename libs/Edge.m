classdef Edge
    %Class used to model the conditions of an edge in the graph that
    %represents the medium for a message being sent in the network.

    properties
        bn %Id of start node
        endn %Id of end node
        ber %Bit error rate of the channel
        snr %Signal to noise ratio of the channel
        weight %Final weight of the edge in the network graph
    end

    methods
        function obj = Edge(bn, en, ber, snr) %Cosntructor for class
            obj.bn = bn;
            obj.ber = ber;
            obj.endn = en;
            obj.snr = snr;
            obj.weight = calcval(obj);
        end
        function w = calcval(obj)
            w = abs(obj.snr) + 1/(6+obj.ber);
        end
    end
end