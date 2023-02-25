
%CREO CARTELLA PER IL SINGOLO SOGGETTO
cd('/Users/nicolavacalebre/Desktop/NewDataset2');
mkdir labels

%Carico workspace
load('/Users/nicolavacalebre/Desktop/Soggeto1/S1_Session_1');


%%%CREAZIONE STRUCT CON ETICHETTE%%%%%%%%%%%%%%%%%%
label=[BCI.TrialData.result]; %vettore etichette

%struct
field1 = 'EEG';  value1 = finestra_EEG_01_2;
field2 = 'label';  value2 = label(1,1);
FinestraEEG = struct(field1,value1,field2,value2);

%Etichette per ogni sessione%%%%%%%%%%%%%%%

for i=1:11
    
    radice_nome_file='/Users/nicolavacalebre/Desktop/Soggeto1/S1_Session_';
    file_name=[radice_nome_file num2str(i)];
    
    load(file_name);
    
    label=[BCI.TrialData.result]; %vettore etichette
    
    %Salvataggio
    percorso_preproc='/Users/nicolavacalebre/Desktop/NewDataset2/labels/';
    nuovafinestra=(['label_Session' num2str(i) '.mat']);
    
    save([percorso_preproc   nuovafinestra],'label');
    
    clear('label');
    
end


%struct per ogni file EEG

%CREO CARTELLA PER IL SINGOLO SOGGETTO
cd('/Users/nicolavacalebre/Desktop/NewDataset2/');
if ~exist('S1_Struct', 'dir')
    mkdir S1_Struct;
end

% CREO LE CARTELLE PER SALVARE I NUOVI FILE %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
cd('/Users/nicolavacalebre/Desktop/NewDataset2/S1_Struct/');
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

% explore the variables in the workspace
% explore the locfile
percorso_preproc1='/Users/nicolavacalebre/Desktop/NewDataset2/S1_Struct/1-RH/S1_Session';
percorso_preproc2='/Users/nicolavacalebre/Desktop/NewDataset2/S1_Struct/2-LH/S1_Session';
percorso_preproc3='/Users/nicolavacalebre/Desktop/NewDataset2/S1_Struct/3-UP/S1_Session';
percorso_preproc4='/Users/nicolavacalebre/Desktop/NewDataset2/S1_Struct/4-DOWN/S1_Session';


%For 1-RH
for i=1:11
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % Subject code (stringa che identifica il codice del soggetto)
    sub=i; % soggetto 1
    
    subject=(num2str(sub));
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    num_trials=450;
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % LA PROCEDURA VA RIPETUTA PER OGNI SESSIONE
    for cont=1:num_trials     % current trial
        
        
        
        file_name=[radice_nome_file1 num2str(i) partemedia_file num2str(cont) suffisso_file];
        if exist(file_name, 'file')
            importdata(file_name);
            
            finestra_EEG_01_2=ans;
            
            if (i==1)
                %Carico workspace
                load('/Users/nicolavacalebre/Desktop/Soggeto1/S1_Session_1');
            elseif (i==2)
                %Carico workspace
                load('/Users/nicolavacalebre/Desktop/Soggeto1/S1_Session_2');
            elseif (i==3)
                %Carico workspace
                load('/Users/nicolavacalebre/Desktop/Soggeto1/S1_Session_3');
            elseif (i==4)
                %Carico workspace
                load('/Users/nicolavacalebre/Desktop/Soggeto1/S1_Session_4');
            elseif (i==5)
                %Carico workspace
                load('/Users/nicolavacalebre/Desktop/Soggeto1/S1_Session_5');
            elseif (i==6)
                %Carico workspace
                load('/Users/nicolavacalebre/Desktop/Soggeto1/S1_Session_6');
            elseif (i==7)
                %Carico workspace
                load('/Users/nicolavacalebre/Desktop/Soggeto1/S1_Session_7');
            elseif (i==8)
                %Carico workspace
                load('/Users/nicolavacalebre/Desktop/Soggeto1/S1_Session_8');
            elseif (i==9)
                %Carico workspace
                load('/Users/nicolavacalebre/Desktop/Soggeto1/S1_Session_9');
            elseif (i==10)
                %Carico workspace
                load('/Users/nicolavacalebre/Desktop/Soggeto1/S1_Session_10');
            elseif (i==11)
                %Carico workspace
                load('/Users/nicolavacalebre/Desktop/Soggeto1/S1_Session_11');
                
            end
            
            label=[BCI.TrialData.result]; %vettore etichette
            
            
            %struct
            field1 = 'EEG';  value1 = finestra_EEG_01_2;
            field2 = 'label';  value2 = label(1,2);
            FinestraEEG = struct(field1,value1,field2,value2);
            
            
            
            
            
            %%%%%%%%%%SALVATAGGIO %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            
            nuovafinestra=([subject '_EEG' num2str(cont) '.mat']);
            
            save([percorso_preproc1   nuovafinestra],'FinestraEEG');
            
            clear('finestra_EEG','label');
        end
        
        
    end
    
    
