% Išvalymo komandos
close all
clear all
clc
%Išvada: SLP klasifikavimo udaviniui galima naudoti while cikl?, norint
%gauti teising? atsakymo. Jeigu naudosi fiksuot? iteracij? skai?i? su for
%ciklu, teisingas atsakymas neb?tinai bus pasiektas. 




% ?rašomas failo pavadinimas
filename = 'Data.txt';
% atidaromas failas skaitymui
data = csvread(filename);

% nuskaimos poymi? reiksm?s 
x1=data(:, 1);
x2=data(:, 2);
ymok=data(:, 3);
% Invertuojama matricija 
ymok=ymok';

%Nustamomas pradini? duomen? eilu?i? skai?ius
d=size(data,1);
%koeficientas priskiriamos atsitiktin?s reikšm?s
w1=rand(1);
w2=rand(1);
b=rand(1);
%pasirenkamas mokymo ingnis
m=0.1;
% Tod?l, kad naudojamas while ciklas, mes parenkame pirmaj? y(1) reišm?, ji
% gali b?ti betkokia.
y(1)=945646450;
% trij? sluoksni? ciklai. Du priklauso nuo pateikt? duomen?. Pagrindinis
% while ciklas vykdomas kol gaunas atsakymas. 
for o = 1:d
while ymok(o)~=y(o)
for i = 1:d
    % gaunamas atsakymas pagal esamus koeficentus ir pradinius duomenis
   f=x1(i)*w1+x2(i)*w2+b;
   %priskiriamos klasifikavimo reikšm?s - neuron? tiklo iš?jimas
   if f > 0
       y(i)=1;
   else
      y(i)=-1;
   end
   %apskai?iuojama paklaida ir nauji koeficentai.
  e=ymok(i)-y(i);
  w1=w1+e*m*x1(i);
  w2=w2+e*m*x2(i);
  b=b+e*m;
  
end
end
end
% parodomi gauti atsakymai
disp(w1)
disp(w2)
disp(b)
% Parodomas skirtumas tarp norima ir gauto atsakym?
disp(ymok-y)

