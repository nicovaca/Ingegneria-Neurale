
clear all
clc
close all

% AVVIO DI EEGLAB %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
cd '/Users/nicolavacalebre/Desktop/Principi Ingegneria Neurale/eeglab2022.1/eeglab2022.1';
eeglab
close all;

%CREO CARTELLA PER IL SINGOLO SOGGETTO
cd('/Volumes/NikSSD/NewDataset');
mkdir S1;

% CREO LE CARTELLE PER SALVARE I NUOVI FILE %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
cd('/Volumes/NikSSD/NewDataset/S1');
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
radice_nome_file='/Volumes/NikSSD/Dataset/S1/S1_Session_';
suffisso_file='.mat';

%CREO I NUOVI TRACCIATI EEG E LI DIVIDO IN BASE AI TASK RICHIESTI%%%%%%%%%%%
 num_trials=length(BCI.data);
for i=1:11 %numero di sessioni svolte dal soggetto
    file_name=[radice_nome_file num2str(i) suffisso_file];
    load(file_name);
    
    
    % frequenza di campionamento
    fs = BCI.SRATE;
    
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % Subject code (stringa che identifica il codice del soggetto)
    sub=i; % soggetto 1
    
    subject=(num2str(sub));
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    num_trials=length(BCI.data); % in questo dataset ci sono 450 trial,ovvero 450 finestre di tracciato EEG della durata di 1 sec per classe
    
    
    for cont=1:num_trials
        
        finestra_EEG=BCI.data{1,cont};
        
        
        fs = BCI.SRATE;
        finestra_EEG_01_1=finestra_EEG;
        finestra_EEG_01_1(:,round(0.001*fs):round(3.999*fs))=[];
        
        finestra_EEG_01_2=finestra_EEG_01_1;
        finestra_EEG_01_2(:,round(1*fs):end)=[];
       
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        
        %salvo il dato cioè la nuova finestra.
        nuovafinestra=([subject '_EEG' num2str(cont) '.mat']);
        
        % percorso dati preprocessati
        numtarget=[BCI.TrialData.targetnumber];
        if numtarget(1,cont) ==1
            
            percorso_preproc='/Volumes/NikSSD/NewDataset/S1/1-RH/S1_Session_';
            
        elseif numtarget(1,cont) ==2
            percorso_preproc='/Volumes/NikSSD/NewDataset/S1/2-LH/S1_Session_';
            
        elseif numtarget(1,cont) ==3
            percorso_preproc='/Volumes/NikSSD/NewDataset/S1/3-UP/S1_Session_';
            
        elseif numtarget(1,cont) ==4
            percorso_preproc='/Volumes/NikSSD/NewDataset/S1/4-DOWN/S1_Session_';
        end
        
        artifact=[BCI.TrialData.artifact];
        if artifact(1,cont)== 0
        save([percorso_preproc nuovafinestra],'finestra_EEG_01_2');
        clear('finestra_EEG');
        
        else
             disp(['S1_Session_' nuovafinestra])
        
        end
        
    end
    
    
end
%eegplot(finestra_EEG_01_2,'srate',BCI.SRATE,'eloc_file',BCI.chaninfo.label,'winlength',1);