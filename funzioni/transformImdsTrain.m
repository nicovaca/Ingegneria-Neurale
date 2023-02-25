function imdsTrain_mappe = transformImdsTrain(imdsTrain,dirname)

%creo le mappe bidimensionali per addestrare la rete CNN a partire
%dall'imdsTrain
%CREO CARTELLA PER I FILE
cd(dirname);
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
% if ~exist('FAILURE', 'dir')
%     mkdir FAILURE;
% end

cd ('/home/vacalebre2022/Desktop/EegLab/eeglab2022.1/functions');
numFiles=size(imdsTrain.Files,1);
substr1 ='RH';
substr2 ='LH';
substr3 ='UP';
substr4 ='DOWN';
substr5 ='FAILURE';

for i = 1:numFiles
    
    files=imdsTrain.Files(i,1);
    
    matrix3D = readFcn_N(files{1,1});
    
    for j=1:512
        CWT(:,:)=matrix3D(:,:,j);
        
        x1 = contains(files,substr1);
        x2 = contains(files,substr2);
        x3 = contains(files,substr3);
        x4 = contains(files,substr4);
        x5 = contains(files,substr5);
        if x1==1
            percorso_images=[dirname 'RH/file'];
        elseif x2==1 
            percorso_images=[dirname 'LH/file'];
        elseif x3==1
            percorso_images=[dirname 'UP/file'];
        elseif x4==1
            percorso_images=[dirname 'DOWN/file'];
        elseif x5==1
            percorso_images=[dirname 'FAILURE/file'];
        end
        save([percorso_images num2str(i) 'CWT' num2str(j)],'CWT');
    end
    clear('CWT');
end

digitDatasetPath=fullfile(dirname);


imdsTrain_mappe=imageDatastore(digitDatasetPath, 'IncludeSubfolders',true,'ReadFcn', @read3, 'LabelSource','foldernames',"FileExtensions",".mat");


end