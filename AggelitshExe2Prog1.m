clear; clc;

data=load('forestfires.dat');
length_data=length(data);
count1=0;
count2=0;
for i=1:length_data
    if (data(i,13)==0.0)
        count1=count1+1;
        deigmaA(count1,:)=data(i,:); %Mi kammenes ektaseis
    else
        count2=count2+1;
        deigmaB(count2,:)=data(i,:); %Kammenes ektaseis
    end
end

%% Diastima empistosinis gia ti diafora twn meswn timwn sta deigmata A,B
a=0.05;
%Temperature
mvA9=mean(deigmaA(:,9));
[h,p,ciA9]=ttest(deigmaA(:,9),mvA9,a);
fprintf(['To diastima empistosinis gia ti mesi timi ths thermokrasias ',...
    'sto deigma A einai:\n']);
fprintf('ciA9=%f   ',ciA9);

mvB9=mean(deigmaB(:,9));
[h,p,ciB9]=ttest(deigmaB(:,9),mvB9,a);
fprintf(['\nTo diastima empistosinis gia ti mesi timi ths thermokrasias ',...
    'sto deigma B einai:\n']);
fprintf('ciB9=%f   ',ciB9);
fprintf(['\nTo diastima empistosinis gia ti diafora twn meswn timwn ',...
    'tis thermokrasias sta deigmata A,B einai:\n']);
fprintf('|ciA9-ciB9|=%f\n',abs(ciA9-ciB9));
fprintf('\n');
% na elegxei h=ttest2(deigmaA(:,9),deigmaB(:,9))

%Relative Humidity
mvA10=mean(deigmaA(:,10));
[h,p,ciA10]=ttest(deigmaA(:,10),mvA10,a);
fprintf(['To diastima empistosinis gia ti mesi timi ths sxetikis ',...
    'ygrasias sto deigma A einai:\n']);
fprintf('ciA10=%f   ',ciA10);

mvB10=mean(deigmaB(:,10));
[h,p,ciB10]=ttest(deigmaB(:,10),mvB10,a);
fprintf(['\nTo diastima empistosinis gia ti mesi timi ths sxetikis ',...
    'ygrasias sto deigma B einai:\n']);
fprintf('ciB10=%f   ',ciB10);
fprintf(['\nTo diastima empistosinis gia ti diafora twn meswn timwn ',...
    'tis sxetikis ygrasias sta deigmata A,B einai:\n']);
fprintf('|ciA10-ciB10|=%f\n',abs(ciA10-ciB10));
fprintf('\n');

%Wind Speed
mvA11=mean(deigmaA(:,11));
[h,p,ciA11]=ttest(deigmaA(:,11),mvA11,a);
fprintf(['To diastima empistosinis gia ti mesi timi ths taxuthtas ',...
    'tou anemou sto deigma A einai:\n']);
fprintf('ciA11=%f   ',ciA11);

mvB11=mean(deigmaB(:,11));
[h,p,ciB11]=ttest(deigmaB(:,11),mvB11,a);
fprintf(['\nTo diastima empistosinis gia ti mesi timi ths taxuthtas ',...
    'tou anemou sto deigma B einai:\n']);
fprintf('ciB11=%f   ',ciB11)
fprintf(['\nTo diastima empistosinis gia ti diafora twn meswn timwn ',...
    'tis taxuthtas tou anemou sta deigmata A,B einai:\n']);
fprintf('|ciA11-ciB11|=%f\n',abs(ciA11-ciB11));
fprintf('\n\n');

%% Diafora diastimatatwn empistosinis twn 50 deigmatwn stis kammenes kai mi perioxes
fprintf('Peirama kai sygkrisi me ta M=50 deigmata\n\n');
M=50;
sumMA9=0;
sumMA10=0;
sumMA11=0;
for i=1:M
    sampleA=datasample(deigmaA,20);
    mvsampleA9(i,1)=mean(sampleA(:,9));
    sumMA9=sumMA9+mvsampleA9(i,1);
    mvsampleA10(i,1)=mean(sampleA(:,10));
    sumMA10=sumMA10+mvsampleA10(i,1);
    mvsampleA11(i,1)=mean(sampleA(:,11));
    sumMA11=sumMA11+mvsampleA11(i,1);
