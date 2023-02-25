
clear all
clc
close all


% LAUNCH EEGLAB %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
cd '/Users/nicolavacalebre/Desktop/Principi Ingegneria Neurale/eeglab2022.1/eeglab2022.1';
eeglab
close all;

% CARICO IL WORKSPACE %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%radice_nome_file='/Users/nicolavacalebre/Desktop/Soggetto1/S1_Session_1';
radice_nome_file='/Users/nicolavacalebre/Desktop/S1/1-RH/S1_Session_';
% radice_nome_file2='/Users/nicolavacalebre/Desktop/S1/2-LH/S1_Session_';
% radice_nome_file3='/Users/nicolavacalebre/Desktop/S1/3-UP/S1_Session_';
% radice_nome_file4='/Users/nicolavacalebre/Desktop/S1/4-DOWN/S1_Session_';
%radice_nome_file='/Users/nicolavacalebre/Desktop/NewDataset2/S1_FILTERING/1-RH_FILTERING/S1_Session_';

partemedia_file='_EEG';
suffisso_file='.mat';
%suffisso_file='_filtrata.mat';

location_file = '/Users/nicolavacalebre/Desktop/Principi Ingegneria Neurale/channelref.ced';
% sampling frequency
fs=512;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % Subject code (strinmga che identifica il codice del soggetto)

% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

num_trials=450; % in questo dataset ci sono 88 esempi (trial) per classe (Resting/MI mano destra),
% ovvero 88 finestre di tracciato EEG della durata di 1 sec per classe



% %%%%%CALCOLO SCALE
% Example 1: a real wavelet
wname = 'db4';

% Compute the center frequency and display the wavelet function and the associated center frequency based approximation.
iter = 8;
cfreq = centfrq(wname,8,'plot')

%Calcolo da formula matematica
fs=512; %Hz
Ts=1/fs; %Periodo di campionamento
fa=40; %Hz - Frequenza che voglio coprire


fc=cfreq;
a=fc/(Ts * fa) %Calcolo la scala corrispondente
disp(a);



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
            
            % TIME-FREQUENCY ANALYSIS
            
            for i=1:size(finestra_EEG_01_2,1)
                
                x=finestra_EEG_01_2(i,:); % elettrodo (canale i-esimo)
                
                % definisco la famiglia wavelet:
                wname='db4';
                
                % definisco le scale:
                % scales=[2:1:20]; % mu and SMR rhythms
                
                % esempio di scelta delle scale
                scales = [9:1:30 31:5:100 101:10:250 251:30:750]; % corrisponde al range calcolato 0.5-40 Hz (circa)
                
                
                % converto le scale in frequenza:
                freq=scal2frq(scales,wname,1/fs);
                
                % calcolo la CWT (CONTINUOUS WAVELET TRANSFORM)
                [CWT,fxx,COI] = cwt(x,scales,wname,1/fs,'scal',0); % Time-frequency per channel
                
                
                %Spect=spectrogram(finestra_Sorgenti_Prem(chan,:),32,16,'yaxis');
                %                 figure;
                %                 spectrogram(finestra_EEG_01_2(i,:),fs,32,16,'yaxis');
                
                Energia=abs(CWT.*CWT);
                
            end
            
            
        end
        
%         %%%%%%%%%%SALVATAGGIO %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%         percorso_preproc='/Volumes/NikSSD/NewDataset/S1/1-RH/S1_Session_';
%         nuovafinestra=([subject '_EEG' num2str(cont) '.mat']);
%         
%         save([percorso_preproc   nuovafinestra],'[CWT,fxx,COI]');
%         
%         clear('finestra_EEG');
        
    end
    
    
end

% %%%% CONFRONTO LAPLACIANO-NON%%%%%%%%%%%%%%%%%%%%%%
% for i=1:4
%     j=0+i;
%     if (j==1)
%         load('/Users/nicolavacalebre/Desktop/NewDataset2/S1_RESAMPLING/1-RH/S1_Session_1_EEG2.mat');
%         num_chan=26;%C3
%         %canale=chan_Area_Prem(chan,1); % canale corrente dell'area premotoria
%         
%         clear('CWT');
%         [CWT,freqcwt] = cwt_Nadia(finestra_EEG_01_2_resampling(num_chan,:),scales,wname,1/fs) ; % Time-frequency map of channel "chan"
%         
%         
%         WEnergy_3D(:,:,num_chan)=abs(CWT.*CWT); % la mappa bidimensionale viene inserita nella matrice 3D
%         
%     
%     elseif (j==2)
%         load('/Users/nicolavacalebre/Desktop/NewDataset2/S1_LAPL/1-RH/S1_Session_1_EEG2.mat');
%         num_chan=26;%C3
%         %canale=chan_Area_Prem(chan,1); % canale corrente dell'area premotoria
%         
%         clear('CWT');
%         [CWT,freqcwt] = cwt_Nadia(finestra_EEG_lap(num_chan,:),scales,wname,1/fs) ; % Time-frequency map of channel "chan"
%         
%         
%         WEnergy_3D(:,:,num_chan)=abs(CWT.*CWT); % la mappa bidimensionale viene inserita nella matrice 3D
%         
%     
%     elseif (j==3)
%         load('/Users/nicolavacalebre/Desktop/NewDataset2/S1_RESAMPLING/1-RH/S1_Session_1_EEG2.mat');
%         num_chan=30;%C4
%         %canale=chan_Area_Prem(chan,1); % canale corrente dell'area premotoria
%         
%         clear('CWT');
%         [CWT,freqcwt] = cwt_Nadia(finestra_EEG_01_2_resampling(num_chan,:),scales,wname,1/fs) ; % Time-frequency map of channel "chan"
%         
%         
%         WEnergy_3D(:,:,num_chan)=abs(CWT.*CWT); % la mappa bidimensionale viene inserita nella matrice 3D
%     
%     elseif (j==4)
%         load('/Users/nicolavacalebre/Desktop/NewDataset2/S1_LAPL/1-RH/S1_Session_1_EEG2.mat');
%         num_chan=30;%C4
%         %canale=chan_Area_Prem(chan,1); % canale corrente dell'area premotoria
%         
%         clear('CWT');
%         [CWT,freqcwt] = cwt_Nadia(finestra_EEG_lap(num_chan,:),scales,wname,1/fs) ; % Time-frequency map of channel "chan"
%         
%         
%         WEnergy_3D(:,:,num_chan)=abs(CWT.*CWT); % la mappa bidimensionale viene inserita nella matrice 3D
%     end
%     
%     
%         
%         time=(1/fs):(1/fs):round(T);
%         Yticks = 2.^(round(log2(min(fxx))):round(log2(max(fxx))));
%         
%         subplot(2,2,i) % crea 4 subplot, uno per ogni canale
%         
%         imagesc(time,log2(fxx),WEnergy_3D(:,:,num_chan));% crea immagine di CWT^2
%         hold on
%         set(gca,'YLim',log2([min(fxx),max(fxx)]), ...
%             'layer','top', ...
%             'YTick',log2(Yticks(:)), ...
%             'YTickLabel',num2str(sprintf('%.2f\n',Yticks)), ...
%             'layer','top','YDir','normal');
%         xlabel('Time');
%         ylabel('Frequency');
%         set(gca,'Fontsize',8);
%         if(j==1)
%             title('canale C3')
%         end
%         if(j==2)
%             title('canale C3 con laplaciano')
%         end
%         if(j==3)
%             title('canale C4')
%         end
%         if(j==4)
%             title('canale C4 con laplaciano')
%         end
% end
