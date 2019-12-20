% VS (Naudojamas atskirti mano ra�ytus komentarus, nuo j?s?)

%%
% I�vados: Panaudoja RBFN atliko vaizdo atpa�inimo u�duot?. Gauti rezultai
% yra geri, bet ne puik?s. Mokymosi dalis ?vyko teisingai ir algoritmas
% pagal gaut? atsakym? apsimok? teisingai. Ta?iau vydant atpa�inim? blogai
% atpa�inta �od�ios STARAS 3 raid?. Ta?iau kita A raid? atpa�inta gerai.
% Taip pat u�d?jus sujungt? fail? ?vyksta ta pati klaida. Tod?l, visai tai
% apibendrinant galime teikti, kad algoritmas neveikia d?l vienos i�
% prie�as?i?: per ma�as pavyzd�i? skai?ius, pavyzd�iai n?ra pakankamai
% ry�kus arba testiniai failai n?ra pakankamai ry�kus. 
%%




% VS Komandos u�daryti langus, i�valyti workspace (kintamuosius), ir komandin?s eilut?s i�valymas.
close all
clear all
clc
% raid�i� pavyzd�i� nuskaitymas ir po�ymi� skai�iavimas
% VS Pasirenkamas failas i� kurio nuskaityti.
pavadinimas = 'Apmokymas2.png';
% VS ??jimas failo pavadinimas ir eilu?i? skai?ius. Funkcijos i�?jimas
% VS Matrica dyd�io eilu?i? skai?iaus ES * 10 ant 35 po�ymi?(jie pasl?pti po viena array).
pozymiai_tinklo_mokymui = pozymiai_raidems_atpazinti(pavadinimas, 6);
% Atpa�intuvo k�rimas
% po�ymiai i� celi� masyvo perkeliami � matric�
% VS Fukncijos ??jimas apra�ymas vir�uje kitos funkcijos i�?jimu. I�?jimas
% VS 35x60 matrica. Tai realiai matrica sujunga 35 po�ymi? ant 60 reik�mini?.
P = cell2mat(pozymiai_tinklo_mokymui);
% sukuriama teising� atsakym� matrica: 11 raid�i�, 8 eilut�s mokymui
% VS sukuriamos ES kiekis vienetini? matric?. 10 (raid�i? skai?ius RS) dyd�io ir sujungiamos ?
% VS vien?.
T = [eye(10), eye(10), eye(10), eye(10), eye(10), eye(10)];
% sukuriamas SBF tinklas duotiems P ir T s�ry�iams
% VS funckijos ??jimas P ir T apra�yti, 0 yra siektina ma�iausio kvadratinio
% VS vidurkio reik�m?. 1 RBF i�sipl?timas (spread), 13 maximalus neuron?
% VS skai?ius.
% VS PIRMOJI PASTABA: i�bandyta su daug skirting? neuron? kiekiu, funkcija
% VS geriausiai pasiekia rezultato su 13 neuron?, ma�inant arba didinant
% VS neuron? skai?i?, tikslumas ma�?ja.
tinklas = newrb(P,T,0,1, 13);

% Tinklo patikra
% skai�iuojamas tinklo i��jimas ne�inomiems po�ymiams
% VS Fukncijos ??jimas visos P matricos eilut?s ir nuo 12 iki 22 stulpelio.
% VS I�?jimas, j? reik�m?s.
P2 = P(:,12:22);
% VS Funkcijos i?jimas, neuron? tinklas ir P2 apra�ytas vir�uje. I�?jimas
% VS matrica 10xRS dyd�io.
Y2 = sim(tinklas, P2);
% ie�koma, kuriame i��jime gauta did�iausia reik�m�
% VS I�mokomos did�iausios reik�m?s i� stulpeli?.
[a2, b2] = max(Y2);
% Rezultato atvaizdavimas
% apskai�iuosime raid�i� skai�i� - po�ymi� P2 stulpeli� skai�i�
% VSpaskai?iuojama P2 matricos stulpeli? skai?ius.
raidziu_sk = size(P2,2);
% rezultat� saugosime kintamajame 'atsakymas'
% VS sukuriamas kintamasis atsakymas
atsakymas = [];
% VS Ciklas vykdomas kiekvienai raidei ir priskiriama reik�m? (raid? arba
% VS skai?ius jau kompiuterije).
for k = 1:raidziu_sk
    switch b2(k)
        case 1
            atsakymas = [atsakymas, 'S'];
        case 2
            atsakymas = [atsakymas, 'A'];
        case 3
            atsakymas = [atsakymas, 'F'];
        case 4
            atsakymas = [atsakymas, 'G'];
        case 5
            atsakymas = [atsakymas, 'T'];
        case 6
            atsakymas = [atsakymas, 'R'];
        case 7
            atsakymas = [atsakymas, 'H'];
        case 8
            atsakymas = [atsakymas, '2'];
        case 9
            atsakymas = [atsakymas, '5'];
        case 10
            atsakymas = [atsakymas, '9'];
    end
end
% pateikime rezultat� komandiniame lange
% VS pateikiamas atsakymas. Tai yra nuskaitytas kodas kai pirmos raid?s
% VS nera priekyje ir pirma ir antra raid? nukelta ? gal?.
disp(atsakymas)
 figure(7), text(0.1,0.5,atsakymas,'FontSize',38)
% �od�io "KADA" po�ymi� i�skyrimas 
% VS nurodo norimo nuskaityti failo pavadinimas
pavadinimas = 'Staras.png';
% VS Nuskaitomas failas ? paver?iamas ? po�ymius.
pozymiai_patikrai = pozymiai_raidems_atpazinti(pavadinimas, 1);

