%% Transceiver
eirp = db2pow(36 - 30);
nTxs = 20;
powerBudget = eirp / nTxs;
%% Channel
centerFrequency = 2.4e9;
bandwidth = 1e7;
nSubbands = 10;
carrierFrequency = centerFrequency - bandwidth * (1 - 1 / nSubbands) / 2: bandwidth / nSubbands: centerFrequency + bandwidth * (1 - 1 / nSubbands) / 2;
distance = 20;
pathlossExponent = 2;
pathloss = db2pow(60.046 + 10 * pathlossExponent * log10(distance / 10));
nRealizations = 1;
fadingType = 'selective';
%% Harvester
% assumptions: antenna impedance = 50 ohms, ideality factor = 1, thermal voltage = 25.85 mV
beta2 = 9.6712e2;
beta4 = 6.0304e6;
tolerance = 1e-6;
%% User
nUsers = 2;
%% Variables
nWeights = 40;
Variable.weight = [ones(nWeights, 1), 10 .^ ([-3, -1 : 2 / (nWeights - 3) : 1, 3])'];