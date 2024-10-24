function totalEnergy = monitorEnergyUsage(awsServers)
    % Calculate total energy usage based on AWS server loads.


    loadFactor = 0.1;               % Cost per unit of CPU load in Watts
    activeServerFactor = 0.05;     
    
    totalLoad = sum(awsServers);                    
    activeServerCount = sum(awsServers > 0);     

    loadBasedEnergy = totalLoad * loadFactor;        % Energy consumption from CPU load (in Watts)
    activeServerEnergy = activeServerCount * activeServerFactor; % Additional energy for active servers (in Watts)

    totalEnergy = loadBasedEnergy + activeServerEnergy; % Total energy consumption in Watts (W)
end