end

%For 2-LH
for i=1:11
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % Subject code (stringa che identifica il codice del soggetto)
    sub=i; % soggetto 1
    
    subject=(num2str(sub));
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    num_trials=450;
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % LA PROCEDURA VA RIPETUTA PER OGNI SESSIONE
    for cont=1:num_trials     % current trial
        
        
        
        file_name=[radice_nome_file2 num2str(i) partemedia_file num2str(cont) suffisso_file];
        if exist(file_name, 'file')
            importdata(file_name);
            
            finestra_EEG_01_2=ans;
            
            if (i==1)
                %Carico workspace
                load('/Users/nicolavacalebre/Desktop/Soggeto1/S1_Session_1');
            elseif (i==2)
                %Carico workspace
                load('/Users/nicolavacalebre/Desktop/Soggeto1/S1_Session_2');
            elseif (i==3)
                %Carico workspace
                load('/Users/nicolavacalebre/Desktop/Soggeto1/S1_Session_3');
            elseif (i==4)
                %Carico workspace
                load('/Users/nicolavacalebre/Desktop/Soggeto1/S1_Session_4');
            elseif (i==5)
                %Carico workspace
                load('/Users/nicolavacalebre/Desktop/Soggeto1/S1_Session_5');
            elseif (i==6)
                %Carico workspace
                load('/Users/nicolavacalebre/Desktop/Soggeto1/S1_Session_6');
            elseif (i==7)
                %Carico workspace
                load('/Users/nicolavacalebre/Desktop/Soggeto1/S1_Session_7');
            elseif (i==8)
                %Carico workspace
                load('/Users/nicolavacalebre/Desktop/Soggeto1/S1_Session_8');
            elseif (i==9)
                %Carico workspace
                load('/Users/nicolavacalebre/Desktop/Soggeto1/S1_Session_9');
            elseif (i==10)
                %Carico workspace
                load('/Users/nicolavacalebre/Desktop/Soggeto1/S1_Session_10');
            elseif (i==11)
                %Carico workspace
                load('/Users/nicolavacalebre/Desktop/Soggeto1/S1_Session_11');
                
            end
            
            label=[BCI.TrialData.result]; %vettore etichette
            
            
            %struct
            field1 = 'EEG';  value1 = finestra_EEG_01_2;
            field2 = 'label';  value2 = label(1,2);
            FinestraEEG = struct(field1,value1,field2,value2);
            
            
            
            
            
            %%%%%%%%%%SALVATAGGIO %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            
            nuovafinestra=([subject '_EEG' num2str(cont) '.mat']);
            
            save([percorso_preproc2   nuovafinestra],'FinestraEEG');
            
            clear('finestra_EEG','label');
        end
        
        
    end
    
    
end

