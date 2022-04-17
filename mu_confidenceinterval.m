clear; clc;

data=load('forestfires.dat');
length_data=length(data);
count1=0;
count2=0;
for i=1:length_data
    if (data(i,13)==0.0)
        count1=count1+1;
        deigmaA(count1,:)=data(i,:);
    else
        count2=count2+1;
        deigmaB(count2,:)=data(i,:);
    end
end

%% Confidence interval of the difference of mean values between samples A,B
a=0.05;
% Temperature
mvA9=mean(deigmaA(:,9));
[h,p,ciA9]=ttest(deigmaA(:,9),mvA9,a);
fprintf(['Confidence interval for the average temperature value ',...
    'in sample A is:\n']);
fprintf('ciA9=%f   ',ciA9);

mvB9=mean(deigmaB(:,9));
[h,p,ciB9]=ttest(deigmaB(:,9),mvB9,a);
fprintf(['\nConfidence interval for the average temperature value ',...
    'in sample B is:\n']);
fprintf('ciB9=%f   ',ciB9);
fprintf(['\nConfidence interval for the differnce in the mean values ',...
    'of temperature in samples A,B is:\n']);
fprintf('|ciA9-ciB9|=%f\n',abs(ciA9-ciB9));
fprintf('\n');

% Relative Humidity
mvA10=mean(deigmaA(:,10));
[h,p,ciA10]=ttest(deigmaA(:,10),mvA10,a);
fprintf(['Confidence interval for the average relative humidity ',...
    'value in sample A is:\n']);
fprintf('ciA10=%f   ',ciA10);

mvB10=mean(deigmaB(:,10));
[h,p,ciB10]=ttest(deigmaB(:,10),mvB10,a);
fprintf(['\nConfidence interval for the average relative humidity ',...
    'value in sample B is:\n']);
fprintf('ciB10=%f   ',ciB10);
fprintf(['\nConfidence interval for the differnce in the mean values ',...
    'of relative humidity in samples A,B is:\n']);
fprintf('|ciA10-ciB10|=%f\n',abs(ciA10-ciB10));
fprintf('\n');

% Wind Speed
mvA11=mean(deigmaA(:,11));
[h,p,ciA11]=ttest(deigmaA(:,11),mvA11,a);
fprintf(['Confidence interval for the average wind speed value ',...
    'in sample A is:\n']);
fprintf('ciA11=%f   ',ciA11);

mvB11=mean(deigmaB(:,11));
[h,p,ciB11]=ttest(deigmaB(:,11),mvB11,a);
fprintf(['\nConfidence interval for the average wind speed value ',...
    'in sample B is:\n']);
fprintf('ciB11=%f   ',ciB11)
fprintf(['\nConfidence interval for the differnce in the mean values ',...
    'of wind speed in samples A,B is:\n']);
fprintf('|ciA11-ciB11|=%f\n',abs(ciA11-ciB11));
fprintf('\n\n');

%% Difference in confidence intervals of 50 samples on burned and non burned areas
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

% Temperature
mvMA9=sumMA9/M;
[h,p,ciMA9]=ttest(mvsampleA9(:,1),mvMA9,a);
fprintf(['Confidence interval for the average of temperature ',...
    'mean values of Μ=%d samples from sample A is:\n'],M);
fprintf('ciMA9=%f   ',ciMA9);

mvMB9=sumMB9/M;
[h,p,ciMB9]=ttest(mvsampleB9(:,1),mvMB9,a);
fprintf(['\nConfidence interval for the average of temperature ',...
    'mean values of Μ=%d samples from sample B is:\n'],M);
fprintf('ciMB9=%f   ',ciMB9);
fprintf(['\nConfidence interval for the differnce in the mean values ',...
    'of temperature for M=50 subsets of samples A,B is:\n']);
fprintf('|ciMA9-ciMB9|=%f\n',abs(ciMA9-ciMB9));
fprintf('\n');

%Relative Humidity
mvMA10=sumMA10/M;
[h,p,ciMA10]=ttest(mvsampleA10(:,1),mvMA10,a);
fprintf(['Confidence interval for the average of relative humidity ',...
    'mean values of Μ=%d samples from sample A is:\n'],M);
fprintf('ciMA10=%f   ',ciMA10);

mvMB10=sumMB10/M;
[h,p,ciMB10]=ttest(mvsampleB10(:,1),mvMB10,a);
fprintf(['\nConfidence interval for the average of relative humidity ',...
    'mean values of Μ=%d samples from sample B is:\n'],M);
fprintf('ciMB10=%f   ',ciMB10);
fprintf(['\nConfidence interval for the differnce in the mean values ',...
    'of relarive humidity for M=50 subsets of samples A,B is:\n']);
fprintf('|ciMA10-ciMB10|=%f\n',abs(ciMA10-ciMB10));
fprintf('\n');

%Wind Speed
mvMA11=sumMA11/M;
[h,p,ciMA11]=ttest(mvsampleA11(:,1),mvMA11,a);
fprintf(['Confidence interval for the average of wind speed ',...
    'mean values of Μ=%d samples from sample A is:\n'],M);
fprintf('ciMA11=%f   ',ciMA11);

mvMB11=sumMB11/M;
[h,p,ciMB11]=ttest(mvsampleB11(:,1),mvMB11,a);
fprintf(['\nConfidence interval for the average of wind speed ',...
    'mean values of Μ=%d samples from sample B is:\n'],M);
fprintf('ciMB11=%f   ',ciMB11);
fprintf(['\nConfidence interval for the differnce in the mean values ',...
    'of wind speed for M=50 subsets of samples A,B is:\n']);
fprintf('|ciMA11-ciMB11|=%f\n',abs(ciMA11-ciMB11));
