function [waveform] = waveform_ass(powerBudget, channel)
    % Function:
    %   - optimize the amplitude and phase of transmit multisine waveform
    %
    % InputArg(s):
    %   - powerBudget [P]: transmit power constraint
    %   - channel [h_{q, n}] (nTxs * nSubbands): channel frequency response at each subband
    %
    % OutputArg(s):
    %   - waveform [\boldsymbol{s}_n] (nTxs * nSubbands): complex waveform weights for each transmit antenna and subband
    %
    % Comment(s):
    %   - for single-user MISO systems
    %   - allocate all power to the strongest subband
    %   - optimal for linear harvester model
    %
    % Reference(s):
    %   - B. Clerckx and E. Bayguzina, "Waveform Design for Wireless Power Transfer," IEEE Transactions on Signal Processing, vol. 64, no. 23, pp. 6313–6328, Jan. 2016.
    %
    % Author & Date: Yang (i@snowztail.com) - 08 Mar 20


    % \boldsymbol{p}
    frequencyWeight = sqrt(powerBudget) * (max(vecnorm(channel, 2, 1)) == vecnorm(channel, 2, 1))';
    % \boldsymbol{\tilde{s}_n}
    spatialPrecoder = conj(channel) ./ vecnorm(channel, 2, 1);
    % \boldsymbol{s_n}
    waveform = frequencyWeight.' .* spatialPrecoder;

end
