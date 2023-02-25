clear all
clc
close all

%DEFINISCO I PARAMETRI PER LEGGERE LA CWT-MAP
% WEnergy_3D2 � la mappa 3D (frequenze x canali x tempo)
% num_chan � il numero di canali
% scales � il vettore delle scale
% fs � la freq di campionamento
% wname � la famiglia wavelet
% fxx � dato da: fxx=scal2frq(scales,wname,1/fs);
% T � lampiezza della finestra EEG, ad esempio: T=1 significa 1 secondo
wname = 'db4';
scales = [9:1:30 31:5:100 101:10:250 251:30:750];% corrisponde al range calcolato 0.5-40 Hz (circa)
T=1; %la durata dei tracciati EEG � di 1s
fs=512; %Hz
fxx=scal2frq(scales,wname,1/fs);
num_chan=(1:62);

%Carico la mappa
load('/home/vacalebre2022/Desktop/DB/RH/S1_Session1_EEG6.mat');


%Creo il video
vw = VideoWriter('wct.avi');
vw.Quality = 100;
vw.FrameRate = 512;
open(vw);
% Animation loop

for j=1:512
    figure(1);
    
    imagesc(num_chan,fxx,WEnergy_3D2(:,:,j));% crea immagine di CWT^2
    xlabel('Channel');
    ylabel('Frequency');
    set(gca,'Fontsize',8);
    title(['Subject1' ' Session1']);
    
end

% Write each frame to video
frame = getframe(gcf);
writeVideo(vw, frame);


% Close video writer
close(vw);