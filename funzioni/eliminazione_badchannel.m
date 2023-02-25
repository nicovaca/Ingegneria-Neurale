function [EEG_elch]=eliminazione_badchannel(EEG, i)



% Descrizione Tabella------------------------
% prima colonna: numero di elettrodi limitrofi
% seconda colonna: elettrodo di interesse
% terza, quarta, quinta e sesta colonna: elettrodi che circondano quello
% di interesse

Tabella=[2	 1	2	4	0	0;
    2	2	1	3	0	0;
    2	3	2	5	0	0;
    2	4	1	8	0	0;
    2	5	2	12	0	0;
    3	6	1	15	7	0;
    4	7	6	16	8	4;
    4	8	4	7	17	9;
    4	9	8	10	18	4;
    3	10	9	11	19	0;
    4	11	10	12	20	5;
    4	12	11	13	5	21;
    4	13	12	14	5	22;
    3	14	13	3	23	0;
    3	15	6	24	16	0;
    4	16	15	7	17	25;
    4	17	16	8	18	26;
    4	18	9	17	19	27;
    4	19	10	18	20	28;
    4	20	19	11	21	29;
    4	21	20	12	22	30;
    4	22	21	13	23	31;
    3	23	14	32	22	0;
    3	24	15	33	25	0;
    4	25	24	16	26	34;
    4	26	17	25	27	35;
    4	27	26	18	28	36;
    4	28	27	19	29	37;
    4	29	20	28	38	30;
    4	30	21	29	31	39;
    4	31	30	22	32	40;
    3	32	23	31	41	0;
    3	33	24	34	42	0;
    4	34	33	35	25	43;
    4	35	36	34	26	44;
    4	36	35	37	27	45;
    4	37	36	38	28	46;
    4	38	37	39	29	47;
    4	39	37	40	30	48;
    4	40	39	31	41	49;
    3	41	32	40	50	0;
    3	42	33	43	51	0;
    4	43	42	34	44	52;
    4	44	35	43	45	53;
    4	45	44	36	46	53;
    4	46	45	37	47	54;
    4	47	46	38	48	55;
    4	48	47	39	49	56;
    4	49	48	40	50	56;
    3	50	41	49	57	0;
    3	51	42	59	52	0;
    3	52	51	43	53	0;
    4	53	52	44	54	59;
    4	54	53	55	60	46;
    4	55	56	54	48	61;
    3	56	51	55	49	0;
    3	57	50	56	61	0;
    3	58	60	59	42	0;
    3	59	51	60	53	0;
    3	60	54	61	59	0;
    3	61	60	55	51	0;
    3	62	61	60	50	0];



% dato l'elettrodo principale "i":
ele_princ=i; % elettrodo principale

num_neigh=Tabella(i,1); % determino il numero di elettrodi limitrofi

ele1=Tabella(i,3); % elettrodo limitrofo 1
ele2=Tabella(i,4); % elettrodo limitrofo 2
ele3=Tabella(i,5); % elettrodo limitrofo 3
ele4=Tabella(i,6); % elettrodo limitrofo 4

EEG_elch=EEG;


if (num_neigh==4)
    EEG_elch(ele_princ,:)=(EEG(ele1,:)+EEG(ele2,:)+EEG(ele3,:)+EEG(ele4,:))/4;
elseif(num_neigh==3)
    EEG_elch(ele_princ,:)=(EEG(ele1,:)+EEG(ele2,:)+EEG(ele3,:))/3;
elseif(num_neigh==2)
    EEG_elch(ele_princ,:)= (EEG(ele1,:)+EEG(ele2,:))/2;
    
end




    

