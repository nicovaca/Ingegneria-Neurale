clear all
clc
close all


% LAUNCH EEGLAB %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
cd '/home/vacalebre2022/Desktop/EegLab/eeglab2022.1';
eeglab
close all;

%CREO CARTELLA PER IL SINGOLO SOGGETTO
cd('/home/vacalebre2022/Desktop/Dataset/');
if ~exist('S1_mappeTF_3D', 'dir')
    mkdir S1_mappeTF_3D;
end


% CREO LE CARTELLE PER SALVARE I NUOVI FILE %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
cd('/home/vacalebre2022/Desktop/Dataset/S1_mappeTF_3D/');
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
radice_nome_file1='/home/vacalebre2022/Desktop/Dataset/S1_lapl/RH/S1_Session';
radice_nome_file2='/home/vacalebre2022/Desktop/Dataset/S1_lapl/LH/S1_Session';
radice_nome_file3='/home/vacalebre2022/Desktop/Dataset/S1_lapl/UP/S1_Session';
radice_nome_file4='/home/vacalebre2022/Desktop/Dataset/S1_lapl/DOWN/S1_Session';
radice_nome_file5='/home/vacalebre2022/Desktop/Dataset/S1_lapl/FAILURE/S1_Session';
partemedia_file='_EEG';
suffisso_file='.mat';
location_file = '/Users/nicolavacalebre/Desktop/Principi Ingegneria Neurale/channelref.ced';

