clear all
clc
close all

% AVVIO DI EEGLAB %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
cd '/Users/nicolavacalebre/Desktop/Principi Ingegneria Neurale/eeglab2022.1/eeglab2022.1';
eeglab
close all;

location_file = '/Users/nicolavacalebre/Desktop/Principi Ingegneria Neurale/channelref.ced';

% fs=1000; %Hz
fs=512;  %Hz


CARICO IL WORKSPACE %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
radice_nome_file1='/Users/nicolavacalebre/Desktop/S1/1-RH/S1_Session_';
radice_nome_file2='/Users/nicolavacalebre/Desktop/S1/2-LH/S1_Session_';
radice_nome_file3='/Users/nicolavacalebre/Desktop/S1/3-UP/S1_Session_';
radice_nome_file4='/Users/nicolavacalebre/Desktop/S1/4-DOWN/S1_Session_';

partemedia_file='_EEG';
suffisso_file='.mat';


%SALVATAGGIO DEI DATI
% explore the variables in the workspace
% explore the locfile
percorso_preproc1='/Users/nicolavacalebre/Desktop/NewDataset2/S1_final/RH/S1_Session';
percorso_preproc2='/Users/nicolavacalebre/Desktop/NewDataset2/S1_final/LH/S1_Session';
percorso_preproc3='/Users/nicolavacalebre/Desktop/NewDataset2/S1_final/UP/S1_Session';
percorso_preproc4='/Users/nicolavacalebre/Desktop/NewDataset2/S1_final/DOWN/S1_Session';


