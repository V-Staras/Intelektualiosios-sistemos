% VS (Naudojamas atskirti mano rašytus komentarus, nuo j?s?)

%%
% Išvados: Panaudoja RBFN atliko vaizdo atpažinimo užduot?. Gauti rezultai
% yra geri, bet ne puik?s. Mokymosi dalis ?vyko teisingai ir algoritmas
% pagal gaut? atsakym? apsimok? teisingai. Ta?iau vydant atpažinim? blogai
% atpažinta žodžios STARAS 3 raid?. Ta?iau kita A raid? atpažinta gerai.
% Taip pat užd?jus sujungt? fail? ?vyksta ta pati klaida. Tod?l, visai tai
% apibendrinant galime teikti, kad algoritmas neveikia d?l vienos iš
% priežas?i?: per mažas pavyzdži? skai?ius, pavyzdžiai n?ra pakankamai
% ryškus arba testiniai failai n?ra pakankamai ryškus. 
%%




% VS Komandos uždaryti langus, išvalyti workspace (kintamuosius), ir komandin?s eilut?s išvalymas.
close all
clear all
clc
% raidþiø pavyzdþiø nuskaitymas ir poþymiø skaièiavimas
% VS Pasirenkamas failas iš kurio nuskaityti.
pavadinimas = 'Apmokymas2.png';
% VS ??jimas failo pavadinimas ir eilu?i? skai?ius. Funkcijos iš?jimas
% VS Matrica dydžio eilu?i? skai?iaus ES * 10 ant 35 požymi?(jie pasl?pti po viena array).
pozymiai_tinklo_mokymui = pozymiai_raidems_atpazinti(pavadinimas, 6);
% Atpaþintuvo kûrimas
% poþymiai ið celiø masyvo perkeliami á matricà
% VS Fukncijos ??jimas aprašymas viršuje kitos funkcijos iš?jimu. Iš?jimas
% VS 35x60 matrica. Tai realiai matrica sujunga 35 požymi? ant 60 reikšmini?.
P = cell2mat(pozymiai_tinklo_mokymui);
% sukuriama teisingø atsakymø matrica: 11 raidþiø, 8 eilutës mokymui
% VS sukuriamos ES kiekis vienetini? matric?. 10 (raidži? skai?ius RS) dydžio ir sujungiamos ?
% VS vien?.
T = [eye(10), eye(10), eye(10), eye(10), eye(10), eye(10)];
% sukuriamas SBF tinklas duotiems P ir T sàryðiams
% VS funckijos ??jimas P ir T aprašyti, 0 yra siektina mažiausio kvadratinio
% VS vidurkio reikšm?. 1 RBF išsipl?timas (spread), 13 maximalus neuron?
% VS skai?ius.
% VS PIRMOJI PASTABA: išbandyta su daug skirting? neuron? kiekiu, funkcija
% VS geriausiai pasiekia rezultato su 13 neuron?, mažinant arba didinant
% VS neuron? skai?i?, tikslumas maž?ja.
tinklas = newrb(P,T,0,1, 13);

