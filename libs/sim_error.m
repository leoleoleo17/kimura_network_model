N = 1000; % Number of bits
data = randi([0 1], N, 1); % Random binary data
modData = 2*data - 1; % BPSK modulation
snr = 5; % Define SNR in dB

receivedData = awgn(modData, snr, 'measured');
ae = receivedData;
ber = 0.9; % Bit error rate
errorMask = rand(N, 1) < ber;
receivedData(errorMask) = -receivedData(errorMask);
demodData = receivedData > 0; % BPSK demodulation
numErrors = sum(data ~= demodData);

fprintf('Number of Errors: %d\n', numErrors);
fprintf('BER: %f\n', numErrors/N);

