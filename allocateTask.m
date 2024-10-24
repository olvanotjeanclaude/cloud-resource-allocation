function awsServers = allocateTask(task, awsServers)
    % Allocate task to AWS server with the least load
    cpuDemand = task(1);
    priority = task(2);
    
    if priority == 1
        % High priority: Allocate to least loaded server
        [~, idx] = min(awsServers);
        awsServers(idx) = awsServers(idx) + cpuDemand;
        fprintf('High-priority task allocated to AWS Server %d. New load: %.2f\n', idx, awsServers(idx));
        
    elseif priority == 2
        % Medium priority: Allocate to a random server
        idx = randi(length(awsServers));
        awsServers(idx) = awsServers(idx) + cpuDemand;
        fprintf('Medium-priority task allocated to AWS Server %d. New load: %.2f\n', idx, awsServers(idx));
        
    else
        % Low priority: Allocate to the most loaded server as a cost-saving measure
        [~, idx] = max(awsServers);
        awsServers(idx) = awsServers(idx) + cpuDemand;
        fprintf('Low-priority task allocated to AWS Server %d. New load: %.2f\n', idx, awsServers(idx));
    end
end