% explore the variables in the workspace
% explore the locfile
percorso_preproc1='/home/vacalebre2022/Desktop/Dataset/S1_mappeTF_3D/RH/S1_Session';
percorso_preproc2='/home/vacalebre2022/Desktop/Dataset/S1_mappeTF_3D/LH/S1_Session';
percorso_preproc3='/home/vacalebre2022/Desktop/Dataset/S1_mappeTF_3D/UP/S1_Session';
percorso_preproc4='/home/vacalebre2022/Desktop/Dataset/S1_mappeTF_3D/DOWN/S1_Session';
%percorso_preproc5='/home/vacalebre2022/Desktop/Dataset/S1_mappeTF_3D/FAILURE/S1_Session';


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
            
            
            finestra_EEG_01_2=ans;
            
            for chan=1:size(finestra_EEG_01_2,1) % oppure num_chan
                
                % canale=chan_Area_Prem(chan,1); % canale corrente dell'area premotoria
                
                clear('CWT');
                [CWT,freqcwt] = cwt_Nadia(finestra_EEG_01_2(chan,:),scales,wname,1/fs) ; % Time-frequency map of channel "chan"
                
                
                WEnergy_3D(:,chan,:)=abs(CWT.*CWT); % la mappa bidimensionale viene inserita nella matrice 3D
                
                
                % salva come gpuarray:
                % WEnergy_3D(:,:,chan)=gpuArray(Energia);
                
                %%PLOT CWT%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                plot_CWT=0;
                
                
                if (plot_CWT==1) % se si vuole effttuare il plot
                    
                    time=(1/fs):(1/fs):round(T);
                    Yticks = 2.^(round(log2(min(fxx))):round(log2(max(fxx))));
                    
                    subplot(7,10,chan) % crea 60 subplot, uno per ogni canale
                    
                    imagesc(time,log2(fxx),WEnergy_3D(:,:,chan));% crea immagine di CWT^2
                    hold on
                    set(gca,'YLim',log2([min(fxx),max(fxx)]), ...
                        'layer','top', ...
                        'YTick',log2(Yticks(:)), ...
                        'YTickLabel',num2str(sprintf('%.2f\n',Yticks)), ...
                        'layer','top','YDir','normal');
                    xlabel('Time');
                    ylabel('Frequency');
                    set(gca,'Fontsize',8);
                    
                end
                %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                
            end % end for chan
            
            %PLOT SINGOLO CWT%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            
            chan=62; %numero canale da plottare
            plot_CWT=0;
            
            
            if (plot_CWT==2) % se si vuole effttuare il plot
                
                time=(1/fs):(1/fs):round(T);
                Yticks = 2.^(round(log2(min(fxx))):round(log2(max(fxx))));
                
                
                
                imagesc(time,log2(fxx),WEnergy_3D(:,:,chan));% crea immagine di CWT^2
                
                set(gca,'YLim',log2([min(fxx),max(fxx)]), ...
                    'layer','top', ...
                    'YTick',log2(Yticks(:)), ...
                    'YTickLabel',num2str(sprintf('%.2f\n',Yticks)), ...
                    'layer','top','YDir','normal');
                xlabel('Time');
                ylabel('Frequency');
                set(gca,'Fontsize',8);
                title(['Session' num2str(subject) ' EEG' num2str(cont) ' Channel ' num2str(chan)]);
            end
            
            
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            
            %salvo il dato cioè la nuova finestra.
            nuovafinestra=([subject '_EEG' num2str(cont) '.mat']);
            %salvo il dato cioè la finestra pre-processata. Ho quindi un nuovo dataset con i dati
            
            save([percorso_preproc1 nuovafinestra],'WEnergy_3D');
            
            
            clear('finestra_EEG_01_2');
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
            
            
            finestra_EEG_01_2=ans;
            
            for chan=1:size(finestra_EEG_01_2,1) % oppure num_chan
                
                % canale=chan_Area_Prem(chan,1); % canale corrente dell'area premotoria
                
                clear('CWT');
                [CWT,freqcwt] = cwt_Nadia(finestra_EEG_01_2(chan,:),scales,wname,1/fs) ; % Time-frequency map of channel "chan"
                
                
                WEnergy_3D(:,chan,:)=abs(CWT.*CWT); % la mappa bidimensionale viene inserita nella matrice 3D
                
                
                % salva come gpuarray:
                % WEnergy_3D(:,:,chan)=gpuArray(Energia);
                
                
                %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                
            end % end for chan
            
            
            
            
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            
            %salvo il dato cioè la nuova finestra.
            nuovafinestra=([subject '_EEG' num2str(cont) '.mat']);
            %salvo il dato cioè la finestra pre-processata. Ho quindi un nuovo dataset con i dati
            
            save([percorso_preproc2 nuovafinestra],'WEnergy_3D');
            
            
            clear('finestra_EEG_01_2');
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
            
            
            finestra_EEG_01_2=ans;
            
            for chan=1:size(finestra_EEG_01_2,1) % oppure num_chan
                
                % canale=chan_Area_Prem(chan,1); % canale corrente dell'area premotoria
                
                clear('CWT');
                [CWT,freqcwt] = cwt_Nadia(finestra_EEG_01_2(chan,:),scales,wname,1/fs) ; % Time-frequency map of channel "chan"
                
                
                WEnergy_3D(:,chan,:)=abs(CWT.*CWT); % la mappa bidimensionale viene inserita nella matrice 3D
                
                
                % salva come gpuarray:
                % WEnergy_3D(:,:,chan)=gpuArray(Energia);
                
                
                %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                
            end % end for chan
            
            
            
            
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            
            %salvo il dato cioè la nuova finestra.
            nuovafinestra=([subject '_EEG' num2str(cont) '.mat']);
            %salvo il dato cioè la finestra pre-processata. Ho quindi un nuovo dataset con i dati
            
            save([percorso_preproc3 nuovafinestra],'WEnergy_3D');
            
            
            clear('finestra_EEG_01_2');
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
            
            
            finestra_EEG_01_2=ans;
            
            for chan=1:size(finestra_EEG_01_2,1) % oppure num_chan
                
                % canale=chan_Area_Prem(chan,1); % canale corrente dell'area premotoria
                
                clear('CWT');
                [CWT,freqcwt] = cwt_Nadia(finestra_EEG_01_2(chan,:),scales,wname,1/fs) ; % Time-frequency map of channel "chan"
                
                
               WEnergy_3D(:,chan,:)=abs(CWT.*CWT); % la mappa bidimensionale viene inserita nella matrice 3D
                
                
                % salva come gpuarray:
                % WEnergy_3D(:,:,chan)=gpuArray(Energia);
                
                
                %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                
            end % end for chan
            
            
            
            
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            
            %salvo il dato cioè la nuova finestra.
            nuovafinestra=([subject '_EEG' num2str(cont) '.mat']);
            %salvo il dato cioè la finestra pre-processata. Ho quindi un nuovo dataset con i dati
            
            save([percorso_preproc4 nuovafinestra],'WEnergy_3D');
            
            
            clear('finestra_EEG_01_2');
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        end
    end
end

%Salvo per percorso 5-FAILURE
for i=1:11
    
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
            
            
            finestra_EEG_01_2=ans;
            
            for chan=1:size(finestra_EEG_01_2,1) % oppure num_chan
                
                % canale=chan_Area_Prem(chan,1); % canale corrente dell'area premotoria
                
                clear('CWT');
                [CWT,freqcwt] = cwt_Nadia(finestra_EEG_01_2(chan,:),scales,wname,1/fs) ; % Time-frequency map of channel "chan"
                
                
                WEnergy_3D(:,chan,:)=abs(CWT.*CWT); % la mappa bidimensionale viene inserita nella matrice 3D
                
                
                % salva come gpuarray:
                % WEnergy_3D(:,:,chan)=gpuArray(Energia);
                
                
                %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                
            end % end for chan
            
            
            
            
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            
            %salvo il dato cioè la nuova finestra.
            nuovafinestra=([subject '_EEG' num2str(cont) '.mat']);
            %salvo il dato cioè la finestra pre-processata. Ho quindi un nuovo dataset con i dati
            
            save([percorso_preproc5 nuovafinestra],'WEnergy_3D');
            
            
            clear('finestra_EEG_01_2');
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        end
    end
end