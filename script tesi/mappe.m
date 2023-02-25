clear all
clc
close all

%CREO CARTELLA PER IL SINGOLO SOGGETTO
cd('/home/vacalebre2022/Desktop/Dataset/');
if ~exist('MAPPE_2D', 'dir')
    mkdir MAPPE_2D;
end


% CREO LE CARTELLE PER SALVARE I NUOVI FILE %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
cd('/home/vacalebre2022/Desktop/Dataset/MAPPE_2D/');
if ~exist('RH', 'dir')
    mkdir RH;
end
if ~exist('LH', 'dir')
    mkdir LH;
end
if ~exist('UP', 'dir')
    mkdir UP;
end
if ~exist('DOWN', 'dir')
    mkdir DOWN;
end
if ~exist('FAILURE', 'dir')
    mkdir FAILURE;
end


% CARICO IL WORKSPACE %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
radice_nome_file1='/home/vacalebre2022/Desktop/Dataset/S1_mappeTF_3D/RH/S1_Session';
radice_nome_file2='/home/vacalebre2022/Desktop/Dataset/S1_mappeTF_3D/LH/S1_Session';
radice_nome_file3='/home/vacalebre2022/Desktop/Dataset/S1_mappeTF_3D/UP/S1_Session';
radice_nome_file4='/home/vacalebre2022/Desktop/Dataset/S1_mappeTF_3D/DOWN/S1_Session';
radice_nome_file5='/home/vacalebre2022/Desktop/Dataset/S1_mappeTF_3D/FAILURE/S1_Session';
partemedia_file='_EEG';
suffisso_file='.mat';

% explore the variables in the workspace
% explore the locfile
percorso_preproc1='/home/vacalebre2022/Desktop/Dataset/MAPPE_2D/RH/EEG';
percorso_preproc2='/home/vacalebre2022/Desktop/Dataset/MAPPE_2D/LH/EEG';
percorso_preproc3='/home/vacalebre2022/Desktop/Dataset/MAPPE_2D/UP/EEG';
percorso_preproc4='/home/vacalebre2022/Desktop/Dataset/MAPPE_2D/DOWN/EEG';
percorso_preproc5='/home/vacalebre2022/Desktop/Dataset/MAPPE_2D/FAILURE/EEG';


%Salvo per percorso 1-RIGHT
for i=1:1
    
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
            
            
            WEnergy_3D=ans;
            
            
            for j=1:512
                CWT(:,:) = WEnergy_3D(:,:,j);
                
                
                
                
                
                %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                
                %salvo il dato cioè la nuova finestra.
                nuovafinestra=([num2str(cont) 'CWT' num2str(j) 'subject' subject '.mat']);
                %salvo il dato cioè la finestra pre-processata. Ho quindi un nuovo dataset con i dati
                
                save([percorso_preproc1 nuovafinestra],'CWT');
                
            end
            clear('WEnergy_3D');
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        end
    end
end


%Salvo per percorso 2-LEFT
for i=1:1
    
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
            
            
            WEnergy_3D=ans;
            
            
            for j=1:512
                CWT(:,:) = WEnergy_3D(:,:,j);
                
                
                
                
                
                %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                
                %salvo il dato cioè la nuova finestra.
                nuovafinestra=([num2str(cont) 'CWT' num2str(j) 'subject' subject '.mat']);
                %salvo il dato cioè la finestra pre-processata. Ho quindi un nuovo dataset con i dati
                
                save([percorso_preproc2 nuovafinestra],'CWT');
                
            end
            clear('WEnergy_3D');
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        end
    end
end

%Salvo per percorso 3-RIGHT
for i=1:1
    
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
            
            
            WEnergy_3D=ans;
            
            
            for j=1:512
                CWT(:,:) = WEnergy_3D(:,:,j);
                
                
                
                
                
                %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                
                %salvo il dato cioè la nuova finestra.
                nuovafinestra=([num2str(cont) 'CWT' num2str(j) 'subject' subject '.mat']);
                %salvo il dato cioè la finestra pre-processata. Ho quindi un nuovo dataset con i dati
                
                save([percorso_preproc3 nuovafinestra],'CWT');
                
            end
            clear('WEnergy_3D');
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        end
    end
end

%Salvo per percorso 4-DOWN
for i=1:1
    
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
            
            
            WEnergy_3D=ans;
            
            
            for j=1:512
                CWT(:,:) = WEnergy_3D(:,:,j);
                
                
                
                
                
                %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                
                %salvo il dato cioè la nuova finestra.
                nuovafinestra=([num2str(cont) 'CWT' num2str(j) 'subject' subject '.mat']);
                %salvo il dato cioè la finestra pre-processata. Ho quindi un nuovo dataset con i dati
                
                save([percorso_preproc4 nuovafinestra],'CWT');
                
            end
            clear('WEnergy_3D');
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        end
    end
end

%Salvo per percorso 5-FAILURE
for i=1:1
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % Subject code (stringa che identifica il codice del soggetto)
    sub=i; % soggetto 1
    
    subject=(num2str(sub));
    
    
    num_trials=450;
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % LA PROCEDURA VA RIPETUTA PER OGNI CLASSE
    for cont=1:num_trials     % current trial
        
        
        file_name=[radice_nome_file5 num2str(i) partemedia_file num2str(cont) suffisso_file];
        if exist(file_name, 'file')
            importdata(file_name);
            
            
            WEnergy_3D=ans;
            
            
            for j=1:512
                CWT(:,:) = WEnergy_3D(:,:,j);
                
                
                
                
                
                %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                
                %salvo il dato cioè la nuova finestra.
                nuovafinestra=([num2str(cont) 'CWT' num2str(j) 'subject' subject '.mat']);
                %salvo il dato cioè la finestra pre-processata. Ho quindi un nuovo dataset con i dati
                
                save([percorso_preproc5 nuovafinestra],'CWT');
                
            end
            clear('WEnergy_3D');
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        end
    end
end