%For 3-UP
for i=1:11
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % Subject code (stringa che identifica il codice del soggetto)
    sub=i; % soggetto 1
    
    subject=(num2str(sub));
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    num_trials=450;
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % LA PROCEDURA VA RIPETUTA PER OGNI SESSIONE
    for cont=1:num_trials     % current trial
        
        
        
        file_name=[radice_nome_file3 num2str(i) partemedia_file num2str(cont) suffisso_file];
        if exist(file_name, 'file')
            importdata(file_name);
            
            finestra_EEG_01_2=ans;
            
            if (i==1)
                %Carico workspace
                load('/Users/nicolavacalebre/Desktop/Soggeto1/S1_Session_1');
            elseif (i==2)
                %Carico workspace
                load('/Users/nicolavacalebre/Desktop/Soggeto1/S1_Session_2');
            elseif (i==3)
                %Carico workspace
                load('/Users/nicolavacalebre/Desktop/Soggeto1/S1_Session_3');
            elseif (i==4)
                %Carico workspace
                load('/Users/nicolavacalebre/Desktop/Soggeto1/S1_Session_4');
            elseif (i==5)
                %Carico workspace
                load('/Users/nicolavacalebre/Desktop/Soggeto1/S1_Session_5');
            elseif (i==6)
                %Carico workspace
                load('/Users/nicolavacalebre/Desktop/Soggeto1/S1_Session_6');
            elseif (i==7)
                %Carico workspace
                load('/Users/nicolavacalebre/Desktop/Soggeto1/S1_Session_7');
            elseif (i==8)
                %Carico workspace
                load('/Users/nicolavacalebre/Desktop/Soggeto1/S1_Session_8');
            elseif (i==9)
                %Carico workspace
                load('/Users/nicolavacalebre/Desktop/Soggeto1/S1_Session_9');
            elseif (i==10)
                %Carico workspace
                load('/Users/nicolavacalebre/Desktop/Soggeto1/S1_Session_10');
            elseif (i==11)
                %Carico workspace
                load('/Users/nicolavacalebre/Desktop/Soggeto1/S1_Session_11');
                
            end
            
            label=[BCI.TrialData.result]; %vettore etichette
            
            
            %struct
            field1 = 'EEG';  value1 = finestra_EEG_01_2;
            field2 = 'label';  value2 = label(1,2);
            FinestraEEG = struct(field1,value1,field2,value2);
            
            
            
            
            
            %%%%%%%%%%SALVATAGGIO %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            
            nuovafinestra=([subject '_EEG' num2str(cont) '.mat']);
            
            save([percorso_preproc3   nuovafinestra],'FinestraEEG');
            
            clear('finestra_EEG','label');
        end
        
        
    end
    
    
end

%For 4-DOWN
for i=1:11
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % Subject code (stringa che identifica il codice del soggetto)
    sub=i; % soggetto 1
    
    subject=(num2str(sub));
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    num_trials=450;
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % LA PROCEDURA VA RIPETUTA PER OGNI SESSIONE
    for cont=1:num_trials     % current trial
        
        
        
        file_name=[radice_nome_file4 num2str(i) partemedia_file num2str(cont) suffisso_file];
        if exist(file_name, 'file')
            importdata(file_name);
            
            finestra_EEG_01_2=ans;
            
            if (i==1)
                %Carico workspace
                load('/Users/nicolavacalebre/Desktop/Soggeto1/S1_Session_1');
            elseif (i==2)
                %Carico workspace
                load('/Users/nicolavacalebre/Desktop/Soggeto1/S1_Session_2');
            elseif (i==3)
                %Carico workspace
                load('/Users/nicolavacalebre/Desktop/Soggeto1/S1_Session_3');
            elseif (i==4)
                %Carico workspace
                load('/Users/nicolavacalebre/Desktop/Soggeto1/S1_Session_4');
            elseif (i==5)
                %Carico workspace
                load('/Users/nicolavacalebre/Desktop/Soggeto1/S1_Session_5');
            elseif (i==6)
                %Carico workspace
                load('/Users/nicolavacalebre/Desktop/Soggeto1/S1_Session_6');
            elseif (i==7)
                %Carico workspace
                load('/Users/nicolavacalebre/Desktop/Soggeto1/S1_Session_7');
            elseif (i==8)
                %Carico workspace
                load('/Users/nicolavacalebre/Desktop/Soggeto1/S1_Session_8');
            elseif (i==9)
                %Carico workspace
                load('/Users/nicolavacalebre/Desktop/Soggeto1/S1_Session_9');
            elseif (i==10)
                %Carico workspace
                load('/Users/nicolavacalebre/Desktop/Soggeto1/S1_Session_10');
            elseif (i==11)
                %Carico workspace
                load('/Users/nicolavacalebre/Desktop/Soggeto1/S1_Session_11');
                
            end
            
            label=[BCI.TrialData.result]; %vettore etichette
            
            
            %struct
            field1 = 'EEG';  value1 = finestra_EEG_01_2;
            field2 = 'label';  value2 = label(1,2);
            FinestraEEG = struct(field1,value1,field2,value2);
            
            
            
            
            
            %%%%%%%%%%SALVATAGGIO %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            
            nuovafinestra=([subject '_EEG' num2str(cont) '.mat']);
            
            save([percorso_preproc4   nuovafinestra],'FinestraEEG');
            
            clear('finestra_EEG','label');
        end
        
        
    end
    
    
