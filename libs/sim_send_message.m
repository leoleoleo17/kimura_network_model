function m = sim_send_message(edge, msg)
    %Function that receives a binary message and sends it through the
    %channel with parameters in edge.
    N = size(msg,1);
    m_data = 2*msg - 1;
    e_data = awgn(m_data, edge.snr, "measured"); %Add white gaussian noise to msg sent
    errorMask = rand(N,1) < edge.ber;
    e_data(errorMask) = -e_data(errorMask);
    m = e_data > 0;
end