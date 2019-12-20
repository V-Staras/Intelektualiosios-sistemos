% Išvalymo komandos
close all
clear all
clc

%Išvada:
%  1) D?l ne?prasto sprendimo b?do parenkant mokymo žingsn? dydesn? negu
%  0.05 mokymo algoritmas pradeda neveik ir pasiekamos ne skaitin?s
%  reikšm?s (NaN, not a numer).
%  2) While funkcija naudojant MLP reikia j? modifikuoti, bet jinai yra
%  geriau, nes gali vesti prie teisingesnio atsakymo. Nauodjant FOR cikl?
%  atsakymo tikslumas priklausys nuo iteracij? skai?iaus. 
%  3) Šiuo b?du spr?sta užduotis gauna labai tikslius rezultatus. Tikslumas
%  matomas kitose failuose. Jis yra 0.00099 didžiausias skirtumas tikslo
%  funkcijos ir gaunamo atsakymo paimtuose taškuose (20)
%  4) Grafik? nubraižymas pateiktas braižymas.m faile
%  5) Gauti grafika ir kita svarbi informacija pateikta aplankuose.
%



% apsirašome X reikšmes
x=0.1 : 1/22: 1;
% pasirenkamas mokymo žingnis.
neu=0.01;
% aprašome tikslo funkcija
ymok=(1+0.6*sin(2*pi*x/0.7))+(0.3*sin(2*pi*x))/2;
% nubraižoma tikslo funkcija
%plot(x,ymok);
% Priskiriamos atsitiktin?s reikšm?s MLP naudojamiems koeficientams. Pirmi
% 5 W yra pirmojo sluoksnio 5 nueron? koeficentai. Antrieji 5 W yra antrojo
% sluoksnio koeficentai, kuri? reikšm?s sueina ? vien? neuron?. Pirmi 5 B
% yra pimojo sluoksnio 5 neuron? laisvieji koeficientai, 6 B yra antrojo
% sluoksnio nuerono laisvasis koeficentas. Pirmajam atsakymui priskiriamas
% 0. Jis reikalingas, tam kad prasid?t? mano sukurtas MLP skai?iavimas.
w_11=randn(1);
w_12=randn(1);
w_13=randn(1);
w_14=randn(1);
w_15=randn(1);
w_21=randn(1);
w_22=randn(1);
w_23=randn(1);
w_24=randn(1);
w_25=randn(1);
b_11=randn(1);
b_12=randn(1);
b_13=randn(1);
b_14=randn(1);
b_15=randn(1);
b_21=randn(1);
y(1)=0;
% Yra trys sluoksniai cikl? dviej? iš j? kaip matome dydis priklauso nuo
% parinkto x skai?iaus. Vidurinysis ciklas yra pagrinidnimas reikšminis
% ciklas šiame algoritme.
for o = 1:20
% ?ia reikia pabr?žti, kad while algortimas naudojamas tik, tod?l, kad
% norima pasiekti kuo tikslen?s reikšm?s, ištikr?j? ši? reikšm? teoriškai
% galima pasiekti, praktiškai norint pasiekti 0.00099 maximal? paklaid?
% reikia laukti, kad algoritmas skai?iuot? apie 1-2 valandas. Po to laido
% algoritmas lindo gylin mažindamas paklaid?, bet šioje vietoje sustabdžiau
% ir užfiksavau duomenis. Norint šia programa pasiekti galutin? atsakym?
% while salyg? tur?t? b?ti ymok ir y skirtumo reikšm? pvz ymok-y>= 0.00099
% arba tam tikras iteracij? skai?ius naudojant FOR
while ymok(o)~=y(o)
% ?ia apskai?iuojamos neuron? iš?jimo reikšm?s ir paklaida tarp tikslo
% funkcijos ir gauto atsakymo
y_1=1./(1+exp(-x*w_11-b_11));
y_2=1./(1+exp(-x*w_12-b_12));
y_3=1./(1+exp(-x*w_13-b_13));
y_4=1./(1+exp(-x*w_14-b_14));
y_5=1./(1+exp(-x*w_15-b_15));
y=y_1*w_21+y_2*w_22+y_3*w_23+y_4*w_24+y_5*w_25+b_21;
e=ymok-y;
for i=1:20
  % ?ia apskai?uojami antrojo sluoksnio koeficentai
 w_21=w_21+neu*e(i)*y_1(i);
 w_22=w_22+neu*e(i)*y_2(i);
 w_23=w_23+neu*e(i)*y_3(i);
 w_24=w_24+neu*e(i)*y_4(i);
 w_25=w_25+neu*e(i)*y_5(i);
 b_21=b_21+neu*e(i)*1;
 % delta1 kievien1 kart1 apskai?iuoja koeficent?, kuris yra tiesiogiai
 % priklauso nuo 2 sluoksnio koeficent?, tai darome norint apskai?uoti
 % pirmojo sluoksnio vertes ?skaitant antrojo sluoksnio esamas koeficent?
 % reikšmes. toliau eilut?je apskai?iuojama pirmojo sluoksnio koeficientai.
 % delta1 skai?iavimos gali b?ti modifikuojamas, kai kei?iant antrojo
 % sluoksnio keoficent? ?tak? kei?iant pirmojo sluoksnio reikšmes.
 delta1=(1/(1+exp(-x(i)*w_11-b_11)))*(1-1/(1+exp(-x(i)*w_11-b_11)))*e(i)*w_21; w_11=w_11+neu*delta1*x(i); b_11=b_11+neu*delta1;
 delta1=(1/(1+exp(-x(i)*w_12-b_12)))*(1-1/(1+exp(-x(i)*w_12-b_12)))*e(i)*w_22; w_12=w_12+neu*delta1*x(i); b_12=b_12+neu*delta1;
 delta1=(1/(1+exp(-x(i)*w_13-b_13)))*(1-1/(1+exp(-x(i)*w_13-b_13)))*e(i)*w_23; w_13=w_13+neu*delta1*x(i); b_13=b_13+neu*delta1;
 delta1=(1/(1+exp(-x(i)*w_14-b_14)))*(1-1/(1+exp(-x(i)*w_14-b_14)))*e(i)*w_24; w_14=w_14+neu*delta1*x(i); b_14=b_14+neu*delta1;
 delta1=(1/(1+exp(-x(i)*w_15-b_15)))*(1-1/(1+exp(-x(i)*w_15-b_15)))*e(i)*w_25; w_15=w_15+neu*delta1*x(i); b_15=b_15+neu*delta1;
end
 % Rašomaas skirtuams tarp norimo rezulta ir gautojo.
ats=ymok-y

end
end