end

%%%%%%%SOSTITUZIONE VETTORE ETICHETTE VALORI NAN CON 0%%%%%%%
label1=[BCI.TrialData.result]; %vettore etichette

for i=1:length(label1)
    if(isnan(label1(1,i)))
        label1(1,i)=0;
    end
end

file='/Users/nicolavacalebre/Desktop/NewDataset2/labels/label_Session';
radice_file='.mat';
for i=1:11
    nome_file=[file num2str(i) radice_file];
    
    load(nome_file);
    
    label1=label;
    
    
    for j=1:length(label1)
        if(isnan(label1(1,j)))
            label1(1,j)=0;
        end
    end
    
    
    %Salvataggio
    percorso_preproc='/Users/nicolavacalebre/Desktop/NewDataset2/labels/';
    nuovafinestra=(['label_Session' num2str(i) '.mat']);
    
    save([percorso_preproc   nuovafinestra],'label1');
    
    clear('label');
    
    
    
end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%DIVISIONE IN BASE ALLE LABELS IN 4 CATEGORIE(LH,RH,UP,DOWN,FAILURE)%%%%%%
%CREO CARTELLA PER IL SINGOLO SOGGETTO
cd('/Users/nicolavacalebre/Desktop/NewDataset2');
mkdir S1_final

cd('/Users/nicolavacalebre/Desktop/NewDataset2/S1_final');
mkdir S1_lapl
mkdir S1

% CREO LE CARTELLE PER SALVARE I NUOVI FILE %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
cd('/Users/nicolavacalebre/Desktop/NewDataset2/S1_final/S1_lapl/');
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

% CREO LE CARTELLE PER SALVARE I NUOVI FILE %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
cd('/Users/nicolavacalebre/Desktop/NewDataset2/S1_final/S1/');
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

% % CARICO IL WORKSPACE %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% radice_nome_file1='/Users/nicolavacalebre/Desktop/NewDataset2/S1_RESAMPLING/1-RH/S1_Session_';
% radice_nome_file2='/Users/nicolavacalebre/Desktop/NewDataset2/S1_RESAMPLING/2-LH/S1_Session_';
% radice_nome_file3='/Users/nicolavacalebre/Desktop/NewDataset2/S1_RESAMPLING/3-UP/S1_Session_';
% radice_nome_file4='/Users/nicolavacalebre/Desktop/NewDataset2/S1_RESAMPLING/4-DOWN/S1_Session_';
% partemedia_file='_EEG';
% suffisso_file='.mat';

% CARICO IL WORKSPACE %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
radice_nome_file1='/Users/nicolavacalebre/Desktop/NewDataset2/S1_LAPL/1-RH/S1_Session_';
radice_nome_file2='/Users/nicolavacalebre/Desktop/NewDataset2/S1_LAPL/2-LH/S1_Session_';
radice_nome_file3='/Users/nicolavacalebre/Desktop/NewDataset2/S1_LAPL/3-UP/S1_Session_';
radice_nome_file4='/Users/nicolavacalebre/Desktop/NewDataset2/S1_LAPL/4-DOWN/S1_Session_';
partemedia_file='_EEG';
suffisso_file='.mat';