end
sumMB9=0;
sumMB10=0;
sumMB11=0;
for i=1:50
    sampleB=datasample(deigmaB,20);
    mvsampleB9(i,1)=mean(sampleB(:,9));
    sumMB9=sumMB9+mvsampleB9(i,1);
    mvsampleB10(i,1)=mean(sampleB(:,10));
    sumMB10=sumMB10+mvsampleB10(i,1);
    mvsampleB11(i,1)=mean(sampleB(:,11));
    sumMB11=sumMB11+mvsampleB11(i,1);
end

%Briskw ti mesi timi twn meswn timwn twn 50 synolwn,apo ta deigmata A kai B
%gia na brw ta dyo diastima empistosinis kai ti diafora metaxy tous,
%gia kathe deikti

%Temperature
mvMA9=sumMA9/M;
[h,p,ciMA9]=ttest(mvsampleA9(:,1),mvMA9,a);
fprintf(['To diastima empistosinis gia ti mesi timi twn meswn timwn ',...
    'ths thermokrasias gia ta Μ=%d deigmata apo to deigma A einai:\n'],M);
fprintf('ciMA9=%f   ',ciMA9);

mvMB9=sumMB9/M;
[h,p,ciMB9]=ttest(mvsampleB9(:,1),mvMB9,a);
fprintf(['\nTo diastima empistosinis gia ti mesi timi twn meswn timwn ',...
    'ths thermokrasias gia ta Μ=%d deigmata apo to deigma B einai:\n'],M);
fprintf('ciMB9=%f   ',ciMB9);
fprintf(['\nTo diastima empistosinis gia ti diafora twn meswn timwn ',...
    'tis thermokrasias sta M=50 uposunola twn deigmatwn A,B einai:\n']);
fprintf('|ciMA9-ciMB9|=%f\n',abs(ciMA9-ciMB9));
fprintf('\n');

%Relative Humidity
mvMA10=sumMA10/M;
[h,p,ciMA10]=ttest(mvsampleA10(:,1),mvMA10,a);
fprintf(['To diastima empistosinis gia ti mesi timi twn meswn timwn ',...
    'ths sxetikis ygrasias gia ta Μ=%d deigmata apo to deigma A einai:\n'],M);
fprintf('ciMA10=%f   ',ciMA10);

mvMB10=sumMB10/M;
[h,p,ciMB10]=ttest(mvsampleB10(:,1),mvMB10,a);
fprintf(['\nTo diastima empistosinis gia ti mesi timi twn meswn timwn ',...
    'ths sxetikis ygrasias gia ta Μ=%d deigmata apo to deigma B einai:\n'],M);
fprintf('ciMB10=%f   ',ciMB10);
fprintf(['\nTo diastima empistosinis gia ti diafora twn meswn timwn ',...
    'tis sxetikis ygrasias sta M=50 uposunola twn deigmatwn A,B einai:\n']);
fprintf('|ciMA10-ciMB10|=%f\n',abs(ciMA10-ciMB10));
fprintf('\n');

%Wind Speed
mvMA11=sumMA11/M;
[h,p,ciMA11]=ttest(mvsampleA11(:,1),mvMA11,a);
fprintf(['To diastima empistosinis gia ti mesi timi twn meswn timwn ',...
    'ths taxythtas anemou gia ta Μ=%d deigmata apo to deigma A einai:\n'],M);
fprintf('ciMA11=%f   ',ciMA11);

mvMB11=sumMB11/M;
[h,p,ciMB11]=ttest(mvsampleB11(:,1),mvMB11,a);
fprintf(['\nTo diastima empistosinis gia ti mesi timi twn meswn timwn ',...
    'ths taxythtas anemou gia ta Μ=%d deigmata apo to deigma B einai:\n'],M);
fprintf('ciMB11=%f   ',ciMB11);
fprintf(['\nTo diastima empistosinis gia ti diafora twn meswn timwn ',...
    'tis taxythtas anemou sta M=50 uposunola twn deigmatwn A,B einai:\n']);
fprintf('|ciMA11-ciMB11|=%f\n',abs(ciMA11-ciMB11));

%% Symperasma
fprintf('\n\nSYMPERASMA:\n');
fprintf(['\nApo ti sygkrish twn apotelesmatwn twn diasthmatwn empistosunis ',...
    'twn triwn deiktwn, apo ta arxika deigmata A,B kai apo ta\n',...
    'tyxaia 50 yposynola pou ftiaxame mesw autwn, blepoume oti oi times ',...
    'einai poly konta kai ara symfwnoun metaxy tous.']);