% Tinklo patikra
% skaièiuojamas tinklo iðëjimas neþinomiems poþymiams
% VS Fukncijos ??jimas visos P matricos eilut?s ir nuo 12 iki 22 stulpelio.
% VS Iš?jimas, j? reikšm?s.
P2 = P(:,12:22);
% VS Funkcijos i?jimas, neuron? tinklas ir P2 aprašytas viršuje. Iš?jimas
% VS matrica 10xRS dydžio.
Y2 = sim(tinklas, P2);
% ieðkoma, kuriame iðëjime gauta didþiausia reikðmë
% VS Išmokomos didžiausios reikšm?s iš stulpeli?.
[a2, b2] = max(Y2);
% Rezultato atvaizdavimas
% apskaièiuosime raidþiø skaièiø - poþymiø P2 stulpeliø skaièiø
% VSpaskai?iuojama P2 matricos stulpeli? skai?ius.
raidziu_sk = size(P2,2);
% rezultatà saugosime kintamajame 'atsakymas'
% VS sukuriamas kintamasis atsakymas
atsakymas = [];
% VS Ciklas vykdomas kiekvienai raidei ir priskiriama reikšm? (raid? arba
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
% pateikime rezultatà komandiniame lange
% VS pateikiamas atsakymas. Tai yra nuskaitytas kodas kai pirmos raid?s
% VS nera priekyje ir pirma ir antra raid? nukelta ? gal?.
disp(atsakymas)
 figure(7), text(0.1,0.5,atsakymas,'FontSize',38)
% þodþio "KADA" poþymiø iðskyrimas 
% VS nurodo norimo nuskaityti failo pavadinimas
pavadinimas = 'Staras.png';
% VS Nuskaitomas failas ? paver?iamas ? požymius.
pozymiai_patikrai = pozymiai_raidems_atpazinti(pavadinimas, 1);

% Raidþiø atpaþinimas
% poþymiai ið celiø masyvo perkeliami á matricà
% VS požymiai perskai?iuojam visoms raid?ms. Masyvvo dydis 35xRS
P2 = cell2mat(pozymiai_patikrai);
% skaièiuojamas tinklo iðëjimas neþinomiems poþymiams
% VS 10xR masyvo dydis, ??jimas pasiriktas tinklas pradžioje ir P2
Y2 = sim(tinklas, P2);
% ieðkoma, kuriame iðëjime gauta didþiausia reikðmë
% VS Iešmokos max reikšm?s, kad atapažinti, kuri raid?/skai?ius buvo ir j?
% VS priskirti.
[a2, b2] = max(Y2);
% Rezultato atvaizdavimas
% VS apskaièiuosime raidþiø skaièiø - poþymiø P2 stulpeliø skaièiø
% VS apskai?iuojama gauto atsakymo raidži?/skai?i? skai?ius.
raidziu_sk = size(P2,2);
% rezultatà saugosime kintamajame 'atsakymas'
% VS suk?rimas kintamsis ? kur? talpinsime atsakym?
atsakymas = [];
% VS ciklas vyksta tiek kart? kiek raidži?/skai?i? buvo nuskaityti ir
% VS kiekvien? kart? ?rašo atpažint? reikšm?.
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
% pateikime rezultatà komandiniame lange
% VS parodomas gautas rezultas
disp(atsakymas)
figure(8), text(0.1,0.5,atsakymas,'FontSize',38), axis off
% VS viskas kartojama iš naujo kitam failui taip pat kaip buvo daroma su
% VS STARAS PNG
% þodþio "FIKCIJA" poþymiø iðskyrimas 
pavadinimas = '25.png';
pozymiai_patikrai = pozymiai_raidems_atpazinti(pavadinimas, 1);

% Raidþiø atpaþinimas
% poþymiai ið celiø masyvo perkeliami á matricà
P2 = cell2mat(pozymiai_patikrai);
% skaièiuojamas tinklo iðëjimas neþinomiems poþymiams
Y2 = sim(tinklas, P2);
% ieðkoma, kuriame iðëjime gauta didþiausia reikðmë
[a2, b2] = max(Y2);
% Rezultato atvaizdavimas
% apskaièiuosime raidþiø skaièiø - poþymiø P2 stulpeliø skaièiø
raidziu_sk = size(P2,2);
% rezultatà saugosime kintamajame 'atsakymas'
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
% pateikime rezultatà komandiniame lange
disp(atsakymas)
figure(9), text(0.1,0.5,atsakymas,'FontSize',38), axis off

% taspats darom tik su sujungtu failu

pavadinimas = 'Staras 25.png';
pozymiai_patikrai = pozymiai_raidems_atpazinti(pavadinimas, 1);

% Raidþiø atpaþinimas
% poþymiai ið celiø masyvo perkeliami á matricà
P2 = cell2mat(pozymiai_patikrai);
% skaièiuojamas tinklo iðëjimas neþinomiems poþymiams
Y2 = sim(tinklas, P2);
% ieðkoma, kuriame iðëjime gauta didþiausia reikðmë
[a2, b2] = max(Y2);
% Rezultato atvaizdavimas
% apskaièiuosime raidþiø skaièiø - poþymiø P2 stulpeliø skaièiø
raidziu_sk = size(P2,2);
% rezultatà saugosime kintamajame 'atsakymas'
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
% pateikime rezultatà komandiniame lange
disp(atsakymas)
figure(10), text(0.1,0.5,atsakymas,'FontSize',38), axis off

