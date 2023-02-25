clear all
clc
close all


%CREO CARTELLA PER IL SINGOLO SOGGETTO
cd('/home/vacalebre2022/Desktop/DB1/S1_mappeNuove/');
if ~exist('S1_mappeTF', 'dir')
    mkdir S1_mappeTF;
end


% CREO LE CARTELLE PER SALVARE I NUOVI FILE %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
cd('/home/vacalebre2022/Desktop/DB1/S1_mappeNuove/');
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



% CARICO IL WORKSPACE %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
radice_nome_file1='/home/vacalebre2022/Desktop/DB1/S1_mappeTF_3D/RH/S1_Session';
radice_nome_file2='/home/vacalebre2022/Desktop/DB1/S1_mappeTF_3D/LH/S1_Session';
radice_nome_file3='/home/vacalebre2022/Desktop/DB1/S1_mappeTF_3D/UP/S1_Session';
radice_nome_file4='/home/vacalebre2022/Desktop/DB1/S1_mappeTF_3D/DOWN/S1_Session';
partemedia_file='_EEG';
suffisso_file='.mat';
location_file = '/Users/nicolavacalebre/Desktop/Principi Ingegneria Neurale/channelref.ced';



% explore the variables in the workspace
% explore the locfile
percorso_preproc1='/home/vacalebre2022/Desktop/DB1/S1_mappeNuove/RH/S1_Session';
percorso_preproc2='/home/vacalebre2022/Desktop/DB1/S1_mappeNuove/LH/S1_Session';
percorso_preproc3='/home/vacalebre2022/Desktop/DB1/S1_mappeNuove/UP/S1_Session';
percorso_preproc4='/home/vacalebre2022/Desktop/DB1/S1_mappeNuove/DOWN/S1_Session';





%DEFINISCO I PARAMETRI PER LA CWT
% finestra_EEG è la matrice EEG (canali x tempo)
% num_chan è il numero di canali
% scales è il vettore delle scale
% fs è la freq di campionamento
% wname è la famiglia wavelet
% fxx è dato da: fxx=scal2frq(scales,wname,1/fs);
% T è lampiezza della finestra EEG, ad esempio: T=1 significa 1 secondo
wname = 'db4';
scales = [9:1:30 31:5:100 101:10:250 251:30:750];% corrisponde al range calcolato 0.5-40 Hz (circa)
T=1; %la durata dei tracciati EEG è di 1s
fs=512; %Hz
fxx=scal2frq(scales,wname,1/fs);


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
            
            
            WEnergy_3D=ans;
            
            a=max(WEnergy_3D);
            for l=1:size(WEnergy_3D,2)
                for j=1:size(WEnergy_3D,1)
                    for k=1:512
                        if WEnergy_3D(j,l,k) == a(1,l,k)
                            WEnergy_3D(j,l,k)=WEnergy_3D(j,l,k)*1000;
                        end
                    end

                end
            end
            
            
            
            
            
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            
            %salvo il dato cioè la nuova finestra.
            nuovafinestra=([subject '_EEG' num2str(cont) '.mat']);
            %salvo il dato cioè la finestra pre-processata. Ho quindi un nuovo dataset con i dati
            
            save([percorso_preproc1 nuovafinestra],'WEnergy_3D');
            
            
            clear('a');
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
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
            
            
            WEnergy_3D=ans;
            
           
            a=max(WEnergy_3D);
            for l=1:size(WEnergy_3D,2)
                for j=1:size(WEnergy_3D,1)
                    for k=1:512
                        if WEnergy_3D(j,l,k) == a(1,l,k)
                            WEnergy_3D(j,l,k)=WEnergy_3D(j,l,k)*1000;
                        end
                    end

                end
            end
            
            
            
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            
            %salvo il dato cioè la nuova finestra.
            nuovafinestra=([subject '_EEG' num2str(cont) '.mat']);
            %salvo il dato cioè la finestra pre-processata. Ho quindi un nuovo dataset con i dati
            
            save([percorso_preproc2 nuovafinestra],'WEnergy_3D');
            
            
            clear('a');
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
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
            
            
            WEnergy_3D=ans;
            
            a=max(WEnergy_3D);
            for l=1:size(WEnergy_3D,2)
                for j=1:size(WEnergy_3D,1)
                    for k=1:512
                        if WEnergy_3D(j,l,k) == a(1,l,k)
                            WEnergy_3D(j,l,k)=WEnergy_3D(j,l,k)*1000;
                        end
                    end

                end
            end
            
            
            
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            
            %salvo il dato cioè la nuova finestra.
            nuovafinestra=([subject '_EEG' num2str(cont) '.mat']);
            %salvo il dato cioè la finestra pre-processata. Ho quindi un nuovo dataset con i dati
            
            save([percorso_preproc3 nuovafinestra],'WEnergy_3D');
            
            
            clear('a');
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
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
            
            
            WEnergy_3D=ans;
            
            a=max(WEnergy_3D);
            for l=1:size(WEnergy_3D,2)
                for j=1:size(WEnergy_3D,1)
                    for k=1:512
                        if WEnergy_3D(j,l,k) == a(1,l,k)
                            WEnergy_3D(j,l,k)=WEnergy_3D(j,l,k)*1000;
                        end
                    end

                end
            end
            
            
            
            
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            
            %salvo il dato cioè la nuova finestra.
            nuovafinestra=([subject '_EEG' num2str(cont) '.mat']);
            %salvo il dato cioè la finestra pre-processata. Ho quindi un nuovo dataset con i dati
            
            save([percorso_preproc4 nuovafinestra],'WEnergy_3D');
            
            
            clear('a');
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        end
    end
end