% explore the variables in the workspace
% explore the locfile
percorso_preproc1='/Users/nicolavacalebre/Desktop/NewDataset2/S1_final/S1_lapl/RH/S1_Session';
percorso_preproc2='/Users/nicolavacalebre/Desktop/NewDataset2/S1_final/S1_lapl/LH/S1_Session';
percorso_preproc3='/Users/nicolavacalebre/Desktop/NewDataset2/S1_final/S1_lapl/UP/S1_Session';
percorso_preproc4='/Users/nicolavacalebre/Desktop/NewDataset2/S1_final/S1_lapl/DOWN/S1_Session';
percorso_preproc5='/Users/nicolavacalebre/Desktop/NewDataset2/S1_final/S1_lapl/FAILURE/S1_Session';

% % explore the variables in the workspace
% % explore the locfile
% percorso_preproc1='/Users/nicolavacalebre/Desktop/NewDataset2/S1_final/S1/RH/S1_Session';
% percorso_preproc2='/Users/nicolavacalebre/Desktop/NewDataset2/S1_final/S1/LH/S1_Session';
% percorso_preproc3='/Users/nicolavacalebre/Desktop/NewDataset2/S1_final/S1/UP/S1_Session';
% percorso_preproc4='/Users/nicolavacalebre/Desktop/NewDataset2/S1_final/S1/DOWN/S1_Session';
% percorso_preproc5='/Users/nicolavacalebre/Desktop/NewDataset2/S1_final/S1/FAILURE/S1_Session';



%For RH
for i=1:11
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % Subject code (stringa che identifica il codice del soggetto)
    sub=i; % soggetto 1
    
    subject=(num2str(sub));
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    num_trials=450;
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % LA PROCEDURA VA RIPETUTA PER OGNI SESSIONE
    for cont=1:num_trials     % current trial
        
        
        
        file_name=[radice_nome_file1 num2str(i) partemedia_file num2str(cont) suffisso_file];
        if exist(file_name, 'file')
            importdata(file_name);
            
            finestra_EEG_01_2=ans;
            
            if (i==1)
                %Carico workspace
                load('/Users/nicolavacalebre/Desktop/NewDataset2/labels/label_Session1.mat');
            elseif (i==2)
                %Carico workspace
                load('/Users/nicolavacalebre/Desktop/NewDataset2/labels/label_Session2.mat');
            elseif (i==3)
                %Carico workspace
                load('/Users/nicolavacalebre/Desktop/NewDataset2/labels/label_Session3.mat');
            elseif (i==4)
                %Carico workspace
                load('/Users/nicolavacalebre/Desktop/NewDataset2/labels/label_Session4.mat');
            elseif (i==5)
                %Carico workspace
                load('/Users/nicolavacalebre/Desktop/NewDataset2/labels/label_Session5.mat');
            elseif (i==6)
                %Carico workspace
                load('/Users/nicolavacalebre/Desktop/NewDataset2/labels/label_Session6.mat');
            elseif (i==7)
                %Carico workspace
                load('/Users/nicolavacalebre/Desktop/NewDataset2/labels/label_Session7.mat');
            elseif (i==8)
                %Carico workspace
                load('/Users/nicolavacalebre/Desktop/NewDataset2/labels/label_Session8.mat');
            elseif (i==9)
                %Carico workspace
                load('/Users/nicolavacalebre/Desktop/NewDataset2/labels/label_Session9.mat');
            elseif (i==10)
                %Carico workspace
                load('/Users/nicolavacalebre/Desktop/NewDataset2/labels/label_Session10.mat');
            elseif (i==11)
                %Carico workspace
                load('/Users/nicolavacalebre/Desktop/NewDataset2/labels/label_Session11.mat');
                
            end
            
            
            
            nuovafinestra=([subject '_EEG' num2str(cont) '.mat']);
            
            if(label1(1,cont)==1)
                save([percorso_preproc1   nuovafinestra],'finestra_EEG_01_2');
            else
                save([percorso_preproc5   nuovafinestra],'finestra_EEG_01_2');
            end
            
            
            clear('finestra_EEG_01_2','label');
        end
        
        
    end
    
    
