clear all
clc
close all


% LAUNCH EEGLAB %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
cd '/Users/nicolavacalebre/Desktop/Principi Ingegneria Neurale/eeglab2022.1/eeglab2022.1';
eeglab
close all;

%CREO CARTELLA PER IL SINGOLO SOGGETTO
cd('/Users/nicolavacalebre/Desktop/NewDataset2');
if ~exist('S1_LAPL', 'dir')
mkdir S1_LAPL;
end

% CREO LE CARTELLE PER SALVARE I NUOVI FILE %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
cd('/Users/nicolavacalebre/Desktop/NewDataset2/S1_LAPL');
if ~exist('1-RH', 'dir')
    mkdir 1-RH;
end
if ~exist('2-LH', 'dir')
    mkdir 2-LH;
end
if ~exist('3-UP', 'dir')
    mkdir 3-UP;
end
if ~exist('4-DOWN', 'dir')
    mkdir 4-DOWN;
end

% CARICO IL WORKSPACE %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
radice_nome_file1='/Users/nicolavacalebre/Desktop/NewDataset2/S1_RESAMPLING/1-RH/S1_Session_';
radice_nome_file2='/Users/nicolavacalebre/Desktop/NewDataset2/S1_RESAMPLING/2-LH/S1_Session_';
radice_nome_file3='/Users/nicolavacalebre/Desktop/NewDataset2/S1_RESAMPLING/3-UP/S1_Session_';
radice_nome_file4='/Users/nicolavacalebre/Desktop/NewDataset2/S1_RESAMPLING/4-DOWN/S1_Session_';
partemedia_file='_EEG';
suffisso_file='.mat';
location_file = '/Users/nicolavacalebre/Desktop/Principi Ingegneria Neurale/channelref.ced';

% explore the variables in the workspace
% explore the locfile
percorso_preproc1='/Users/nicolavacalebre/Desktop/NewDataset2/S1_LAPL/1-RH/S1_Session_';
percorso_preproc2='/Users/nicolavacalebre/Desktop/NewDataset2/S1_LAPL/2-LH/S1_Session_';
percorso_preproc3='/Users/nicolavacalebre/Desktop/NewDataset2/S1_LAPL/3-UP/S1_Session_';
percorso_preproc4='/Users/nicolavacalebre/Desktop/NewDataset2/S1_LAPL/4-DOWN/S1_Session_';


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
        
        %%Frequenza di campionamento
        fs=512;
        
        file_name=[radice_nome_file1 num2str(i) partemedia_file num2str(cont) suffisso_file];
        if exist(file_name, 'file')
            importdata(file_name);
            
            
            finestra_EEG_01_2=ans;
            
            %%%%%%%%%%%%%%%%LAPLACIAN%%%%%%%%%%%%%%%%%%%%%%%%
            finestra_EEG_lap=laplacian_EEG_Schalk(finestra_EEG_01_2);
            
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            
            %salvo il dato cioè la nuova finestra.
            nuovafinestra=([subject '_EEG' num2str(cont) '.mat']);
            %salvo il dato cioè la finestra pre-processata. Ho quindi un nuovo dataset con i dati
            
            save([percorso_preproc1 nuovafinestra],'finestra_EEG_lap');
            
            
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
        
        %%Frequenza di campionamento
        fs=512;
        
        file_name=[radice_nome_file2 num2str(i) partemedia_file num2str(cont) suffisso_file];
        if exist(file_name, 'file')
            importdata(file_name);
            
            
            finestra_EEG_01_2=ans;
            
            %%%%%%%%%%%%%%%%LAPLACIAN%%%%%%%%%%%%%%%%%%%%%%%%
            finestra_EEG_lap=laplacian_EEG_Schalk(finestra_EEG_01_2);
            
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            
            %salvo il dato cioè la nuova finestra.
            nuovafinestra=([subject '_EEG' num2str(cont) '.mat']);
            %salvo il dato cioè la finestra pre-processata. Ho quindi un nuovo dataset con i dati
            
            save([percorso_preproc2 nuovafinestra],'finestra_EEG_lap');
            
            
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
        
        %%Frequenza di campionamento
        fs=512;
        
        file_name=[radice_nome_file3 num2str(i) partemedia_file num2str(cont) suffisso_file];
        if exist(file_name, 'file')
            importdata(file_name);
            
            
            finestra_EEG_01_2=ans;
            
            %%%%%%%%%%%%%%%%LAPLACIAN%%%%%%%%%%%%%%%%%%%%%%%%
            finestra_EEG_lap=laplacian_EEG_Schalk(finestra_EEG_01_2);
            
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            
            %salvo il dato cioè la nuova finestra.
            nuovafinestra=([subject '_EEG' num2str(cont) '.mat']);
            %salvo il dato cioè la finestra pre-processata. Ho quindi un nuovo dataset con i dati
            
            save([percorso_preproc3 nuovafinestra],'finestra_EEG_lap');
            
            
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
        
        %%Frequenza di campionamento
        fs=512;
        
        file_name=[radice_nome_file4 num2str(i) partemedia_file num2str(cont) suffisso_file];
        if exist(file_name, 'file')
            importdata(file_name);
            
            
            finestra_EEG_01_2=ans;
            
            %%%%%%%%%%%%%%%%LAPLACIAN%%%%%%%%%%%%%%%%%%%%%%%%
            finestra_EEG_lap=laplacian_EEG_Schalk(finestra_EEG_01_2);
            
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            
            %salvo il dato cioè la nuova finestra.
            nuovafinestra=([subject '_EEG' num2str(cont) '.mat']);
            %salvo il dato cioè la finestra pre-processata. Ho quindi un nuovo dataset con i dati
            
            save([percorso_preproc4 nuovafinestra],'finestra_EEG_lap');
            
            
            clear('finestra_EEG_01_2');
        end
        
    end
    
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
plot_resampling =0; % se si vuole effttuare il plot
if (plot_resampling==1)
    %Plotting
    fs=512;
    eegplot(finestra_EEG_lap,'srate',fs ,'eloc_file',location_file,'winlength',1); % function from EEGLAB
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%