clear; clc;

data=load('forestfires.dat');
length_data=length(data);

sample=datasample(data,40);
temp(:,1)=sample(:,9);
rh(:,1)=sample(:,10);
wind(:,1)=sample(:,11);

alpha=0.05;
zcrit = norminv(1-alpha/2);

%% Relative Humidity
[n,m]=size(rh);
k=1;
Y=temp(:,1);
mY=mean(Y);
X1=[ones(n,m) rh];
[b1,b1int,stats1]=regress(Y,X1);
y1=b1(1)+b1(2)*rh;
e1=Y-y1;
se1_2=(1/(n-2))*(sum(e1.^2));
se1=sqrt(se1_2);

R21=1-(sum(e1.^2))/(sum((Y-mY).^2))
adjR21=1-((n-1)/(n-k-1))*(sum(e1.^2))/(sum((Y-mY).^2))
estar1 = e1 / se1;

rX1=[rh];
[rb,se1,pval,inmodel,stats,nextstep,history] = stepwisefit(rX1,Y)

figure(1)
plot(rh(:,1),Y,'.')
hold on
plot(rh(:,1),y1,'r')
title(sprintf('Relative Humidity, R^2=%1.5f adjR^2=%1.5f',R21,adjR21))

figure(2)
plot(Y,estar1,'*')
axis([0 30 -2 2])
hold on
ax = axis;
plot([ax(1) ax(2)],[-2 2],'k')
plot([ax(1) ax(2)],zcrit*[1 1],'c--')
plot([ax(1) ax(2)],-zcrit*[1 1],'c--')
xlabel('y')
ylabel('e^*')
title('Relative Humidity-Diagnostic plot');
pause;

%% Wind
[n,m]=size(wind);   
k=1;  
Y=temp(:,1);
X2=[ones(n,m) wind];
[b2,b2int,stats2]=regress(Y,X2);
y2=b2(1)+b2(2)*wind;
e2=Y-y2;

se2_2=(1/(n-k-1))*(sum(e2.^2));
se2=sqrt(se2_2);

R22=1-(sum(e2.^2))/(sum((Y-mY).^2))
adjR22=1-((n-1)/(n-k-1))*(sum(e2.^2))/(sum((Y-mY).^2))
estar2 = e2/se2;

rX2=[rh];
[rb2,se2,pval2,inmodel2,stats2,nextstep2,history2] = stepwisefit(rX2,Y)

figure(3)
clf
plot(wind(:,1),Y,'.')
hold on
plot(wind(:,1),y2,'r')
title(sprintf('Wind, R^2=%1.5f adjR^2=%1.5f',R22,adjR22))

figure(4)
clf
plot(Y,estar2,'*')
axis([0 30 -2 2])
hold on
ax = axis;
plot([ax(1) ax(2)],[0 0],'k')
plot([ax(1) ax(2)],zcrit*[1 1],'c--')
plot([ax(1) ax(2)],-zcrit*[1 1],'c--')
xlabel('y')
ylabel('e^*')
title('Wind-Diagnostic plot');
