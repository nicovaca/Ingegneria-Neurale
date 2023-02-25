clear all
clc
close all


% LAUNCH EEGLAB %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
cd '/Users/nicolavacalebre/Desktop/Principi Ingegneria Neurale/eeglab2022.1/eeglab2022.1';
eeglab
close all;

%CREATE FILE.ced FOR TOPOPLOT%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%chanlocs = struct('labels', [BCI.chaninfo.label, 'REF.']);
chanlocs = struct('labels', [BCI.chaninfo.label]);
pop_chanedit( chanlocs );
% location_file = chanlocs;
% chanlocs = EEG.chanlocs;


% LOAD THE WORKSPACE %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
load('/Users/nicolavacalebre/Desktop/Tesi/Dataset/S1_Session_4.mat');
%load('/Users/nicolavacalebre/Desktop/Soggetto1/S1_Session_1';
load('/Users/nicolavacalebre/Desktop/S1/1-RH/S1_Session_1');
% load('/Users/nicolavacalebre/Desktop/S1/2-LH/S1_Session_)';
% load('/Users/nicolavacalebre/Desktop/S1/3-UP/S1_Session_');
% load('/Users/nicolavacalebre/Desktop/S1/4-DOWN/S1_Session_)';
%load('/Users/nicolavacalebre/Desktop/NewDataset2/S1_FILTERING/1-RH_FILTERING/S1_Session_1_EEG2_filtrata.mat');
%load('/Users/nicolavacalebre/Desktop/NewDataset2/S1_FILTERING/2-LH_FILTERING/S1_Session_');
%load('/Users/nicolavacalebre/Desktop/NewDataset2/S1_FILTERING/3-UP_FILTERING/S1_Session_');
%load('/Users/nicolavacalebre/Desktop/NewDataset2/S1_FILTERING/4-DOWN_FILTERING/S1_Session_');
location_file = '/Users/nicolavacalebre/Desktop/Principi Ingegneria Neurale/channelref.ced';

% explore the variables in the workspace
% explore the locfile
finestra_EEG_01=BCI.data{1,2};

%TOPOPLOT%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%chanlocs = struct('labels', [BCI.chaninfo.label, 'REF.']);
chanlocs = struct('labels', [BCI.chaninfo.label]);
pop_chanedit( chanlocs );
%location_file = chanlocs;

%%%% EEGPLOT %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
eegplot(finestra_EEG_01,'srate',BCI.SRATE ,'eloc_file',location_file,'winlength',1); % function from EEGLAB

%Taglio dopo 4s
fs = BCI.SRATE;
finestra_EEG_01_1=finestra_EEG_01;
% finestra_EEG_01_1(:,round(0.1*fs):round(3.9*fs))=[];

finestra_EEG_01_1(:,round(0.001*fs):round(3.999*fs))=[];

finestra_EEG_01_2=finestra_EEG_01_1;
finestra_EEG_01_2(:,round(1*fs):end)=[];

eegplot(finestra_EEG_01_2,'srate',BCI.SRATE ,'eloc_file',location_file,'winlength',1); % function from EEGLAB


% TOPOPLOT 2D %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%topoplot(finestra_EEG_01(1,:),location_file);

for j=1:10 % size(finestra_EEG_01_2,2)
    
    figure(j)
    topoplot(finestra_EEG_01_2(:,j),location_file);
    title(['Topoplot from time' num2str(BCI.time{1,j}(1,4000)) 'ms to time' num2str(BCI.time{1,j}(1,5000)) 'ms'])
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for i=1:12
    
    subplot(3,4,i)
    xlabel ('Time(smaples)');
    ylabel('EEG (uV)');
    
    topoplot(finestra_EEG_01_2(:,i),location_file);
    
    
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% TIMTOPOPLOT %%%%Traccia un'epoca di dati e mappa la sua topografia del cuoio capelluto in determinati momenti%%%%%%%%%%%%%%%%%%%%%%%%
data = finestra_EEG_01_2;
%data=finestra_EEG_F;

a = max(max(data))
[Z, i] = max(max(data))
plottimes = [200, 500, 800,[Z, i]];
%timtopo(data,location_file);
timtopo(data,location_file,'plottimes',plottimes);
%title(['Plot from S' num2str(sum) 'session' num2str(i) 'EEG' num2str(cont)])