clear all
clc
close all


% LAUNCH EEGLAB %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
cd '/Users/nicolavacalebre/Desktop/Principi Ingegneria Neurale/eeglab2022.1/eeglab2022.1';
eeglab
close all;

%CREO CARTELLA PER IL SINGOLO SOGGETTO
cd('/Users/nicolavacalebre/Desktop/NewDataset2');
if ~exist('S1_BC', 'dir')
mkdir S1_BC;
end

% CREO LE CARTELLE PER SALVARE I NUOVI FILE %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
cd('/Users/nicolavacalebre/Desktop/NewDataset2/S1_BC');
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
% radice_nome_file1='/Users/nicolavacalebre/Desktop/S1/1-RH/S1_Session_';
% radice_nome_file2='/Users/nicolavacalebre/Desktop/S1/2-LH/S1_Session_';
% radice_nome_file3='/Users/nicolavacalebre/Desktop/S1/3-UP/S1_Session_';
% radice_nome_file4='/Users/nicolavacalebre/Desktop/S1/4-DOWN/S1_Session_';
radice_nome_file1='/Users/nicolavacalebre/Desktop/NewDataset2/S1_FILTERING/1-RH_FILTERING/S1_Session_';
radice_nome_file2='/Users/nicolavacalebre/Desktop/NewDataset2/S1_FILTERING/2-LH_FILTERING/S1_Session_';
radice_nome_file3='/Users/nicolavacalebre/Desktop/NewDataset2/S1_FILTERING/3-UP_FILTERING/S1_Session_';
radice_nome_file4='/Users/nicolavacalebre/Desktop/NewDataset2/S1_FILTERING/4-DOWN_FILTERING/S1_Session_';
partemedia_file='_EEG';
suffisso_file='_filtrata.mat';
% suffisso_file='.mat';
location_file = '/Users/nicolavacalebre/Desktop/Principi Ingegneria Neurale/channelref.ced';

