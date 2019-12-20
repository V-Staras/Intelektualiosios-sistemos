% Išvalymo komandos
close all
clear all
clc


% IŠVADA: Cikl? skai?i? galime mažinti gana daug, nes daug po tam tikro
% iteracij? skai?iaus ciklas geriau nebeapsimoko. Sprendimo b?dai gal?t?
% b?ti naudoti algoritm? centrams ir spinduliams parinkti, tada tur?ti
% gautis atitinkama funkcij?. 




% apsirašome X reikšmes
x = 0.1: 1/22: 1;
% Apsirašome tikslo funkcij?
ymok = (1 + 0.6 * sin (2 * pi * x / 0.7)) + 0.3 * sin (2 * pi * x) / 2;
% Nubraižomas grafikas, kuris buvo naudotas nusp?ti funkcijos maximumus ir
% spingulius
% plot(x, ymok, '.');
% aprašome du centrai, kurie bus naudojami RBF algoritme.
u_1=0.1909;
u_2=0.8727;
% aprašome du centr? spinduliai, kurie bus naudojami RBF algoritme.
q_1=0.25;
q_2=0.25;
% mokymo žingsnis
neu=0.01;
% RBF bus mokomas naudojant 3 kintamuosius w_0 laisvas koeficientas, w_1 ir
% w_2 koeficentai einanties prie exponen?i?, kurias nuadosime nusp?ti
% funkcijai.
w_0=randn(1);
w_1=randn(1);
w_2=randn(1);

% pasirenkame 50000 iteracij?. Viduje ciklo apskai?iuojamos exponent?s ir
% bendrasis tinklo iš?jimas bei e žymima klaida algortimo palyginus jo
% atsakym? su tikslo funkcij?. 
for o = 1:50000
FU_1=exp(-(((x-u_1).^2)/(2*q_1.^2)));
FU_2=exp(-(((x-u_2).^2)/(2*q_2.^2)));
y = FU_1*w_1+FU_2*w_2+w_0;
e=ymok-y;
% Iteracij? skai?ius lygus X skai?iui. Viduje jo apskai?iuojami naudijo RBF
% koeficentai.
for i=1:20
 w_1=w_1+neu*e(i)*FU_1(i);
 w_2=w_2+neu*e(i)*FU_2(i);
 w_0=w_0+neu*e(i)*1;
end
% Išvedamas skirtumas tarp tikslo funkcijos reikšm?s ir gauto rezultato
ats=ymok-y
end
% Nubraižoma tikslo funkcija ir apskai?iuotoji funkcija naudojant RBG
plot(x, y);
hold on
plot(x, ymok);
legend('mano', 'atsakymas');