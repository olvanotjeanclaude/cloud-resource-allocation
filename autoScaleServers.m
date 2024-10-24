function awsServers = autoScaleServers(awsServers, cpuThreshold)
    % Scale servers down if above CPU threshold
    for i = 1:length(awsServers)
        if awsServers(i) > cpuThreshold
            awsServers(i) = awsServers(i) * 0.5;  % Simulate scaling down
            fprintf('AWS Server %d scaled down. New load: %.2f\n', i, awsServers(i));
        elseif awsServers(i) < cpuThreshold * 0.2
            % Simulate scaling up when the server is underutilized
            awsServers(i) = awsServers(i) * 1.2;
            fprintf('AWS Server %d scaled up. New load: %.2f\n', i, awsServers(i));
        end
    end
end