end

%For LH
for i=1:11
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % Subject code (stringa che identifica il codice del soggetto)
    sub=i; % soggetto 1
    
    subject=(num2str(sub));
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    num_trials=450;
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % LA PROCEDURA VA RIPETUTA PER OGNI SESSIONE
    for cont=1:num_trials     % current trial
        
        
        
        file_name=[radice_nome_file2 num2str(i) partemedia_file num2str(cont) suffisso_file];
        if exist(file_name, 'file')
            importdata(file_name);
            
            finestra_EEG_01_2=ans;
            
            if (i==1)
                %Carico workspace
                load('/Users/nicolavacalebre/Desktop/NewDataset2/labels/label_Session1.mat');
            elseif (i==2)
                %Carico workspace
                load('/Users/nicolavacalebre/Desktop/NewDataset2/labels/label_Session2.mat');
            elseif (i==3)
                %Carico workspace
                load('/Users/nicolavacalebre/Desktop/NewDataset2/labels/label_Session3.mat');
            elseif (i==4)
                %Carico workspace
                load('/Users/nicolavacalebre/Desktop/NewDataset2/labels/label_Session4.mat');
            elseif (i==5)
                %Carico workspace
                load('/Users/nicolavacalebre/Desktop/NewDataset2/labels/label_Session5.mat');
            elseif (i==6)
                %Carico workspace
                load('/Users/nicolavacalebre/Desktop/NewDataset2/labels/label_Session6.mat');
            elseif (i==7)
                %Carico workspace
                load('/Users/nicolavacalebre/Desktop/NewDataset2/labels/label_Session7.mat');
            elseif (i==8)
                %Carico workspace
                load('/Users/nicolavacalebre/Desktop/NewDataset2/labels/label_Session8.mat');
            elseif (i==9)
                %Carico workspace
                load('/Users/nicolavacalebre/Desktop/NewDataset2/labels/label_Session9.mat');
            elseif (i==10)
                %Carico workspace
                load('/Users/nicolavacalebre/Desktop/NewDataset2/labels/label_Session10.mat');
            elseif (i==11)
                %Carico workspace
                load('/Users/nicolavacalebre/Desktop/NewDataset2/labels/label_Session11.mat');
                
            end
            
            
            
            nuovafinestra=([subject '_EEG' num2str(cont) '.mat']);
            
            if(label1(1,cont)==1)
                save([percorso_preproc2   nuovafinestra],'finestra_EEG_01_2');
            else
                save([percorso_preproc5   nuovafinestra],'finestra_EEG_01_2');
            end
            
            
            clear('finestra_EEG_01_2','label');
        end
        
        
    end
    
    
end

