function tasks = generateTasks(numTasks, minCpuDemand, maxCpuDemand)
    if numTasks <= 0
        error('Number of tasks must be a positive integer.');
    end
    
    if minCpuDemand < 0 || maxCpuDemand <= minCpuDemand
        error('Invalid CPU demand range: ensure minCpuDemand is non-negative and less than maxCpuDemand.');
    end

    % Generate a matrix of tasks
    % First column: CPU demand, Second column: Priority (1: high, 2: medium, 3: low)
    tasks = [randi([minCpuDemand, maxCpuDemand], numTasks, 1), randi([1, 3], numTasks, 1)];
    
    disp('Generated Tasks (CPU Demand | Priority):');
    disp(tasks);
end
