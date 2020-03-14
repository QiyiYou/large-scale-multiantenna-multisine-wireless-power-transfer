%% Transceiver
eirp = db2pow(36 - 30);
%% Channel
centerFrequency = 2.4e9;
bandwidth = 1e7;
distance = 10;
pathlossExponent = 2;
pathloss = db2pow(60.046 + 10 * pathlossExponent * log10(distance / 10));
nRealizations = 2e2;
fadingType = 'selective';
%% Harvester
% assumptions: antenna impedance = 50 ohms, ideality factor = 1, thermal voltage = 25.85 mV
beta2 = 9.6712e2;
beta4 = 6.0304e6;
tolerance = 1e-3;
%% User
nUsers = 1;
weight = 1 : nUsers;
%% Variables
Variable.nTxs = [1 4 20];
Variable.nSubbands = 2 .^ (0 : 6);