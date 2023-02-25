function imdsTest = mappe4DTest(imdsTest,dirname)

%Creo il dataset di test costituito dagli array 4D a partire dall'imdsTest
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
numFiles=size(imdsTest.Files,1);
substr1 ='RH';
substr2 ='LH';
substr3 ='UP';
substr4 ='DOWN';
substr5 ='FAILURE';

for i = 1:numFiles
    
    files=imdsTest.Files(i,1);
    
    matrix3D = readFcn_N(files{1,1});
    
    b = repmat( reshape(matrix3D, size(matrix3D,1), size(matrix3D,2), 1, size(matrix3D,3)), 1, 1, 1, 1);
    
    
    x1 = contains(files,substr1);
    x2 = contains(files,substr2);
    x3 = contains(files,substr3);
    x4 = contains(files,substr4);
    x5 = contains(files,substr5);
    if x1==1
        percorso_images=[dirname 'RH/4D-array'];
    elseif x2==1
        percorso_images=[dirname 'LH/4D-array'];
    elseif x3==1
        percorso_images=[dirname 'UP/4D-array'];
    elseif x4==1
        percorso_images=[dirname 'DOWN/4D-array'];
    elseif x5==1
        percorso_images=[dirname 'FAILURE/4D-array'];
    end
    save([percorso_images num2str(i)],'b');
    
    clear('matrix3D');
end

digitDatasetPath=fullfile(dirname);


imdsTest=imageDatastore(digitDatasetPath, 'IncludeSubfolders',true,'ReadFcn', @b, 'LabelSource','foldernames',"FileExtensions",".mat");


end