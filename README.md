## Homework 1 for Ruby

1. (0.5 Poena) Biblioteka može da vrati dvodimenzioni niz sa vrednostima tabele
2. (0.5 Poena) Moguće je pristupati redu preko t.row(1), i pristup njegovim elementima po sintaksi niza.
3. (0.5 Poena) Mora biti implementiran Enumerable modul(each funkcija), gde se vraćaju sve ćelije unutar tabele, sa leva na desno.
4. (0.5 Poena) Biblioteka treba da vodi računa o merge-ovanim poljima
5. (1.0 Poena) [ ] sintaksa mora da bude obogaćena tako da je moguće pristupati određenim vrednostima.
    a. Biblioteka vraća celu kolonu kada se napravi upit t[“Prva Kolona”]
    b. Biblioteka omogućava pristup vrednostima unutar kolone po sledećoj sintaksi t[“Prva Kolona”][1] za pristup drugom elementu te kolone
    c. Biblioteka omogućava podešavanje vrednosti unutar ćelije po sledećoj sintaksi t[“Prva Kolona”][1]= 2556
6. (5.0 Poena) Biblioteka omogućava direktni pristup kolonama, preko istoimenih metoda.
    a. t.prvaKolona, t.drugaKolona, t.trecaKolona
    b. subtotal/Average neke kolone se može sračunati preko sledećih sintaksi t.prvaKolona.sum i t.prvaKolona.avg
    c. Iz svake kolone može da se izvuče pojedinačni red na osnovu vrednosti jedne od ćelija. (smatraćemo da ta ćelija jedinstveno identifikuje taj red)Primer sintakse: t.indeks.rn2310, ovaj kod će vratiti red studenta čiji je indeks rn2310
    d. Kolona mora da podržava funkcije kao što su map, select, reduce. Naprimer: t.prvaKolona.map { |cell| cell+=1 }
7. (0.5 Poena) Biblioteka prepoznaje ukoliko postoji na bilo koji način ključna reč total ili subtotal unutar sheet-a, i ignoriše taj red
8. (0.5 Poena) Moguće je sabiranje dve tabele, sve dok su im headeri isti. Npr t1+t2, gde svaka predstavlja, tabelu unutar jednog od worksheet-ova. Rezultat će vratiti novu tabelu gde su redovi (bez headera) t2 dodati unutar t1. (SQL UNION operacija)
9. (0.5 Poena) Moguće je oduzimanje dve tabele, sve dok su im headeri isti. Npr t1-t2, gde svaka predstavlja reprezentaciju jednog od worksheet-ova. Rezultat će vratiti novu tabelu gde su svi redovi iz t2 uklonjeni iz t1, ukoliko su identični.
10. (0.5 Poena) Biblioteka prepoznaje prazne redove, koji mogu biti ubačeni izgleda radi

Not don (2.5 poena):
5 c <br>
6 c <br>
7   <br>
10  - alias za row metodu