%Impostazioni
filtering=0;
bad_channel=0;
resampling=0;
laplacian=0;



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
            
            if (filtering==1)
                %%%%%%%%FILTERING:
                f1=0.5; %Hz     %Onde alpha e beta
                f2=40;  %Hz
                
                for j=1:size(finestra_EEG_01_2,1)
                    
                    finestra_EEG_01_2(j,:)=bandpass_filtering_FFT(finestra_EEG_01_2(j,:),fs,f1,f2);
                    
                    
                end
            end
            
            if (bad_channel==1)
                %%%%%%%%%%%%%%%%BAD CHANNEL%%%%%%%%%%%%%%%%%%%%%%%%
                %Effettuo la cancellazione per ogni sessione
                if i==1
                    eliminazione_badchannel(finestra_EEG_01_2,6);
                    finestra_EEG_01_2=ans;
                    
                    %session2 non aveva noisechannel
                elseif i==3
                    eliminazione_badchannel(finestra_EEG_01_2,7);
                    finestra_EEG_01_2=ans;
                    eliminazione_badchannel(finestra_EEG_01_2_elchan,12);
                    finestra_EEG_01_2=ans;
                    
                elseif i==4
                    eliminazione_badchannel(finestra_EEG_01_2,47);
                    finestra_EEG_01_2=ans;
                    
                elseif i==5
                    eliminazione_badchannel(finestra_EEG_01_2,1);
                    finestra_EEG_01_2=ans;
                    eliminazione_badchannel(finestra_EEG_01_2_elchan,2);
                    finestra_EEG_01_2=ans;
                    eliminazione_badchannel(finestra_EEG_01_2_elchan,10);
                    finestra_EEG_01_2=ans;
                    eliminazione_badchannel(finestra_EEG_01_2_elchan,41);
                    finestra_EEG_01_2=ans;
                    
                elseif i==6
                    eliminazione_badchannel(finestra_EEG_01_2,7);
                    finestra_EEG_01_2=ans;
                    eliminazione_badchannel(finestra_EEG_01_2_elchan,12);
                    finestra_EEG_01_2=ans;
                    
                elseif i==7
                    eliminazione_badchannel(finestra_EEG_01_2,41);
                    finestra_EEG_01_2=ans;
                    
                elseif i==8
                    eliminazione_badchannel(finestra_EEG_01_2,8);
                    finestra_EEG_01_2=ans;
                    eliminazione_badchannel(finestra_EEG_01_2_elchan,41);
                    finestra_EEG_01_2=ans;
                    eliminazione_badchannel(finestra_EEG_01_2_elchan,42);
                    finestra_EEG_01_2=ans;
                    
                elseif i==9
                    eliminazione_badchannel(finestra_EEG_01_2,7);
                    finestra_EEG_01_2=ans;
                    eliminazione_badchannel(finestra_EEG_01_2_elchan,12);
                    finestra_EEG_01_2=ans;
                    
                elseif i==10
                    eliminazione_badchannel(finestra_EEG_01_2,47);
                    finestra_EEG_01_2=ans;
                    eliminazione_badchannel(finestra_EEG_01_2_elchan,61);
                    finestra_EEG_01_2=ans;
                    
                elseif i==11
                    eliminazione_badchannel(finestra_EEG_01_2,2);
                    finestra_EEG_01_2=ans;
                    eliminazione_badchannel(finestra_EEG_01_2_elchan,8);
                    finestra_EEG_01_2=ans;
                    eliminazione_badchannel(finestra_EEG_01_2_elchan,42);
                    finestra_EEG_01_2=ans;
                end
            end
            
            if (resampling==1)
                %%Resampling
                
                Fsa =  1000;                                                % Actual Sampling Frequency
                Fsd = 512;                                                  % Desired Sampliing Frequency
                [N,D] = rat(Fsd/Fsa);                                       % Rational Fraction Approximation
                %Check = [Fsd/Fsa, N/D]                                     % Approximation Accuracy Check (Delete)
                DoubleVector=double(finestra_EEG_01_2);                     %È necessario convertire in double per il resampling
                
                % Resampled Signal
                for j=1:size(finestra_EEG_01_2,1)
                    
                    finestra_EEG_01_2(j,:) = resample(DoubleVector(j,:), N, D); % Resampled Signal
                    
                end
            end
            
            if (laplacian==1)
                %%%%%%%%%%%%%%%%LAPLACIAN%%%%%%%%%%%%%%%%%%%%%%%%
                finestra_EEG_01_2=laplacian_EEG_Schalk(finestra_EEG_01_2);
            end
            
            
            %salvo il dato cioè la nuova finestra.
            nuovafinestra=([subject '_EEG' num2str(cont) '_filtrata' '.mat']);
            %salvo il dato cioè la finestra pre-processata. Ho quindi un nuovo dataset con i dati
            
            save([percorso_preproc1 nuovafinestra],'finestra_EEG_01_2');
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
            
            if (filtering==1)
                %%%%%%%%FILTERING:
                f1=0.5; %Hz     %Onde alpha e beta
                f2=40;  %Hz
                
                for j=1:size(finestra_EEG_01_2,1)
                    
                    finestra_EEG_01_2(j,:)=bandpass_filtering_FFT(finestra_EEG_01_2(j,:),fs,f1,f2);
                    
                    
                end
            end
            
            if (bad_channel==1)
                %%%%%%%%%%%%%%%%BAD CHANNEL%%%%%%%%%%%%%%%%%%%%%%%%
                %Effettuo la cancellazione per ogni sessione
                if i==1
                    eliminazione_badchannel(finestra_EEG_01_2,6);
                    finestra_EEG_01_2=ans;
                    
                    %session2 non aveva noisechannel
                elseif i==3
                    eliminazione_badchannel(finestra_EEG_01_2,7);
                    finestra_EEG_01_2=ans;
                    eliminazione_badchannel(finestra_EEG_01_2_elchan,12);
                    finestra_EEG_01_2=ans;
                    
                elseif i==4
                    eliminazione_badchannel(finestra_EEG_01_2,47);
                    finestra_EEG_01_2=ans;
                    
                elseif i==5
                    eliminazione_badchannel(finestra_EEG_01_2,1);
                    finestra_EEG_01_2=ans;
                    eliminazione_badchannel(finestra_EEG_01_2_elchan,2);
                    finestra_EEG_01_2=ans;
                    eliminazione_badchannel(finestra_EEG_01_2_elchan,10);
                    finestra_EEG_01_2=ans;
                    eliminazione_badchannel(finestra_EEG_01_2_elchan,41);
                    finestra_EEG_01_2=ans;
                    
                elseif i==6
                    eliminazione_badchannel(finestra_EEG_01_2,7);
                    finestra_EEG_01_2=ans;
                    eliminazione_badchannel(finestra_EEG_01_2_elchan,12);
                    finestra_EEG_01_2=ans;
                    
                elseif i==7
                    eliminazione_badchannel(finestra_EEG_01_2,41);
                    finestra_EEG_01_2=ans;
                    
                elseif i==8
                    eliminazione_badchannel(finestra_EEG_01_2,8);
                    finestra_EEG_01_2=ans;
                    eliminazione_badchannel(finestra_EEG_01_2_elchan,41);
                    finestra_EEG_01_2=ans;
                    eliminazione_badchannel(finestra_EEG_01_2_elchan,42);
                    finestra_EEG_01_2=ans;
                    
                elseif i==9
                    eliminazione_badchannel(finestra_EEG_01_2,7);
                    finestra_EEG_01_2=ans;
                    eliminazione_badchannel(finestra_EEG_01_2_elchan,12);
                    finestra_EEG_01_2=ans;
                    
                elseif i==10
                    eliminazione_badchannel(finestra_EEG_01_2,47);
                    finestra_EEG_01_2=ans;
                    eliminazione_badchannel(finestra_EEG_01_2_elchan,61);
                    finestra_EEG_01_2=ans;
                    
                elseif i==11
                    eliminazione_badchannel(finestra_EEG_01_2,2);
                    finestra_EEG_01_2=ans;
                    eliminazione_badchannel(finestra_EEG_01_2_elchan,8);
                    finestra_EEG_01_2=ans;
                    eliminazione_badchannel(finestra_EEG_01_2_elchan,42);
                    finestra_EEG_01_2=ans;
                end
            end
            
            if (resampling==1)
                %%Resampling
                
                Fsa =  1000;                                                % Actual Sampling Frequency
                Fsd = 512;                                                  % Desired Sampliing Frequency
                [N,D] = rat(Fsd/Fsa);                                       % Rational Fraction Approximation
                %Check = [Fsd/Fsa, N/D]                                     % Approximation Accuracy Check (Delete)
                DoubleVector=double(finestra_EEG_01_2);                     %È necessario convertire in double per il resampling
                
                % Resampled Signal
                for j=1:size(finestra_EEG_01_2,1)
                    
                    finestra_EEG_01_2(j,:) = resample(DoubleVector(j,:), N, D); % Resampled Signal
                    
                end
            end
            
            if (laplacian==1)
                %%%%%%%%%%%%%%%%LAPLACIAN%%%%%%%%%%%%%%%%%%%%%%%%
                finestra_EEG_01_2=laplacian_EEG_Schalk(finestra_EEG_01_2);
            end
            
            
            %salvo il dato cioè la nuova finestra.
            nuovafinestra=([subject '_EEG' num2str(cont) '_filtrata' '.mat']);
            %salvo il dato cioè la finestra pre-processata. Ho quindi un nuovo dataset con i dati
            
            save([percorso_preproc2 nuovafinestra],'finestra_EEG_01_2');
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
            
            if (filtering==1)
                %%%%%%%%FILTERING:
                f1=0.5; %Hz     %Onde alpha e beta
                f2=40;  %Hz
                
                for j=1:size(finestra_EEG_01_2,1)
                    
                    finestra_EEG_01_2(j,:)=bandpass_filtering_FFT(finestra_EEG_01_2(j,:),fs,f1,f2);
                    
                    
                end
            end
            
            if (bad_channel==1)
                %%%%%%%%%%%%%%%%BAD CHANNEL%%%%%%%%%%%%%%%%%%%%%%%%
                %Effettuo la cancellazione per ogni sessione
                if i==1
                    eliminazione_badchannel(finestra_EEG_01_2,6);
                    finestra_EEG_01_2=ans;
                    
                    %session2 non aveva noisechannel
                elseif i==3
                    eliminazione_badchannel(finestra_EEG_01_2,7);
                    finestra_EEG_01_2=ans;
                    eliminazione_badchannel(finestra_EEG_01_2_elchan,12);
                    finestra_EEG_01_2=ans;
                    
                elseif i==4
                    eliminazione_badchannel(finestra_EEG_01_2,47);
                    finestra_EEG_01_2=ans;
                    
                elseif i==5
                    eliminazione_badchannel(finestra_EEG_01_2,1);
                    finestra_EEG_01_2=ans;
                    eliminazione_badchannel(finestra_EEG_01_2_elchan,2);
                    finestra_EEG_01_2=ans;
                    eliminazione_badchannel(finestra_EEG_01_2_elchan,10);
                    finestra_EEG_01_2=ans;
                    eliminazione_badchannel(finestra_EEG_01_2_elchan,41);
                    finestra_EEG_01_2=ans;
                    
                elseif i==6
                    eliminazione_badchannel(finestra_EEG_01_2,7);
                    finestra_EEG_01_2=ans;
                    eliminazione_badchannel(finestra_EEG_01_2_elchan,12);
                    finestra_EEG_01_2=ans;
                    
                elseif i==7
                    eliminazione_badchannel(finestra_EEG_01_2,41);
                    finestra_EEG_01_2=ans;
                    
                elseif i==8
                    eliminazione_badchannel(finestra_EEG_01_2,8);
                    finestra_EEG_01_2=ans;
                    eliminazione_badchannel(finestra_EEG_01_2_elchan,41);
                    finestra_EEG_01_2=ans;
                    eliminazione_badchannel(finestra_EEG_01_2_elchan,42);
                    finestra_EEG_01_2=ans;
                    
                elseif i==9
                    eliminazione_badchannel(finestra_EEG_01_2,7);
                    finestra_EEG_01_2=ans;
                    eliminazione_badchannel(finestra_EEG_01_2_elchan,12);
                    finestra_EEG_01_2=ans;
                    
                elseif i==10
                    eliminazione_badchannel(finestra_EEG_01_2,47);
                    finestra_EEG_01_2=ans;
                    eliminazione_badchannel(finestra_EEG_01_2_elchan,61);
                    finestra_EEG_01_2=ans;
                    
                elseif i==11
                    eliminazione_badchannel(finestra_EEG_01_2,2);
                    finestra_EEG_01_2=ans;
                    eliminazione_badchannel(finestra_EEG_01_2_elchan,8);
                    finestra_EEG_01_2=ans;
                    eliminazione_badchannel(finestra_EEG_01_2_elchan,42);
                    finestra_EEG_01_2=ans;
                end
            end
            
            if (resampling==1)
                %%Resampling
                
                Fsa =  1000;                                                % Actual Sampling Frequency
                Fsd = 512;                                                  % Desired Sampliing Frequency
                [N,D] = rat(Fsd/Fsa);                                       % Rational Fraction Approximation
                %Check = [Fsd/Fsa, N/D]                                     % Approximation Accuracy Check (Delete)
                DoubleVector=double(finestra_EEG_01_2);                     %È necessario convertire in double per il resampling
                
                % Resampled Signal
                for j=1:size(finestra_EEG_01_2,1)
                    
                    finestra_EEG_01_2(j,:) = resample(DoubleVector(j,:), N, D); % Resampled Signal
                    
                end
            end
            
            if (laplacian==1)
                %%%%%%%%%%%%%%%%LAPLACIAN%%%%%%%%%%%%%%%%%%%%%%%%
                finestra_EEG_01_2=laplacian_EEG_Schalk(finestra_EEG_01_2);
            end
            
            
            %salvo il dato cioè la nuova finestra.
            nuovafinestra=([subject '_EEG' num2str(cont) '_filtrata' '.mat']);
            %salvo il dato cioè la finestra pre-processata. Ho quindi un nuovo dataset con i dati
            
            save([percorso_preproc3 nuovafinestra],'finestra_EEG_01_2');
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
            
            if (filtering==1)
                %%%%%%%%FILTERING:
                f1=0.5; %Hz     %Onde alpha e beta
                f2=40;  %Hz
                
                for j=1:size(finestra_EEG_01_2,1)
                    
                    finestra_EEG_01_2(j,:)=bandpass_filtering_FFT(finestra_EEG_01_2(j,:),fs,f1,f2);
                    
                    
                end
            end
            
            if (bad_channel==1)
                %%%%%%%%%%%%%%%%BAD CHANNEL%%%%%%%%%%%%%%%%%%%%%%%%
                %Effettuo la cancellazione per ogni sessione
                if i==1
                    eliminazione_badchannel(finestra_EEG_01_2,6);
                    finestra_EEG_01_2=ans;
                    
                    %session2 non aveva noisechannel
                elseif i==3
                    eliminazione_badchannel(finestra_EEG_01_2,7);
                    finestra_EEG_01_2=ans;
                    eliminazione_badchannel(finestra_EEG_01_2_elchan,12);
                    finestra_EEG_01_2=ans;
                    
                elseif i==4
                    eliminazione_badchannel(finestra_EEG_01_2,47);
                    finestra_EEG_01_2=ans;
                    
                elseif i==5
                    eliminazione_badchannel(finestra_EEG_01_2,1);
                    finestra_EEG_01_2=ans;
                    eliminazione_badchannel(finestra_EEG_01_2_elchan,2);
                    finestra_EEG_01_2=ans;
                    eliminazione_badchannel(finestra_EEG_01_2_elchan,10);
                    finestra_EEG_01_2=ans;
                    eliminazione_badchannel(finestra_EEG_01_2_elchan,41);
                    finestra_EEG_01_2=ans;
                    
                elseif i==6
                    eliminazione_badchannel(finestra_EEG_01_2,7);
                    finestra_EEG_01_2=ans;
                    eliminazione_badchannel(finestra_EEG_01_2_elchan,12);
                    finestra_EEG_01_2=ans;
                    
                elseif i==7
                    eliminazione_badchannel(finestra_EEG_01_2,41);
                    finestra_EEG_01_2=ans;
                    
                elseif i==8
                    eliminazione_badchannel(finestra_EEG_01_2,8);
                    finestra_EEG_01_2=ans;
                    eliminazione_badchannel(finestra_EEG_01_2_elchan,41);
                    finestra_EEG_01_2=ans;
                    eliminazione_badchannel(finestra_EEG_01_2_elchan,42);
                    finestra_EEG_01_2=ans;
                    
                elseif i==9
                    eliminazione_badchannel(finestra_EEG_01_2,7);
                    finestra_EEG_01_2=ans;
                    eliminazione_badchannel(finestra_EEG_01_2_elchan,12);
                    finestra_EEG_01_2=ans;
                    
                elseif i==10
                    eliminazione_badchannel(finestra_EEG_01_2,47);
                    finestra_EEG_01_2=ans;
                    eliminazione_badchannel(finestra_EEG_01_2_elchan,61);
                    finestra_EEG_01_2=ans;
                    
                elseif i==11
                    eliminazione_badchannel(finestra_EEG_01_2,2);
                    finestra_EEG_01_2=ans;
                    eliminazione_badchannel(finestra_EEG_01_2_elchan,8);
                    finestra_EEG_01_2=ans;
                    eliminazione_badchannel(finestra_EEG_01_2_elchan,42);
                    finestra_EEG_01_2=ans;
                end
            end
            
            if (resampling==1)
                %%Resampling
                
                Fsa =  1000;                                                % Actual Sampling Frequency
                Fsd = 512;                                                  % Desired Sampliing Frequency
                [N,D] = rat(Fsd/Fsa);                                       % Rational Fraction Approximation
                %Check = [Fsd/Fsa, N/D]                                     % Approximation Accuracy Check (Delete)
                DoubleVector=double(finestra_EEG_01_2);                     %È necessario convertire in double per il resampling
                
                % Resampled Signal
                for j=1:size(finestra_EEG_01_2,1)
                    
                    finestra_EEG_01_2(j,:) = resample(DoubleVector(j,:), N, D); % Resampled Signal
                    
                end
            end
            
            if (laplacian==1)
                %%%%%%%%%%%%%%%%LAPLACIAN%%%%%%%%%%%%%%%%%%%%%%%%
                finestra_EEG_01_2=laplacian_EEG_Schalk(finestra_EEG_01_2);
            end
            
            
            %salvo il dato cioè la nuova finestra.
            nuovafinestra=([subject '_EEG' num2str(cont) '_filtrata' '.mat']);
            %salvo il dato cioè la finestra pre-processata. Ho quindi un nuovo dataset con i dati
            
            save([percorso_preproc4 nuovafinestra],'finestra_EEG_01_2');
            %save([percorso_preproc   subject '_MI\RH\Trial_' num2str(cont) '.mat'],'finestra_EEG');
            
            clear('finestra_EEG_01_2');
        end
        
    end
    
end