% Raid�i� atpa�inimas
% po�ymiai i� celi� masyvo perkeliami � matric�
% VS po�ymiai perskai?iuojam visoms raid?ms. Masyvvo dydis 35xRS
P2 = cell2mat(pozymiai_patikrai);
% skai�iuojamas tinklo i��jimas ne�inomiems po�ymiams
% VS 10xR masyvo dydis, ??jimas pasiriktas tinklas prad�ioje ir P2
Y2 = sim(tinklas, P2);
% ie�koma, kuriame i��jime gauta did�iausia reik�m�
% VS Ie�mokos max reik�m?s, kad atapa�inti, kuri raid?/skai?ius buvo ir j?
% VS priskirti.
[a2, b2] = max(Y2);
% Rezultato atvaizdavimas
% VS apskai�iuosime raid�i� skai�i� - po�ymi� P2 stulpeli� skai�i�
% VS apskai?iuojama gauto atsakymo raid�i?/skai?i? skai?ius.
raidziu_sk = size(P2,2);
% rezultat� saugosime kintamajame 'atsakymas'
% VS suk?rimas kintamsis ? kur? talpinsime atsakym?
atsakymas = [];
% VS ciklas vyksta tiek kart? kiek raid�i?/skai?i? buvo nuskaityti ir
% VS kiekvien? kart? ?ra�o atpa�int? reik�m?.
for k = 1:raidziu_sk
    switch b2(k)
        case 1
            atsakymas = [atsakymas, 'S'];
        case 2
            atsakymas = [atsakymas, 'A'];
        case 3
            atsakymas = [atsakymas, 'F'];
        case 4
            atsakymas = [atsakymas, 'G'];
        case 5
            atsakymas = [atsakymas, 'T'];
        case 6
            atsakymas = [atsakymas, 'R'];
        case 7
            atsakymas = [atsakymas, 'H'];
        case 8
            atsakymas = [atsakymas, '2'];
        case 9
            atsakymas = [atsakymas, '5'];
        case 10
            atsakymas = [atsakymas, '9'];
    end
end
% pateikime rezultat� komandiniame lange
% VS parodomas gautas rezultas
disp(atsakymas)
figure(8), text(0.1,0.5,atsakymas,'FontSize',38), axis off
% VS viskas kartojama i� naujo kitam failui taip pat kaip buvo daroma su
% VS STARAS PNG
% �od�io "FIKCIJA" po�ymi� i�skyrimas 
pavadinimas = '25.png';
pozymiai_patikrai = pozymiai_raidems_atpazinti(pavadinimas, 1);

% Raid�i� atpa�inimas
% po�ymiai i� celi� masyvo perkeliami � matric�
P2 = cell2mat(pozymiai_patikrai);
% skai�iuojamas tinklo i��jimas ne�inomiems po�ymiams
Y2 = sim(tinklas, P2);
% ie�koma, kuriame i��jime gauta did�iausia reik�m�
[a2, b2] = max(Y2);
% Rezultato atvaizdavimas
% apskai�iuosime raid�i� skai�i� - po�ymi� P2 stulpeli� skai�i�
raidziu_sk = size(P2,2);
% rezultat� saugosime kintamajame 'atsakymas'
atsakymas = [];
for k = 1:raidziu_sk
    switch b2(k)
        case 1
            atsakymas = [atsakymas, 'S'];
        case 2
            atsakymas = [atsakymas, 'A'];
        case 3
            atsakymas = [atsakymas, 'F'];
        case 4
            atsakymas = [atsakymas, 'G'];
        case 5
            atsakymas = [atsakymas, 'T'];
        case 6
            atsakymas = [atsakymas, 'R'];
        case 7
            atsakymas = [atsakymas, 'H'];
        case 8
            atsakymas = [atsakymas, '2'];
        case 9
            atsakymas = [atsakymas, '5'];
        case 10
            atsakymas = [atsakymas, '9'];
    end
end
% pateikime rezultat� komandiniame lange
disp(atsakymas)
figure(9), text(0.1,0.5,atsakymas,'FontSize',38), axis off

% taspats darom tik su sujungtu failu

pavadinimas = 'Staras 25.png';
pozymiai_patikrai = pozymiai_raidems_atpazinti(pavadinimas, 1);

% Raid�i� atpa�inimas
% po�ymiai i� celi� masyvo perkeliami � matric�
P2 = cell2mat(pozymiai_patikrai);
% skai�iuojamas tinklo i��jimas ne�inomiems po�ymiams
Y2 = sim(tinklas, P2);
% ie�koma, kuriame i��jime gauta did�iausia reik�m�
[a2, b2] = max(Y2);
% Rezultato atvaizdavimas
% apskai�iuosime raid�i� skai�i� - po�ymi� P2 stulpeli� skai�i�
raidziu_sk = size(P2,2);
% rezultat� saugosime kintamajame 'atsakymas'
atsakymas = [];
for k = 1:raidziu_sk
    switch b2(k)
        case 1
            atsakymas = [atsakymas, 'S'];
        case 2
            atsakymas = [atsakymas, 'A'];
        case 3
            atsakymas = [atsakymas, 'F'];
        case 4
            atsakymas = [atsakymas, 'G'];
        case 5
            atsakymas = [atsakymas, 'T'];
        case 6
            atsakymas = [atsakymas, 'R'];
        case 7
            atsakymas = [atsakymas, 'H'];
        case 8
            atsakymas = [atsakymas, '2'];
        case 9
            atsakymas = [atsakymas, '5'];
        case 10
            atsakymas = [atsakymas, '9'];
    end
end
% pateikime rezultat� komandiniame lange
disp(atsakymas)
figure(10), text(0.1,0.5,atsakymas,'FontSize',38), axis off

