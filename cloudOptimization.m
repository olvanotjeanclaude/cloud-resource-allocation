clear;
clc;

numTasks = 1000;      % Number of tasks to simulate
cpuThreshold = 0.7;  % CPU load threshold for scaling  % If a server's CPU load exceeds (above 30%), the server is considered overloaded.
numAwsServers = 7;   % Number of AWS servers

awsServers = initializeServers(numAwsServers);
tasks = generateTasks(numTasks, 1, 10);  


totalEnergyHistory = zeros(numTasks, 1);
serverLoadHistory = zeros(numTasks, numAwsServers);

% Task simulation 
for i = 1:numTasks
    task = tasks(i, :);  % Get the task (CPU demand, priority)
    
    awsServers = allocateTask(task, awsServers); 
    
    awsServers = autoScaleServers(awsServers, cpuThreshold); 
    
    totalEnergy = monitorEnergyUsage(awsServers);  
    
    totalEnergyHistory(i) = totalEnergy;
    serverLoadHistory(i, :) = awsServers;  %

    fprintf('Task %d allocated. Total energy: %.2f Watts\n', i, totalEnergy);
end

disp('Cloud optimization simulation completed.');

% Visualization
figure;

% Plot total energy consumption over time
subplot(2, 1, 1);
plot(totalEnergyHistory, 'LineWidth', 2);
title('Total Energy Consumption Over Time');
xlabel('Task Index');
ylabel('Energy (Watts)');
grid on;

% Plot server loads at the end of the simulation
subplot(2, 1, 2);
bar(serverLoadHistory(end, :));
title('Server Load Distribution at the End of Simulation');
xlabel('AWS Server Index');
ylabel('CPU Load (Arbitrary Units)');
grid on;

% Create legend entries based on the number of servers
legendEntries = arrayfun(@(x) sprintf('Server %d', x), 1:numAwsServers, 'UniformOutput', false);
legend(legendEntries);  % Create legend entries