%For UP
for i=1:11
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % Subject code (stringa che identifica il codice del soggetto)
    sub=i; % soggetto 1
    
    subject=(num2str(sub));
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    num_trials=450;
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % LA PROCEDURA VA RIPETUTA PER OGNI SESSIONE
    for cont=1:num_trials     % current trial
        
        
        
        file_name=[radice_nome_file3 num2str(i) partemedia_file num2str(cont) suffisso_file];
        if exist(file_name, 'file')
            importdata(file_name);
            
            finestra_EEG_01_2=ans;
            
            if (i==1)
                %Carico workspace
                load('/Users/nicolavacalebre/Desktop/NewDataset2/labels/label_Session1.mat');
            elseif (i==2)
                %Carico workspace
                load('/Users/nicolavacalebre/Desktop/NewDataset2/labels/label_Session2.mat');
            elseif (i==3)
                %Carico workspace
                load('/Users/nicolavacalebre/Desktop/NewDataset2/labels/label_Session3.mat');
            elseif (i==4)
                %Carico workspace
                load('/Users/nicolavacalebre/Desktop/NewDataset2/labels/label_Session4.mat');
            elseif (i==5)
                %Carico workspace
                load('/Users/nicolavacalebre/Desktop/NewDataset2/labels/label_Session5.mat');
            elseif (i==6)
                %Carico workspace
                load('/Users/nicolavacalebre/Desktop/NewDataset2/labels/label_Session6.mat');
            elseif (i==7)
                %Carico workspace
                load('/Users/nicolavacalebre/Desktop/NewDataset2/labels/label_Session7.mat');
            elseif (i==8)
                %Carico workspace
                load('/Users/nicolavacalebre/Desktop/NewDataset2/labels/label_Session8.mat');
            elseif (i==9)
                %Carico workspace
                load('/Users/nicolavacalebre/Desktop/NewDataset2/labels/label_Session9.mat');
            elseif (i==10)
                %Carico workspace
                load('/Users/nicolavacalebre/Desktop/NewDataset2/labels/label_Session10.mat');
            elseif (i==11)
                %Carico workspace
                load('/Users/nicolavacalebre/Desktop/NewDataset2/labels/label_Session11.mat');
                
            end
            
            
            
            nuovafinestra=([subject '_EEG' num2str(cont) '.mat']);
            
            if(label1(1,cont)==1)
                save([percorso_preproc3   nuovafinestra],'finestra_EEG_01_2');
            else
                save([percorso_preproc5   nuovafinestra],'finestra_EEG_01_2');
            end
            
            
            clear('finestra_EEG_01_2','label');
        end
        
        
    end
    
    
end

%For DOWN
for i=1:11
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % Subject code (stringa che identifica il codice del soggetto)
    sub=i; % soggetto 1
    
    subject=(num2str(sub));
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    num_trials=450;
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % LA PROCEDURA VA RIPETUTA PER OGNI SESSIONE
    for cont=1:num_trials     % current trial
        
        
        
        file_name=[radice_nome_file4 num2str(i) partemedia_file num2str(cont) suffisso_file];
        if exist(file_name, 'file')
            importdata(file_name);
            
            finestra_EEG_01_2=ans;
            
            if (i==1)
                %Carico workspace
                load('/Users/nicolavacalebre/Desktop/NewDataset2/labels/label_Session1.mat');
            elseif (i==2)
                %Carico workspace
                load('/Users/nicolavacalebre/Desktop/NewDataset2/labels/label_Session2.mat');
            elseif (i==3)
                %Carico workspace
                load('/Users/nicolavacalebre/Desktop/NewDataset2/labels/label_Session3.mat');
            elseif (i==4)
                %Carico workspace
                load('/Users/nicolavacalebre/Desktop/NewDataset2/labels/label_Session4.mat');
            elseif (i==5)
                %Carico workspace
                load('/Users/nicolavacalebre/Desktop/NewDataset2/labels/label_Session5.mat');
            elseif (i==6)
                %Carico workspace
                load('/Users/nicolavacalebre/Desktop/NewDataset2/labels/label_Session6.mat');
            elseif (i==7)
                %Carico workspace
                load('/Users/nicolavacalebre/Desktop/NewDataset2/labels/label_Session7.mat');
            elseif (i==8)
                %Carico workspace
                load('/Users/nicolavacalebre/Desktop/NewDataset2/labels/label_Session8.mat');
            elseif (i==9)
                %Carico workspace
                load('/Users/nicolavacalebre/Desktop/NewDataset2/labels/label_Session9.mat');
            elseif (i==10)
                %Carico workspace
                load('/Users/nicolavacalebre/Desktop/NewDataset2/labels/label_Session10.mat');
            elseif (i==11)
                %Carico workspace
                load('/Users/nicolavacalebre/Desktop/NewDataset2/labels/label_Session11.mat');
                
            end
            
            
            
            nuovafinestra=([subject '_EEG' num2str(cont) '.mat']);
            
            if(label1(1,cont)==1)
                save([percorso_preproc4   nuovafinestra],'finestra_EEG_01_2');
            else
                save([percorso_preproc5   nuovafinestra],'finestra_EEG_01_2');
            end
            
            
            clear('finestra_EEG_01_2','label');
        end
        
        
    end
    
    
end
