clear all
clc
close all


% LAUNCH EEGLAB %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
cd '/Users/nicolavacalebre/Desktop/Principi Ingegneria Neurale/eeglab2022.1/eeglab2022.1';
eeglab
close all;

% CARICO IL WORKSPACE %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%radice_nome_file='/Users/nicolavacalebre/Desktop/Soggetto1/S1_Session_1';
radice_nome_file1='/Users/nicolavacalebre/Desktop/S1/1-RH/S1_Session_';
% radice_nome_file2='/Users/nicolavacalebre/Desktop/S1/2-LH/S1_Session_';
% radice_nome_file3='/Users/nicolavacalebre/Desktop/S1/3-UP/S1_Session_';
% radice_nome_file4='/Users/nicolavacalebre/Desktop/S1/4-DOWN/S1_Session_';
%radice_nome_file1='/Users/nicolavacalebre/Desktop/NewDataset2/S1_FILTERING/1-RH_FILTERING/S1_Session_';
%radice_nome_file2='/Users/nicolavacalebre/Desktop/NewDataset2/S1_FILTERING/2-LH_FILTERING/S1_Session_';
%radice_nome_file3='/Users/nicolavacalebre/Desktop/NewDataset2/S1_FILTERING/3-UP_FILTERING/S1_Session_';
%radice_nome_file4='/Users/nicolavacalebre/Desktop/NewDataset2/S1_FILTERING/4-DOWN_FILTERING/S1_Session_';

partemedia_file='_EEG';
suffisso_file='.mat';
%suffisso_file='_filtrata.mat';

location_file = '/Users/nicolavacalebre/Desktop/Principi Ingegneria Neurale/channelref.ced';

fs=512 %Hz

%MEDIA POTENZA ELETTRODI:
for i=1:62
    media_EEG(i,:)=mean(finestra_EEG_01_2(i,:));
    
    
end

% TOPOPLOT 2D %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

i=1;
topoplot(media_EEG(:,i),location_file);
title(['Media from Session' num2str(i)  ' Trial' num2str(i)])



for i=1:11
    
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    num_trials=450;
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % LA PROCEDURA VA RIPETUTA PER OGNI SESSIONE
    for cont=1:num_trials     % current trial
        
        %%Frequenza di campionamento
        fs=512;
        
        file_name=[radice_nome_file num2str(i) partemedia_file num2str(cont) suffisso_file];
        if exist(file_name, 'file')
            importdata(file_name);
            
            finestra_EEG_01_2=ans;
            
            for i=1:62
                media_EEG(i,:)=mean(finestra_EEG_01_2(i,:));
                
            end
            
            k=1;
            topoplot(media_EEG(:,k),location_file);
            title(['Media from Session' num2str(i)])
            hold on;
            
            
        end
        
    end
    
end



%%%DIVISIONE PER SESSIONE
i=5;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

num_trials=40;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% LA PROCEDURA VA RIPETUTA PER OGNI SESSIONE
for cont=1:num_trials     % current trial
    
    %%Frequenza di campionamento
    fs=512;
    
    file_name=[radice_nome_file num2str(i) partemedia_file num2str(cont) suffisso_file];
    if exist(file_name, 'file')
        importdata(file_name);
        
        finestra_EEG_01_2=ans;
        
        for j=1:62
            media_EEG(j,:)=mean(finestra_EEG_01_2(j,:));
            
        end
        
        k=1;
        topoplot(media_EEG(:,k),location_file);
        title(['Media from Session' num2str(i)])
        hold on;
        
        
    end
    
end




for j=1:11
    for cont=1:450
        for i=1:62
            topoplot(media_EEG(:,i),location_file);
            title(['Media from Session' num2str(i)])
        end
    end
end

for i=1:11 % size(finestra_EEG_01_2,2)
    
    figure(i)
    topoplot(media_EEG(:,i),location_file);
    title(['Media from Session' num2str(i)])
end

%%%SUBPLOT MEDIA SESSIONI%%%%%%%%%%%%%%%%%%%%%%%
num_trials=10;
%num_trials=200:10:450;
for i=1:11
    
    
    for cont=1:num_trials
        
        file_name=[radice_nome_file num2str(i) partemedia_file num2str(cont) suffisso_file];
        if exist(file_name, 'file')
            importdata(file_name);
            
            finestra_EEG_01_2=ans;
            
            
            
            for j=1:62
                media_EEG(j,:)=mean(finestra_EEG_01_2(j,:));
                
            end
            
            subplot(3,4,i)
            xlabel ('Time(smaples)');
            ylabel('EEG (uV)');
            k=1;
            topoplot(media_EEG(:,k),location_file);
            title(['Media from Session' num2str(i)])
            hold on;
            
            sgtitle('Task RH')
            %sgtitle('Task LH')
            %sgtitle('Task UP')
            %sgtitle('Task DOWN')
        end
        
        
        
        
        %     topoplot(media_EEG(:,i),location_file);
        %     title(['Media Task RH from Session' num2str(i)])
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%MEDIA POTENZA ELETTRODI:
media_EEG2=mean(finestra_EEG_01_2,1);
for i=1:62
    %media_EEG(i,:)=mean(finestra_EEG_01_2(i,:));
    media_EEG(i,:)=mean(finestra_EEG_01_2,1);
    
end
% TOPOPLOT 2D %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

i=1;
topoplot(media_EEG(:,1),location_file);
title(['Media from Session' num2str(i)  ' Trial' num2str(i)])


