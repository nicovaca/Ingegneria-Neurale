
clear all
clc
close all


% LAUNCH EEGLAB %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
cd '/Users/nicolavacalebre/Desktop/Principi Ingegneria Neurale/eeglab2022.1/eeglab2022.1';
eeglab
close all;

%CREO CARTELLA PER IL SINGOLO SOGGETTO
cd('/Users/nicolavacalebre/Desktop/NewDataset2');
if ~exist('S1_FILTERING', 'dir')
    mkdir S1_FILTERING;
end

% CREO LE CARTELLE PER SALVARE I NUOVI FILE %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
cd('/Users/nicolavacalebre/Desktop/NewDataset2/S1_FILTERING');
if ~exist('1-RH', 'dir')
    mkdir 1-RH_FILTERING;
end
if ~exist('2-LH', 'dir')
    mkdir 2-LH_FILTERING;
end
if ~exist('3-UP', 'dir')
    mkdir 3-UP_FILTERING;
end
if ~exist('4-DOWN', 'dir')
    mkdir 4-DOWN_FILTERING;
end


% CARICO IL WORKSPACE %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% radice_nome_file1='/Users/nicolavacalebre/Desktop/S1/1-RH/S1_Session_';
% radice_nome_file2='/Users/nicolavacalebre/Desktop/S1/2-LH/S1_Session_';
% radice_nome_file3='/Users/nicolavacalebre/Desktop/S1/3-UP/S1_Session_';
% radice_nome_file4='/Users/nicolavacalebre/Desktop/S1/4-DOWN/S1_Session_';

% partemedia_file='_EEG';
% suffisso_file='.mat';
%suffisso_file='_filtrata.mat';

location_file = '/Users/nicolavacalebre/Desktop/Principi Ingegneria Neurale/channelref.ced';

%fs=512 %Hz




% explore the variables in the workspace
% explore the locfile
percorso_preproc1='/Users/nicolavacalebre/Desktop/NewDataset2/S1_FILTERING/1-RH_FILTERING/S1_Session_';
percorso_preproc2='/Users/nicolavacalebre/Desktop/NewDataset2/S1_FILTERING/2-LH_FILTERING/S1_Session_';
percorso_preproc3='/Users/nicolavacalebre/Desktop/NewDataset2/S1_FILTERING/3-UP_FILTERING/S1_Session_';
percorso_preproc4='/Users/nicolavacalebre/Desktop/NewDataset2/S1_FILTERING/4-DOWN_FILTERING/S1_Session_';
partemedia_file='_EEG';
suffisso_file='_filtrata.mat';
%%Frequenza di campionamento
fs=1000; %Hz


%Salvo per percorso 1-RIGHT
for i=1:11
    
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % Subject code (stringa che identifica il codice del soggetto)
    sub=i; % soggetto 1
    
    subject=(num2str(sub));
    
    
    num_trials=450;
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % LA PROCEDURA VA RIPETUTA PER OGNI CLASSE
    for cont=1:num_trials     % current trial
        
        
        file_name=[radice_nome_file1 num2str(i) partemedia_file num2str(cont) suffisso_file];
        if exist(file_name, 'file')
            importdata(file_name);
            
            
            finestra_EEG_01_2=ans;
            %%%%%%%%FILTERING:
            f1=0.5; %Hz     %Onde alpha e beta
            f2=40;  %Hz
            
            for j=1:size(finestra_EEG_01_2,1)
                
                finestra_EEG_F(j,:)=bandpass_filtering_FFT(finestra_EEG_01_2(j,:),fs,f1,f2);
                
                
            end
            
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            
            %salvo il dato cioè la nuova finestra.
            nuovafinestra=([subject '_EEG' num2str(cont) '_filtrata' '.mat']);
            %salvo il dato cioè la finestra pre-processata. Ho quindi un nuovo dataset con i dati
            
            save([percorso_preproc1 nuovafinestra],'finestra_EEG_F');
            %save([percorso_preproc   subject '_MI\RH\Trial_' num2str(cont) '.mat'],'finestra_EEG');
            
            clear('finestra_EEG_01_2');
        end
        
    end
    
end


