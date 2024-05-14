classdef Edge
    %Class used to model the conditions of an edge in the graph that
    %represents the medium for a message being sent in the network.

    properties
        ber %Bit error rate of the channel
        snr %Signal to noise ratio of the channel
        weight %Final weight of the edge in the network graph
    end

    methods
        function obj = Edge(ber, snr) %Cosntructor for class
            obj.ber = ber;
            obj.snr = snr;
            obj.weight = calcval(obj);
        end
        function w = calcval(obj)
            w = abs(obj.snr) + 1/(6+obj.ber);
        end
    end
end