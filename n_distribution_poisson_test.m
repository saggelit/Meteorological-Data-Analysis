clear; clc; clf;

data=load('forestfires.dat');
length_data=length(data);
count1=0;
count2=0;
for i=1:length_data
    if (data(i,13)==0.0)
        count1=count1+1;
        sampleA(count1,:)=data(i,:); %Mi kammenes ektaseis
    else
        count2=count2+1;
        sampleB(count2,:)=data(i,:); %Kammenes ektaseis
    end
end

figure(1)
binA1=17;
h1=histfit(sampleA(:,9),binA1);
h1(1).FaceColor=[1.,1.,.9];
h1(2).Color=[.0,.0,1.];
xlabel('Temperature C')
ylabel('Probability Density')
hold on
binB1=17;
y1=histfit(sampleB(:,9),binB1);
y1(1).FaceColor=('none');
legend('sampleA','sampleA','sampleB-burned areas','sampleB')
hold off

figure(2)
binA2=16;
h2=histfit(sampleA(:,10),binA2);
h2(1).FaceColor=[1.,1.,.9];
h2(2).Color=[.0,.0,1.];
xlabel('Relative Humidity')
ylabel('Probability Density')
hold on
binB2=16;
y2=histfit(sampleB(:,10),binB2);
y2(1).FaceColor=('none');
legend('sampleA','sampleA','sampleB-burned areas','sampleB')
hold off

figure(3)
binA3=22;
h2=histfit(sampleA(:,11),binA3);
h2(1).FaceColor=[1.,1.,.9];
h2(2).Color=[.0,.0,1.];
xlabel('Wind Speed')
ylabel('Probability Density')
hold on
binB3=22;
y2=histfit(sampleB(:,11),binB3);
y2(1).FaceColor=('none');
legend('sampleA','sampleA','sampleB-burned areas','sampleB')
hold off

%% chi-squared goodness-of-fit test

% Sample A - Temperature
h=chi2gof(sampleA(:,9));
if (h==0)
    fprintf(['The probability density function for temperature in ',...
        'sample A is approached from the normal distribution as h=%d\n'],h);
else
    fprintf(['The probability density function for temperature in ',...
        'sample A is not approached from the normal distribution as h=%d\n'],h);
end

% Sample B -  Temperature
h=chi2gof(sampleB(:,9));
if (h==0)
    fprintf(['The probability density function for temperature in ',...
        'sample B is approached from the normal distribution as h=%d\n'],h);
else
    fprintf(['The probability density function for temperature in ',...
        'sample B is not approached from the normal distribution as h=%d\n'],h);
end

% Sample A - Relative Humidity
h=chi2gof(sampleA(:,10));
if (h==0)
    fprintf(['The probability density function for Relative Humidity in ',...
        'sample A is approached from the normal distribution as h=%d\n'],h);
else
    fprintf(['The probability density function for Relative Humidity in ',...
        'sample A is not approached from the normal distribution as h=%d\n'],h);
end

% Sample B - Relative Humidity
h=chi2gof(sampleB(:,10));
if (h==0)
    fprintf(['The probability density function for Relative Humidity in ',...
        'sampleB is approached from the normal distribution as h=%d\n'],h);
else
    fprintf(['The probability density function for Relative Humidity in ',...
        'sample B is not approached from the normal distribution as h=%d\n'],h);
end

% Sample A - Wind Speed
h=chi2gof(sampleA(:,11));
if (h==0)
    fprintf(['The probability density function for wind speed in ',...
        'sampleA is approached from the normal distribution as h=%d\n'],h);
else
    fprintf(['The probability density function for wind speed in ',...
        'sample A is not approached from the normal distribution as h=%d\n'],h);
end

% Sample B - Wind Speed
h=chi2gof(sampleB(:,11));
if (h==0)
    fprintf(['The probability density function for wind speed in ',...
        'sample B is approached from the normal distribution as h=%d\n'],h);
else
    fprintf(['The probability density function for wind speed in ',...
        'sample B is not approached from the normal distribution as h=%d\n'],h);
end

%% Poisson Control
fprintf(['\n\n ***** Φor the five tests that the normal distribution was '...
    'rejected we will do a Poisson test. \n\n']);

% Sample A - Temperature
lambda=fitdist(sampleA(:,9),'Poisson');
h=chi2gof(sampleA(:,9),'cdf',lambda);
if (h==0)
    fprintf(['Τhe probability density function for the temperature in ',...
        'sample A is approached from Poisson distribution as h=%d\n'],h);
else
    fprintf(['Τhe probability density function for the temperature in ',...
        'sample A is not approached from Poisson distribution as h=%d\n'],h);
end

% Sample B - Temperature
lambda=fitdist(sampleB(:,9),'Poisson');
h=chi2gof(sampleB(:,9),'cdf',lambda);
if (h==0)
    fprintf(['Τhe probability density function for the temperature in ',...
        'sample B is approached from Poisson distribution as h=%d\n'],h);
else
    fprintf(['Τhe probability density function for the temperature in ',...
        'sample B is not approached from Poisson distribution as h=%d\n'],h);
end

% Sample A - Relative Humidity
lambda=fitdist(sampleA(:,10),'Poisson');
h=chi2gof(sampleA(:,10),'cdf',lambda);
if (h==0)
    fprintf(['Τhe probability density function for Relative Humidity in ',...
        'sample A is approached from Poisson distribution as h=%d\n'],h);
else
    fprintf(['Τhe probability density function for Relative Humidity in ',...
        'sample A is not approached from Poisson distribution as h=%d\n'],h);
end

% Sample B - Relative Humidity
lambda=fitdist(sampleB(:,10),'Poisson');
h=chi2gof(sampleB(:,10),'cdf',lambda);
if (h==0)
    fprintf(['Τhe probability density function for Relative Humidity in ',...
        'sample B is approached from Poisson distribution as h=%d\n'],h);
else
    fprintf(['Τhe probability density function for Relative Humidity in ',...
        'sample B is not approached from Poisson distribution as h=%d\n'],h);
end

% Sample A - Wind Speed
lambda=fitdist(sampleA(:,11),'Poisson');
h=chi2gof(sampleA(:,11),'cdf',lambda);
if (h==0)
    fprintf(['The probability density function for wind speed in ',...
        'sample A is approached from Poisson distribution as h=%d\n'],h);
else
    fprintf(['The probability density function for wind speed in ',...
        'sample A is not approached from Poisson distribution as h=%d\n'],h);
end

% Sample B - Wind Speed
lambda=fitdist(sampleB(:,11),'Poisson');
h=chi2gof(sampleB(:,11),'cdf',lambda);
if (h==0)
    fprintf(['The probability density function for wind speed in ',...
        'sample B is approached from Poisson distribution as h=%d\n'],h);
else
    fprintf(['The probability density function for wind speed in ',...
        'sample B is not approached from Poisson distribution as h=%d\n'],h);
end