%Salvo per percorso 2-LEFT
for i=1:11
    
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % Subject code (stringa che identifica il codice del soggetto)
    sub=i; % soggetto 1
    
    subject=(num2str(sub));
    
    
    num_trials=450;
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % LA PROCEDURA VA RIPETUTA PER OGNI CLASSE
    for cont=1:num_trials     % current trial
        
        
        file_name=[radice_nome_file2 num2str(i) partemedia_file num2str(cont) suffisso_file];
        if exist(file_name, 'file')
            importdata(file_name);
            
            
            finestra_EEG_01_2=ans;
            %%%%%%%%FILTERING:
            f1=0.5; %Hz     %Onde alpha e beta
            f2=40;  %Hz
            
            for j=1:size(finestra_EEG_01_2,1)
                
                finestra_EEG_F(j,:)=bandpass_filtering_FFT(finestra_EEG_01_2(j,:),fs,f1,f2);
                
                
            end
            
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            
            %salvo il dato cioè la nuova finestra.
            nuovafinestra=([subject '_EEG' num2str(cont) '_filtrata' '.mat']);
            %salvo il dato cioè la finestra pre-processata. Ho quindi un nuovo dataset con i dati
            
            save([percorso_preproc2 nuovafinestra],'finestra_EEG_F');
            %save([percorso_preproc   subject '_MI\RH\Trial_' num2str(cont) '.mat'],'finestra_EEG');
            
            clear('finestra_EEG_01_2');
        end
        
    end
    
end


%Salvo per percorso 3-UP
for i=1:11
    
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % Subject code (stringa che identifica il codice del soggetto)
    sub=i; % soggetto 1
    
    subject=(num2str(sub));
    
    
    num_trials=450;
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % LA PROCEDURA VA RIPETUTA PER OGNI CLASSE
    for cont=1:num_trials     % current trial
        
        
        file_name=[radice_nome_file3 num2str(i) partemedia_file num2str(cont) suffisso_file];
        if exist(file_name, 'file')
            importdata(file_name);
            
            
            finestra_EEG_01_2=ans;
            %%%%%%%%FILTERING:
            f1=0.5; %Hz     %Onde alpha e beta
            f2=40;  %Hz
            
            for j=1:size(finestra_EEG_01_2,1)
                
                finestra_EEG_F(j,:)=bandpass_filtering_FFT(finestra_EEG_01_2(j,:),fs,f1,f2);
                
                
            end
            
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            
            %salvo il dato cioè la nuova finestra.
            nuovafinestra=([subject '_EEG' num2str(cont) '_filtrata' '.mat']);
            %salvo il dato cioè la finestra pre-processata. Ho quindi un nuovo dataset con i dati
            
            save([percorso_preproc3 nuovafinestra],'finestra_EEG_F');
            %save([percorso_preproc   subject '_MI\RH\Trial_' num2str(cont) '.mat'],'finestra_EEG');
            
            clear('finestra_EEG_01_2');
        end
        
    end
    
end


%Salvo per percorso 4-DOWN
for i=1:11
    
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % Subject code (stringa che identifica il codice del soggetto)
    sub=i; % soggetto 1
    
    subject=(num2str(sub));
    
    
    num_trials=450;
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % LA PROCEDURA VA RIPETUTA PER OGNI CLASSE
    for cont=1:num_trials     % current trial
        
        
        file_name=[radice_nome_file4 num2str(i) partemedia_file num2str(cont) suffisso_file];
        if exist(file_name, 'file')
            importdata(file_name);
            
            
            finestra_EEG_01_2=ans;
            %%%%%%%%FILTERING:
            f1=0.5; %Hz     %Onde alpha e beta
            f2=40;  %Hz
            
            for j=1:size(finestra_EEG_01_2,1)
                
                finestra_EEG_F(j,:)=bandpass_filtering_FFT(finestra_EEG_01_2(j,:),fs,f1,f2);
                
                
            end
            
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            
            %salvo il dato cioè la nuova finestra.
            nuovafinestra=([subject '_EEG' num2str(cont) '_filtrata' '.mat']);
            %salvo il dato cioè la finestra pre-processata. Ho quindi un nuovo dataset con i dati
            
            save([percorso_preproc4 nuovafinestra],'finestra_EEG_F');
            %save([percorso_preproc   subject '_MI\RH\Trial_' num2str(cont) '.mat'],'finestra_EEG');
            
            clear('finestra_EEG_01_2');
        end
        
    end
    
end


% %%%%%%%%%%%%%%%%%%%%PLOTTING%%%%%%%%%%%%%%%%%%%
%     finestra_EEG_03=finestra_EEG_F;
%     eegplot(finestra_EEG_03,'srate',fs ,'eloc_file',location_file,'winlength',1); % function from EEGLAB
%
%
%     for j=1:2 % size(finestra_EEG_01_2,2)
%
%         figure(j)
%         %topoplot( finestra_EEG_03(:,j),location_file);
%         topoplot(finestra_EEG_01_2(:,j),location_file);
%         hold on;
%         %title(['Topoplot from time' num2str(BCI.time{1,j}(1,4000)) 'ms to time' num2str(BCI.time{1,j}(1,5000)) 'ms'])
%     end