% explore the variables in the workspace
% explore the locfile
percorso_preproc1='/Users/nicolavacalebre/Desktop/NewDataset2/S1_BC/1-RH/S1_Session_';
percorso_preproc2='/Users/nicolavacalebre/Desktop/NewDataset2/S1_BC/2-LH/S1_Session_';
percorso_preproc3='/Users/nicolavacalebre/Desktop/NewDataset2/S1_BC/3-UP/S1_Session_';
percorso_preproc4='/Users/nicolavacalebre/Desktop/NewDataset2/S1_BC/4-DOWN/S1_Session_';


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
        
        %%Frequenza di campionamento
        fs=512;
        
        file_name=[radice_nome_file1 num2str(i) partemedia_file num2str(cont) suffisso_file];
        if exist(file_name, 'file')
            importdata(file_name);
            
            
            finestra_EEG_01_2=ans;
            
            %%%%%%%%%%%%%%%%BAD CHANNEL%%%%%%%%%%%%%%%%%%%%%%%%
            %Effettuo la cancellazione per ogni sessione
            if i==1
                eliminazione_badchannel(finestra_EEG_01_2,6);
                finestra_EEG_01_2_elchan=ans;
                
            %session2 non aveva noisechannel    
            elseif i==3
                eliminazione_badchannel(finestra_EEG_01_2,7);
                finestra_EEG_01_2_elchan=ans;
                eliminazione_badchannel(finestra_EEG_01_2_elchan,12);
                finestra_EEG_01_2_elchan=ans;
                
            elseif i==4
                eliminazione_badchannel(finestra_EEG_01_2,47);
                finestra_EEG_01_2_elchan=ans;
                
            elseif i==5
                eliminazione_badchannel(finestra_EEG_01_2,1);
                finestra_EEG_01_2_elchan=ans;
                eliminazione_badchannel(finestra_EEG_01_2_elchan,2);
                finestra_EEG_01_2_elchan=ans;
                eliminazione_badchannel(finestra_EEG_01_2_elchan,10);
                finestra_EEG_01_2_elchan=ans;
                eliminazione_badchannel(finestra_EEG_01_2_elchan,41);
                finestra_EEG_01_2_elchan=ans;
                
            elseif i==6
                eliminazione_badchannel(finestra_EEG_01_2,7);
                finestra_EEG_01_2_elchan=ans;
                eliminazione_badchannel(finestra_EEG_01_2_elchan,12);
                finestra_EEG_01_2_elchan=ans;
                
            elseif i==7
                eliminazione_badchannel(finestra_EEG_01_2,41);
                finestra_EEG_01_2_elchan=ans;
                
            elseif i==8
                eliminazione_badchannel(finestra_EEG_01_2,8);
                finestra_EEG_01_2_elchan=ans;
                eliminazione_badchannel(finestra_EEG_01_2_elchan,41);
                finestra_EEG_01_2_elchan=ans;
                eliminazione_badchannel(finestra_EEG_01_2_elchan,42);
                finestra_EEG_01_2_elchan=ans;
                
            elseif i==9
                eliminazione_badchannel(finestra_EEG_01_2,7);
                finestra_EEG_01_2_elchan=ans;
                eliminazione_badchannel(finestra_EEG_01_2_elchan,12);
                finestra_EEG_01_2_elchan=ans;
                
            elseif i==10
                eliminazione_badchannel(finestra_EEG_01_2,47);
                finestra_EEG_01_2_elchan=ans;
                eliminazione_badchannel(finestra_EEG_01_2_elchan,61);
                finestra_EEG_01_2_elchan=ans;
                
            elseif i==11
                eliminazione_badchannel(finestra_EEG_01_2,2);
                finestra_EEG_01_2_elchan=ans;
                eliminazione_badchannel(finestra_EEG_01_2_elchan,8);
                finestra_EEG_01_2_elchan=ans;
                eliminazione_badchannel(finestra_EEG_01_2_elchan,42);
                finestra_EEG_01_2_elchan=ans;
            end
            
            
            
            
            
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            
            %salvo il dato cioè la nuova finestra.
            nuovafinestra=([subject '_EEG' num2str(cont) '.mat']);
            %salvo il dato cioè la finestra pre-processata. Ho quindi un nuovo dataset con i dati
            
            save([percorso_preproc1 nuovafinestra],'finestra_EEG_01_2_elchan');
            
            
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
            
            %%%%%%%%%%%%%%%%BAD CHANNEL%%%%%%%%%%%%%%%%%%%%%%%%
            %Effettuo la cancellazione per ogni sessione
            if i==1
                eliminazione_badchannel(finestra_EEG_01_2,6);
                finestra_EEG_01_2_elchan=ans;
                
            %session2 non aveva noisechannel    
            elseif i==3
                eliminazione_badchannel(finestra_EEG_01_2,7);
                finestra_EEG_01_2_elchan=ans;
                eliminazione_badchannel(finestra_EEG_01_2_elchan,12);
                finestra_EEG_01_2_elchan=ans;
                
            elseif i==4
                eliminazione_badchannel(finestra_EEG_01_2,47);
                finestra_EEG_01_2_elchan=ans;
                
            elseif i==5
                eliminazione_badchannel(finestra_EEG_01_2,1);
                finestra_EEG_01_2_elchan=ans;
                eliminazione_badchannel(finestra_EEG_01_2_elchan,2);
                finestra_EEG_01_2_elchan=ans;
                eliminazione_badchannel(finestra_EEG_01_2_elchan,10);
                finestra_EEG_01_2_elchan=ans;
                eliminazione_badchannel(finestra_EEG_01_2_elchan,41);
                finestra_EEG_01_2_elchan=ans;
                
            elseif i==6
                eliminazione_badchannel(finestra_EEG_01_2,7);
                finestra_EEG_01_2_elchan=ans;
                eliminazione_badchannel(finestra_EEG_01_2_elchan,12);
                finestra_EEG_01_2_elchan=ans;
                
            elseif i==7
                eliminazione_badchannel(finestra_EEG_01_2,41);
                finestra_EEG_01_2_elchan=ans;
                
            elseif i==8
                eliminazione_badchannel(finestra_EEG_01_2,8);
                finestra_EEG_01_2_elchan=ans;
                eliminazione_badchannel(finestra_EEG_01_2_elchan,41);
                finestra_EEG_01_2_elchan=ans;
                eliminazione_badchannel(finestra_EEG_01_2_elchan,42);
                finestra_EEG_01_2_elchan=ans;
                
            elseif i==9
                eliminazione_badchannel(finestra_EEG_01_2,7);
                finestra_EEG_01_2_elchan=ans;
                eliminazione_badchannel(finestra_EEG_01_2_elchan,12);
                finestra_EEG_01_2_elchan=ans;
                
            elseif i==10
                eliminazione_badchannel(finestra_EEG_01_2,47);
                finestra_EEG_01_2_elchan=ans;
                eliminazione_badchannel(finestra_EEG_01_2_elchan,61);
                finestra_EEG_01_2_elchan=ans;
                
            elseif i==11
                eliminazione_badchannel(finestra_EEG_01_2,2);
                finestra_EEG_01_2_elchan=ans;
                eliminazione_badchannel(finestra_EEG_01_2_elchan,8);
                finestra_EEG_01_2_elchan=ans;
                eliminazione_badchannel(finestra_EEG_01_2_elchan,42);
                finestra_EEG_01_2_elchan=ans;
            end
            
            
            
            
            
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            
            %salvo il dato cioè la nuova finestra.
            nuovafinestra=([subject '_EEG' num2str(cont) '.mat']);
            %salvo il dato cioè la finestra pre-processata. Ho quindi un nuovo dataset con i dati
            
            save([percorso_preproc2 nuovafinestra],'finestra_EEG_01_2_elchan');
            
            
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
            
            %%%%%%%%%%%%%%%%BAD CHANNEL%%%%%%%%%%%%%%%%%%%%%%%%
            %Effettuo la cancellazione per ogni sessione
            if i==1
                eliminazione_badchannel(finestra_EEG_01_2,6);
                finestra_EEG_01_2_elchan=ans;
                
            %session2 non aveva noisechannel    
            elseif i==3
                eliminazione_badchannel(finestra_EEG_01_2,7);
                finestra_EEG_01_2_elchan=ans;
                eliminazione_badchannel(finestra_EEG_01_2_elchan,12);
                finestra_EEG_01_2_elchan=ans;
                
            elseif i==4
                eliminazione_badchannel(finestra_EEG_01_2,47);
                finestra_EEG_01_2_elchan=ans;
                
            elseif i==5
                eliminazione_badchannel(finestra_EEG_01_2,1);
                finestra_EEG_01_2_elchan=ans;
                eliminazione_badchannel(finestra_EEG_01_2_elchan,2);
                finestra_EEG_01_2_elchan=ans;
                eliminazione_badchannel(finestra_EEG_01_2_elchan,10);
                finestra_EEG_01_2_elchan=ans;
                eliminazione_badchannel(finestra_EEG_01_2_elchan,41);
                finestra_EEG_01_2_elchan=ans;
                
            elseif i==6
                eliminazione_badchannel(finestra_EEG_01_2,7);
                finestra_EEG_01_2_elchan=ans;
                eliminazione_badchannel(finestra_EEG_01_2_elchan,12);
                finestra_EEG_01_2_elchan=ans;
                
            elseif i==7
                eliminazione_badchannel(finestra_EEG_01_2,41);
                finestra_EEG_01_2_elchan=ans;
                
            elseif i==8
                eliminazione_badchannel(finestra_EEG_01_2,8);
                finestra_EEG_01_2_elchan=ans;
                eliminazione_badchannel(finestra_EEG_01_2_elchan,41);
                finestra_EEG_01_2_elchan=ans;
                eliminazione_badchannel(finestra_EEG_01_2_elchan,42);
                finestra_EEG_01_2_elchan=ans;
                
            elseif i==9
                eliminazione_badchannel(finestra_EEG_01_2,7);
                finestra_EEG_01_2_elchan=ans;
                eliminazione_badchannel(finestra_EEG_01_2_elchan,12);
                finestra_EEG_01_2_elchan=ans;
                
            elseif i==10
                eliminazione_badchannel(finestra_EEG_01_2,47);
                finestra_EEG_01_2_elchan=ans;
                eliminazione_badchannel(finestra_EEG_01_2_elchan,61);
                finestra_EEG_01_2_elchan=ans;
                
            elseif i==11
                eliminazione_badchannel(finestra_EEG_01_2,2);
                finestra_EEG_01_2_elchan=ans;
                eliminazione_badchannel(finestra_EEG_01_2_elchan,8);
                finestra_EEG_01_2_elchan=ans;
                eliminazione_badchannel(finestra_EEG_01_2_elchan,42);
                finestra_EEG_01_2_elchan=ans;
            end
            
            
            
            
            
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            
            %salvo il dato cioè la nuova finestra.
            nuovafinestra=([subject '_EEG' num2str(cont) '.mat']);
            %salvo il dato cioè la finestra pre-processata. Ho quindi un nuovo dataset con i dati
            
            save([percorso_preproc3 nuovafinestra],'finestra_EEG_01_2_elchan');
            
            
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
            
            %%%%%%%%%%%%%%%%BAD CHANNEL%%%%%%%%%%%%%%%%%%%%%%%%
            %Effettuo la cancellazione per ogni sessione
            if i==1
                eliminazione_badchannel(finestra_EEG_01_2,6);
                finestra_EEG_01_2_elchan=ans;
                
            %session2 non aveva noisechannel    
            elseif i==3
                eliminazione_badchannel(finestra_EEG_01_2,7);
                finestra_EEG_01_2_elchan=ans;
                eliminazione_badchannel(finestra_EEG_01_2_elchan,12);
                finestra_EEG_01_2_elchan=ans;
                
            elseif i==4
                eliminazione_badchannel(finestra_EEG_01_2,47);
                finestra_EEG_01_2_elchan=ans;
                
            elseif i==5
                eliminazione_badchannel(finestra_EEG_01_2,1);
                finestra_EEG_01_2_elchan=ans;
                eliminazione_badchannel(finestra_EEG_01_2_elchan,2);
                finestra_EEG_01_2_elchan=ans;
                eliminazione_badchannel(finestra_EEG_01_2_elchan,10);
                finestra_EEG_01_2_elchan=ans;
                eliminazione_badchannel(finestra_EEG_01_2_elchan,41);
                finestra_EEG_01_2_elchan=ans;
                
            elseif i==6
                eliminazione_badchannel(finestra_EEG_01_2,7);
                finestra_EEG_01_2_elchan=ans;
                eliminazione_badchannel(finestra_EEG_01_2_elchan,12);
                finestra_EEG_01_2_elchan=ans;
                
            elseif i==7
                eliminazione_badchannel(finestra_EEG_01_2,41);
                finestra_EEG_01_2_elchan=ans;
                
            elseif i==8
                eliminazione_badchannel(finestra_EEG_01_2,8);
                finestra_EEG_01_2_elchan=ans;
                eliminazione_badchannel(finestra_EEG_01_2_elchan,41);
                finestra_EEG_01_2_elchan=ans;
                eliminazione_badchannel(finestra_EEG_01_2_elchan,42);
                finestra_EEG_01_2_elchan=ans;
                
            elseif i==9
                eliminazione_badchannel(finestra_EEG_01_2,7);
                finestra_EEG_01_2_elchan=ans;
                eliminazione_badchannel(finestra_EEG_01_2_elchan,12);
                finestra_EEG_01_2_elchan=ans;
                
            elseif i==10
                eliminazione_badchannel(finestra_EEG_01_2,47);
                finestra_EEG_01_2_elchan=ans;
                eliminazione_badchannel(finestra_EEG_01_2_elchan,61);
                finestra_EEG_01_2_elchan=ans;
                
            elseif i==11
                eliminazione_badchannel(finestra_EEG_01_2,2);
                finestra_EEG_01_2_elchan=ans;
                eliminazione_badchannel(finestra_EEG_01_2_elchan,8);
                finestra_EEG_01_2_elchan=ans;
                eliminazione_badchannel(finestra_EEG_01_2_elchan,42);
                finestra_EEG_01_2_elchan=ans;
            end
            
            
            
            
            
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            
            %salvo il dato cioè la nuova finestra.
            nuovafinestra=([subject '_EEG' num2str(cont) '.mat']);
            %salvo il dato cioè la finestra pre-processata. Ho quindi un nuovo dataset con i dati
            
            save([percorso_preproc4 nuovafinestra],'finestra_EEG_01_2_elchan');
            
            
            clear('finestra_EEG_01_2');
        end
        
    end
    
end
