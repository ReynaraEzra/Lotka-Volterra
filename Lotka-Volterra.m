clc;
clear all;
tbr=2;  %Laju Kelahiran Tuna
tdr=0.02; %Laju Kematian Tuna
sbr=0.01; %Laju Kelahiran Hiu
sdr=1.06; %Laju Kematian Hiu
delt=0.01;
fr=input('Masukan Amount of Fishing:');
duration=12;
SimulLength=duration/delt;

h=10; %Populasi Manusia
s=zeros(1,1000);
t=zeros(1,1000);
s(1)=15; %Populasi Awal Hiu
t(1)=100; %Populasi Awal Tuna

for i=2:SimulLength
    ds=(sbr*s(i-1)*t(i-1)-sdr*s(i-1)-fr*h*s(i-1))*delt;
    dt=(tbr*t(i-1)-tdr*t(i-1)*s(i-1)-fr*h*t(i-1))*delt;
    s(i)=s(i-1)+ds;
    t(i)=t(i-1)+dt;
    if s(i)<0
        s(i)=0;
    end
    if t(i)<0
        t(i)=0;
    end
end


figure(1)
plot((1:SimulLength),t)
hold on
plot((1:SimulLength),s)
title(sprintf('Populasi Terhadap Waktu\n Initial Tuna = %d, Initial Shark= %d',t(1),s(1)));
ylabel('Populasi');
xlabel('Waktu');
legend('Tuna','Shark');

figure(2)
plot(t,s)
title(sprintf('Lotka-Volterra Model\n Initial Tuna = %d, Initial Shark = %d',t(1),s(1)));
xlabel('Tuna');
ylabel('Shark');
axis([0 700 0 350]);

