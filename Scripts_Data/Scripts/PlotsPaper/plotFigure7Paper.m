%% This script creates the Figure 7 of the paper
% Description: This script creates the figures for figure 7 of the paper
%              For this case the number of passengers was stepwise
%              increased from 1 to 5 while the cabin stepoint temperature was left
%              constant to 22°C. 
%              THIS SCRIPT LOADS AND USES SAVED SIMULATION DATA
%-----------------
% Copyright 2022-2023 The MathWorks, Inc.
%-----------------

%% Implementation
%% 1) Load simulation results

% This variable can be generated by calling the script sensitivityPassCount
if ~exist('passNumbEn','var')
    error('Create the results required for the plot by running the script sensitivityPassCount.m')
end

% The simulation results from sensitivityPassCount.m will give the same
% results as in the paper provided you did not change the model

% Assemble location for saving figure
temp_thisFolder     =  fileparts(which(mfilename));
figFolder = [temp_thisFolder filesep 'Figures'];
if(~isfolder(figFolder))
    mkdir(figFolder)
end

%% 2) Plot the figures
% First plot the configuration with 1 passenger
plotEnergySankey(passNumbEn(1));

set(gcf,'Units','centimeters','Position',[1,1,10,10])
set(gca,'Position',[0,0,1,1]);
print(gcf,[figFolder filesep 'Sankey1P'],'-djpeg','-r300')

% Then plot the configuration with 5 passengers
plotEnergySankey(passNumbEn(end));

set(gcf,'Units','centimeters','Position',[1,1,10,10])
set(gca,'Position',[0,0,1,1]);

% Save
print(gcf,[figFolder filesep 'Sankey5P'],'-djpeg','-r300')