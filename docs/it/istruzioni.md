# NESIC V2.4

## ISTRUZIONI

Le istruzioni del Nesic sono in linea di massima quelle del Basic v2.0 originale del VIC-20 ed a quelle rimando per approfondimenti, fatta eccezione per GOTO e GOSUB che non esistono in Nesic. In compenso ci sono altri comandi e funzioni e ci sono delle istruzioni del Basic che qui assumono altre funzionalità. Ecco la lista:

**\[procedura\]**

**' (commento di istruzione)**

**AGAIN**

**AUTO**

**AUX**

**BEEP**

**BGN\[procedura\]**

**BORDER**

**COLOR**

**COLOR$**

**CSR**

**DELETE**

**EFFECT**

**ELSE**

**END**

**EVAL**

**FIRE**

**GO\<etichetta\>**

**GRAPHIC**

**HPEN**

**IF**

**INK**

**INSTR**

**JOY**

**LBL\<etichetta\>**

**LIST**

**MERGE**

**MERGE SHAPE**

**OLD**

**ON**

**PADDLE**

**PAPER**

**PEEK**

**PEEK+**

**POKE**

**POKE+**

**RENUMBER**

**REPEAT**

**REPEAT$**

**RUN**

**SHAPE**

**SOUND**

**SYS**

**SYS INPUT**

**SYS LOAD**

**SYS SAVE**

**TRIM$**

**TRIM LEFT$**

**TRIM RIGHT$**

**VIDEO**

**VIDEO$**

**VOLUME**

**VPEN**

Più in dettaglio:

### \[procedura\] – \[nome\] – \[nome\], par1, par2, par3 … , parn

Chiamata di procedura, anche con parametri.

Esempio:

```
10 BGN[MAIN]

20 [PERSONA],"PIPPO",6

30 END

40 BGN[PERSONA],N$,A

50 PRINT "CIAO ";N$; " ANNI";A

60 END
```

stamperà:

```
CIAO PIPPO ANNI 6
```

### ' (commento di istruzione)

E’ simile a REM, cioè un commento ma a differenza di REM che pone a commento tutto quello che si trova alla sua destra fino alla fine della linea, questo commento agisce solo sull’istruzione corrente:

```
A=5:'A=3:PRINT A
```

Cosa stamperà? Stamperà 5 perché la seconda istruzione è un commento e verrà saltata, quindi quell’assegnazione non verrà fatta.

### AGAIN – AGAIN – AGAIN\[procedura\]

Ripete la procedura corrente dall’inizio. Se viene specificato un nome procedura, ad esempio AGAIN\[PIPPO\] esegue questa procedura dall’inizio.

ATTENZIONE: la esegue solo se la procedura PIPPO è già istanziata, altrimenti otterremo un PROC NOT FOUND ERROR.

Esempio:

```
10 BGN[TEST AGAIN]

20 PRINT ",";

30 [SECONDA PROCEDURA]

40 END

50 BGN[SECONDA PROCEDURA]

60 PRINT ".";

70 AGAIN[TEST AGAIN]
```

Questa è una ripetizione continua dall’inizio e pertanto produrrà una stampa di virgole e punti alternati.

Adesso modifichiamo la riga 70 ed aggiungiamo un’altra procedura, così:

```
10 BGN[TEST AGAIN]

20 PRINT ",";

30 [SECONDA PROCEDURA]

40 END

50 BGN[SECONDA PROCEDURA]

60 PRINT ".";

70 AGAIN[TEST2]

80 BGN[TEST2]

90 PRINT "!";

100 [SECONDA PROCEDURA]

110 END
```

Funzionerà? No, perché la procedura TEST2 è sì presente nel programma ma non è richiamata, quindi AGAIN non la troverà in memoria. Dando il RUN otterremo pertanto:

```
RUN

,.

?PROC NOT FOUND

ERROR IN 70

READY.
```

Cioè dopo aver stampato una virgola ed un punto, come previsto, ci ritroveremo un errore all’esecuzione dell’istruzione AGAIN.

Se invece modifichiamo la riga 30 in 30 \[TEST2\] allora otterremo una stampa con una virgola e poi punti esclamativi e punti fermi alternati, questo perché la procedura TEST2 è stata istanziata e quindi viene trovata in memoria da AGAIN.

**Ricapitolando:** AGAIN consente di ripetere dall’inizio l’esecuzione di una procedura già istanziata in memoria.

### AUTO – AUTO 100\[,10\]

E’ un comando di utilità: consente la numerazione automatica delle linee mentre si inserisce un listato. Ad esempio:

AUTO (senza parametri)

propone il numero di linea 100 e possiamo digitare una linea Nesic di seguito. All’invio verrà proposta la linea successiva. Di default il passo è 10, per cui ci verrà proposto il numero 110.

Dando invio al numero proposto, senza inserire nulla, equivarrà ad uscire dalla modalità AUTO.

Quindi AUTO senza parametri equivale ad AUTO 100,10. Possiamo quindi digitare AUTO senza parametri, AUTO linea\_iniziale e AUTO linea\_iniziale,linea\_finale.

### AUX – AUX=numero (0-15) – AUX funzione (A=AUX)

Variabile di sistema: AUX=numero (da 0 a 15) imposta il registro del VIC relativo al colore ausiliario, PRINT AUX invece stampa quest’impostazione.  
E’ possibile esprimere anche il valore in esadecimale, ad esempio: AUX=$0F.

### BEEP – BEEP 0 – BEEP 1

Comando di utilità: BEEP o BEEP1 attiva un breve BEEP alla pressione dei tasti, BEEP 0 lo disattiva.

### BGN\[procedura\] ed eventuali parametri: BGN\[procedura\] , var1, var2...

Dichiarazione di procedura, deve trovarsi all’inizio di una riga. É possibile dichiarare delle variabili nelle quali andranno ad inserirsi i parametri specificati nella chiamata. Per ogni variabile dichiarata qui dev’essere specificata una variabile di tipo compatibile nella chiamata.

### BORDER – BORDER=n (0-15) – A=BORDER

Cambia o legge il colore del bordo dello schermo. Variabile di sistema: BORDER=n (da 0 a 15) oppure PRINT BORDER.

E’ possibile esprimere anche il valore in esadecimale, ad esempio: BORDER=$03.

### COLOR – COLOR=n (0-15) – A=COLOR

Cambia o legge il colore del carattere dov’è posizionato il cursore. Variabile di sistema: COLOR=n (da 0 a 15) oppure PRINT COLOR.

E’ possibile esprimere anche il valore in esadecimale, ad esempio: COLOR=$F0.

### COLOR$ - comando: COLOR$(n)=A$ - funzione: A$=COLOR$(n)

Analogamente alla sua gemella VIDEO$ quest’istruzione agisce sulla memoria colore e consente di leggere in una stringa oppure di impostare tutti i colori di una riga di caratteri.

Ad esempio:

```
COLOR$(10)=COLOR$(0)
```

copia il colore dei caratteri della riga 0 nella riga 10.

**Attenzione:** nel caso si fornisca una stringa di lunghezza superiore ai 22 caratteri questa verrà troncata. Se si fornisce invece una stringa di lunghezza inferiore verrà stampata solo quella stringa e non tutta la riga di 22 caratteri.

### CSR – CSR - CSR x,y – A= CSR X – A=CSRY

Posiziona il cursore alle coordinate x,y, ad esempio CSR 10,12.

CSR senza parametri cancella lo schermo e posizione il cursore in alto a sinistra.

E’ possibile anche ottenere le coordinate del cursore: A=CSR X e B=CSR Y ci consentono di mettere le coordinate nelle variabili A e B.

### DELETE – DELETE n1-n2 – DELETE\[procedura\]

Cancella un gruppo di righe specificato oppure un’intera procedura.

Esempio: DELETE 10-100 oppure DELETE\[MAIN\]

### EFFECT – EFFECT n.canale, n.ripetizioni, freq1, freq2 – EFFECT n.canale, durata, freq, EFFECT n.canale, 0

EFFECT genera un effetto audio non bloccante, cioè la sua esecuzione non blocca l’esecuzione del programma. E’ possibile generare un effetto sonoro impostando fino a 4 parametri.

Esempi:

EFFECT 0,5,100,20 esegue un effetto sonoro sul canale 0, ripetuto 5 volte, con una frequenza discendente che va da 100 a 20.

EFFECT 3,3,50,127 esegue un effetto sonoro sul canale 3 (rumore) ripetuto 3 volte, con frequenza ascendente che va da 50 a 127.

EFFECT 2,20,80 genera frequenza fissa sul canale 2 di durata 20 e frequenza 80.

EFFECT 1,0 silenzia il canale 1.

EFFECT senza parametri silenzia tutti i i suoni, anche quelli generati dall’istruzione SOUND.

### ELSE

Fa parte dell’istruzione IF e va messo sulla medesima riga, dopo un’eventuale THEN, che è facoltativo. ELSE va sempre preceduto dai due punti ":".

### END - END – END\[procedura\]

END senza parametri termina la procedura corrente (o tutto il programma se siamo nella procedura principale). END\[procedura\] termina una procedura nella quale siamo annidati.

Esempio:

```
10 BGN[MAIN]

20 [PROC1]

30 PRINT "MAIN"

40 END

50 BGN[PROC1]

60 PRINT "PROC1"

70 END
```

Se eseguiamo il programma otterremo la seguente stampa:

```
PROC1

MAIN
```

Ma se modifichiamo la riga 70 così:

```
70 END[MAIN]
```

otterremo questo:

```
PROC1
```

in quanto la procedura MAIN (cioè in questo caso tutto il programma) verrà terminata prima di poter proseguire e stampare MAIN.

### EVAL – A=EVAL(A$)

Valuta una formula inserita in una stringa. Ciò consente di elaborare formule inserite dall’utente tramite l’istruzione INPUT. Tali formule possono far uso di funzioni Basic – ATTENZIONE – non Nesic. Tale limitazione è imposta per questioni di stabilità. Esempio: PRINT EVAL("6\*5") stamperà 30. In caso di errore nella formula il programma si fermerà con segnalazione di errore, ma tale situazione potrà essere intercettata e corretta tramite la gestione errori del Nesic.

### FIRE

E’ una funzione che riporta lo stato del tasto FIRE del joystick, 0 se tasto non premuto e -1 se premuto.

### GO\<etichetta\>

GO\<etichetta\> è simile al GOTO del Basic ma rimanda l’esecuzione ad un’etichetta indicata con LBL\<etichetta\> invece che ad un numero di riga.

### GRAPHIC -  GRAPHIC – GRAPHIC n – GRAPHIC n,n

GRAPHIC è un comando che si riferisce alla modalità grafica ma – ATTENZIONE! – non alla grafica bitmap come si potrebbe pensare. Si tratta di grafica a ridefinizione caratteri, utile per i giochi.

GRAPHIC senza parametri è un po’ particolare: riporta la visualizzazione dei caratteri in ROM, quella predefinita del sistema, riporta i colori dello schermo ai valori predefiniti e silenzia il suono.

Il primo parametro può valere da 0 a 2: GRAPHIC 0, GRAPHIC 1 e GRAPHIC 2 che portano rispettivamente la visualizzazione dei caratteri predefiniti in ROM, la visualizzazione dei caratteri della ROM copiati in RAM a partire da $1000 e quindi modificabili e nel terzo caso la stessa cosa ma con i caratteri del secondo set, quello con le minuscole, copiati in RAM, pronti per venire modificati.

Il secondo parametro di GRAPHIC, ad esempio GRAPHIC 1,0, può valere 0 o 1 e, nel caso sia 0, passa alla modalità grafica SENZA COPIARE i caratteri dalla ROM. E’ utile nel caso che si voglia modificare i caratteri rimanendo in GRAPHIC 0 e poi passare in GRAPHIC 1 senza ricopiare dalla ROM e quindi senza sovrascrivere i caratteri modificati.

### HPEN

Va usato in coppia con VPEN e consente la lettura della coordinata verticale della light pen.

### IF

E’ simile all’istruzione IF del Basic ma il THEN è facoltativo e comprende anche l’ELSE.

Attenzione: l’ELSE va sempre preceduto dai due punti ":" e il THEN talvolta è meglio impiegarlo per evitare ambiguità, anche se nelle mie prove non ho notato problemi. Diciamo che ometterlo fa risparmiare caratteri (anche in memoria) e quindi consente di mettere più istruzioni su una riga ma talvolta metterlo rende il listato più leggibile.

### INK – INK=n (0-15) - A=INK

INK è una variabile di sistema che serve ad impostare o leggere il colore per l’istruzione PRINT.  
Esempio: INK=7:PRINT "GIALLO". I colori associati a INK:

0 = NERO

1 = BIANCO

2 = ROSSO

3 = CIANO

4 = MAGENTA

5 = VERDE

6 = BLU

7 = GIALLO

I colori da 8 a 15 sono relativi alla modalità multicolor e alla risultante prende parte anche il colore ausiliario definito dalla variabile di sistema AUX.

E’ possibile esprimere anche il valore in esadecimale, ad esempio: INK=$06.

### INSTR – funzione

INSTR è una funzione di ricerca di una sottostringa di uno o più caratteri all’interno di una stringa.

Esempio:

```
PRINT INSTR("ABC","BC")
```

stamperà 2 perché la "BC" viene trovata in seconda posizione. Se una sottostringa non viene trovata allora stampa 0. Se la prima stringa è nulla il risultato sarà sempre 0, così come se la seconda stringa è nulla e la prima una stringa valida allora il risultato sarà 1.

Esempio:

```
PRINT INSTR("ABC","D")
```

E’ possibile specificare un offset a partire dal quale cercare:

```
PRINT INSTR(3, "1234212","2")
```

In questo caso la ricerca partirà dalla posizione 3 e troverà il 2 alla posizione 5, quindi stamperà 5.

Se la seconda stringa è nulla invece il risultato sarà lo stesso numero che abbiamo messo come offset oppure 0 se questo supera la lunghezza della stringa. Se non è stato specificato alcun offset questo sarà impostato a 1.

### JOY - A=JOY

JOY è una funzione che riporta la posizione del joystick, secondo la seguente tabella:

0 = posizione centrale

1 = sinistra

2 = destra

3 = alto

4 = basso

5 = sinistra-alto

6 = destra-alto

7 = destra-basso

8 = sinistra-basso

### LBL\<etichetta\>

LBL\<etichetta\> deve trovarsi all’inizio di una riga e la sua funzione è quella di marcare un "punto di atterraggio" di una GO\<etichetta\>.

### LIST – LIST riga – LIST r.iniziale-r.finale - LIST\[procedura\]

LIST è simile al LIST del Basic ma accetta anche LIST\[procedura\] che consente di visualizzare tutte le righe che compongono la procedura.

### MERGE – MERGE "programma" – MERGE "programma",8

MERGE consente di fondere due programmi Nesic in uno. Più che un MERGE è un APPEND, infatti il nuovo programma viene accodato al primo e poi le righe vengono rinumerate.

Potrebbero quindi esserci procedure doppie. Ho preferito lasciare così anche se inizialmente avevo pensato di eliminare la prima ricorrenza di una procedura in favore di quella nuova. Il fatto è che non è possibile sapere quale delle due si vuole tenere, quindi è meglio ricontrollare tutto quando si fa un MERGE e poi decidere manualmente il da farsi.

### MERGE SHAPE - MERGE SHAPE(chr1, chr2) TO chr3

MERGE SHAPE consente di fondere la definizione di due codici carattere, forniti anche in esadecimale, chr1 e chr2 in un terzo, chr3. La fusione avviene tramite XOR, che è la funzione più usata in questi casi, ma è possibile usare anche AND, OR e NOT.

Esempi:

```
MERGE SHAPE($01, 02) TO 03
```

fonde la definizione dei caratteri esadecimali 01 e 02 (A e B) nel carattere 03 ( C ) usando XOR

```
MERGE SHAPE($01, 02) TO 03, AND
```

fonde la definizione dei caratteri esadecimali 01 e 02 (A e B) nel carattere 03 ( C ) usando AND

```
MERGE SHAPE($01, 02) TO 03, OR
```

fonde la definizione dei caratteri esadecimali 01 e 02 (A e B) nel carattere 03 ( C ) usando OR

```
MERGE SHAPE($01) TO 03, NOT
```

fonde la definizione del carattere esadecimale 01 (A) nel carattere 03 ( C ) usando NOT. Questo fa il reverse del carattere.

```
MERGE SHAPE($01) TO 03, LOAD
```

copia la definizione del carattere esadecimale 01 (A) nel carattere 03 ( C ) senza modifiche, pertanto la letterà C acquisterà le sembianze della A.

Notare che possiamo anche scrivere:

```
MERGE SHAPE($01) TO 03, OR
```

questo fonderà il carattere $01 con il $03 ed il risultato sarà posto in $03.

MERGE SHAPE($01) TO 01, NOT farà invece il reverse del carattere $01 su sé stesso, quindi ogni volta che l’istruzione verrà eseguita il carattere passerà da positivo a negativo e viceversa, invertendo la visualizzazione.

### OLD

E’ il contrario di NEW, serve a recuperare un programma cancellato per sbaglio con NEW ma non ancora sovrascritto. Va quindi usato immediatamente dopo NEW, altrimenti il recupero diverrà impossibile.

### ON

E’ analogo all’istruzione ON...GOTO o ON...GOSUB del Basic con la differenza che in Nesic si chiamano procedure o si fanno salti ad etichette.

Esempio:

```
ON JOY [SX],[DX],GO<SU>,GO<GIU>

PADDLE(n)
```

PADDLE è una funzione che ritorna il valore del paddle specificato. Il parametro ammesso può essere 0 o 1. Esempio:

```
PRINT PADDLE(0)
```

PAPER – PAPER=n – A=PAPER

PAPER è sia comando che funzione, in pratica una variabile di sistema. Si riferisce al colore dello sfondo.

Esempi:

```
PAPER=1

PRINT PAPER
```

I colori fino a 7 sono gli stessi di INK:

0 = NERO

1 = BIANCO

2 = ROSSO

3 = CIANO

4 = MAGENTA

5 = VERDE

6 = BLU

7 = GIALLO

I colori da 8 a 15:

8 = ARANCIO

9 = ARANCIO CHIARO

10 = ROSA

11 = CIANO CHIARO

12 = MAGENTA CHIARO

13 = VERDE CHIARO

14 = VIOLA CHIARO

15 = GIALLO CHIARO

E’ possibile esprimere anche il valore in esadecimale, ad esempio: PAPER=$05.

### PEEK

E’ una funzione analoga a quella del Basic ma accetta il parametro anche in esadecimale.

Esempi:

```
PRINT PEEK(4096)

PRINT PEEK($1000)
```

PEEK+ (16 bit) - se i valori sono espressi in esadecimale vanno sempre usate 4 cifre

E’ simile alla PEEK ma è a 16 bit, cioè restituisce il valore di 2 byte.

Esempio:

```
PRINT PEEK+($002B)
```

che legge il valore delle locazioni $2B e $2C della pagina zero e stampa 6657: si tratta dell’indirizzo inizio Nesic (in esadecimale $1A01)

### POKE

E’ un’istruzione simile a quella del Basic ma accetta parametri in esadecimale e più dati da inserire in sequenza, anche su più righe. In caso di parametri esadecimali si usa il prefisso $ e poi i parametri continuano a venire intesi come esadecimali finché non si torna all’uso dei parametri decimali usando il prefisso \#.

Esempio:

```
POKE $1000, AF, #50
```

In questo caso dopo l’indirizzo $1000 specificato in esadecimale viene interpretato il dato AE sempre come esadecimale, poi il dato 50 viene interpretato come decimale perché con prefisso \#.

Altri esempi:

```
POKE $1000,04

POKE $1000,32,41,77
```

**POKE multilinea:** La POKE può continuare nelle linee successive purché inizino con una virgola

Esempio:

```
30 POKE $1000,44,55,A9,3C

40 ,BF,C9,43,2C,4A,F8

50 ,91,A2,54,DE
```

Questa sintassi è molto potente e consente di caricare molti valori con un’unica istruzione. La sintassi esadecimale inoltre è molto più veloce di quella decimale del Basic, pertanto l’esecuzione di una POKE multilinea è velocissima.

L’impiego della POKE multilinea assieme alla funzione SHAPE (che riporta l’indirizzo in memoria di un carattere) è potentissimo. La seguente istruzione ridefinisce la forma di 4 caratteri:

```
1210 POKE SHAPE(85),$00,01,02,1F,7F,ED,7F,3F
1220 ,00,80,40,F8,FE,BB,FE,FC
1230 ,01,01,03,1F,37,3F,1F,15
1240 ,00,00,80,F0,D8,F8,F0,50
```

**POKE+ (16 bit)** - se i valori sono espressi in esadecimale vanno sempre usate 4 cifre

E’ simile alla POKE standard, quindi niente multibyte e multilinea ma ha la caratteristica di essere a 16 bit come la PEEK+.

Esempio:

```
POKE+$1800, 0201:POKE+$9400,0202
```

manda i caratteri di codice rispettivamente 01 e 02 (il byte più significativo è quello più alto) nelle prime due locazioni dello schermo, che in Nesic inizia a $1800. Questi codici schermo corrispondono alle lettere A e B, quindi in alto a sinistra ci apparirà AB scritto in rosso in quanto la seconda istruzione pone il codice colore $02 nelle prime locazioni della RAM colore che in Nesic inizia a $9400. Ovviamente si possono specificare i valori in decimale, si ottiene il medesimo effetto:

```
POKE+6144, 513:POKE+37888,0202,514
```

RENUMBER - RENUMBER 100,10

E’ un’istruzione di utilità: serve a rinumerare le linee di un programma a partire dal primo parametro fornito, con passo pari al secondo parametro, se fornito.

Esempio:

```
RENUMBER
```

rinumera le linee del programma a partire da 100 con passo 10.

```
RENUMBER 50
```

rinumera le linee del programma a partire da 50 con passo 10.

```
RENUMBER 10,5
```

rinumera le linee del programma a partire da 10 con passo 5.

### REPEAT

E’ un’istruzione senza parametri la cui funzione è quella di ripetere la riga corrente.

Esempio:

```
30 IF NOT FIRE REPEAT
```

Questa linea verrà ripetuta fino a che non verrà premuto il tasto FIRE del joystick, quindi il programma rimarrà fermo lì aspettando che il tasto venga premuto.

### REPEAT$ funzione: A$=REPEAT$("A", n)

E’ una funzione che consente di creare una stringa di n caratteri.

Esempio:

```
A$=REPEAT$(" ",22)
```

crea una stringa di 22 spazi.

E’ una funzione utile in abbinamento con VIDEO$ e COLOR$ per lavorare sull’area schermo.

Ad esempio:

```
VIDEO$(0)=REPEAT$(CHR$(0),22):COLOR$(0)=REPEAT$(CHR$(2),22)
```

stampa una riga di @ di colore rosso sulla prima riga di schermo.

Per la tabella dei codici schermo e codici colore è opportuno consultare la documentazione del VIC-20.

### RUN – RUN\[procedura\] – RUN "programma" – RUN "programma", device

RUN consente l’avvio di un programma dall’inizio, cioè dalla procedura presente alla prima linea di programma. Se il programma non inizia con una dichiarazione di procedura avremo un errore.

RUN\[procedura\] invece avvia il  programma a partire dalla procedura dichiarata. Se la procedura da avviare include parametri allora questi devono venire forniti al RUN.

Esempio:

```
10 BGN[NOME],N$

20 PRINT "NOME ";N$

30 END

RUN[NOME],"PIPPO"

NOME PIPPO

READY.

RUN

NOME

READY.
```

Come vediamo dall’esempio il parametro "PIPPO" viene passato alla procedura. Ma vediamo anche l’eccezione: nel caso del comando RUN senza dichiarare la procedura possiamo omettere i parametri ed in tal caso non verrà passato alcun parametro. Ma se dichiariamo la procedura da lanciare allora dovremo dichiarare anche i parametri:

```
RUN[NOME]

?SYNTAX

ERROR IN 10

READY.
```

Il Syntax Error ci informa che nella riga 10 qualcosa non va. In realtà nel caso dei parametri delle procedure non significa che ci sia necessariamente un errore nella linea menzionata ma semplicemente una discrepanza di valori: quello che la dichiarazione di procedura cerca nei parametri non trova riscontro nei parametri passati. E’ impossibile però stabilire dove sia questa discrepanza: potrebbe trattarsi si un parametro mancante o di tipo errato nella chiamata (come in questo caso dove manca) oppure una richiesta di parametro in più alla linea dichiarata nell’errore.

In ogni caso viene segnalato l’errore nella linea dove viene effettuato questo controllo, nel nostro caso nella linea 10.

Per completezza vediamo cosa succede passando un parametro numerico alla procedura che invece richiede una stringa:

```
RUN[NOME],1

?TYPE MISMATCH

ERROR IN 10

READY.
```

Com’era prevedibile abbiamo un Type Mismatch Error.

### RUN "programma"

Carica ed esegue un programma da cassetta.

### RUN "programma", device

Carica ed esegue un programma dal device specificato che può essere: 1 = cassetta, 8 = disco.

### SHAPE - A=SHAPE(n)

Funzione che ritorna l’indirizzo in memoria del carattere n, specificabile anche in esadecimale anteponendo il segno del dollaro $. E’ utile assieme a POKE per poter ridefinire i caratteri.

### SOUND – SOUND(canale)=valore – A=SOUND(canale)

SOUND è sia comando che funzione, in pratica una variabile di sistema.

Esempi:

```
SOUND(1)=100
```

Genera un suono sul canale 1 a frequenza 100.

```
PRINT SOUND(1)
```

Stampa il valore della frequenza del canale 1.

**Per silenziare:**

```
SOUND(1)=0
```

I canali disponibili vanno da 0 a 3, dove il 3 è il canale di rumore, mentre i valori per la frequenza vanno da 0 a 127. I valori di frequenza si possono esprimere anche in esadecimale,  
ad esempio:

```
SOUND(2)=$5A
```

### SYS – SYS numero – SYS $numerohex

SYS è un comando simile a quello del Basic e lancia una routine in linguaggio macchina ma accetta anche un numero esadecimale anteponendo il segno del dollaro $. Può essere usato anche come funzione ed in tal caso rimando alla documentazione specifica di questo comando.

Esempio:

```
SYS $1000
```

### SYS INPUT – SYS INPUT A$

SYS INPUT è un’istruzione di input di una stringa così come viene digitata. A differenza dell’INPUT del Basic non visualizza alcun prompt ed accetta solo variabili stringa che verranno assegnate interamente alla variabile, senza interrompersi alle virgole o altri caratteri. Può essere utile se si vuole disporre interamente della stringa digitata.

### SYS LOAD – SYS LOAD "	nomefile" – SYS LOAD "nomefile", device - SYS LOAD "nomefile", device, startaddress

SYS LOAD consente di caricare un file binario precedentemente salvato con SYS SAVE.

A differenza del LOAD del Basic il SYS LOAD è pensato soprattutto per caricare set di caratteri e routine in LM. Consenrte di specificare un indirizzo di caricamento, anche in esadecimale anteponendo il segno del dollaro $.

Esempi:

```
SYS LOAD
```

carica il primo file da cassetta all’indirizzo specificato nel file.

```
SYS LOAD "nomefile",8
```

carica il file "nomefile" da disco all’indirizzo specificato nel file.

```
SYS LOAD "nomefile",1,$1000
```

carica il file "nomefile" da cassetta all’indirizzo esadecimale $1000.

### **SYS SAVE – SYS SAVE "nomefile" – SYS SAVE "nomefile", device** - SYS SAVE "nomefile", device, startaddress - SYS SAVE "nomefile", device, startaddress, endaddress

SYS SAVE consente di salvare, su cassetta o disco, un’area di memoria. Ciò può essere utile per salvare set di caratteri personalizzati o routine in LM.

Se non vengono specificati gli indirizzi di inizio e fine questi vengono posti di default a $1000 e $1800, comprendendo quindi i 2 k dell’intera area caratteri. Se viene specificato solo l’indirizzo iniziale allora quello finale viene impostato di default a $1800. Ciò consente di salvare agevolmente solo la parte superiore della RAM caratteri dove più frequentemente verranno posti caratteri personalizzati o routine in LM.

### TRIM$ - A$ = TRIM$(B$)

Si tratta di una funzione che elimina gli spazi prima o dopo il contenuto di una stringa di testo.

Ad esempio:

```
PRINT TRIM$("  PIPPO E PL          ")"UTO"
```

stamperà:

```
PIPPO E PLUTO
```

### TRIM LEFT$(stringa) – A$ = TRIM LEFT$(B$)

Questa funzione elimina gli spazi a sinistra del testo contenuto nella stringa.

Ad esempio:

```
PRINT TRIM LEFT$("  PIPPO E PL          ")"UTO"
```

stamperà:

```
PIPPO E PL           UTO
```

quindi solo gli spazi e sinistra della stringa saranno eliminati, al contrario di TRIM$ che li elimina da ambo i lati.

### TRIM RIGHT$ (stringa) – A$ = TRIM RIGHT$(B$)

Questa funzione elimina gli spazi a destra del testo contenuto nella stringa.

Ad esempio:

```
PRINT TRIM RIGHT$("  PIPPO E PL          ")"UTO"
```

stamperà:

```
PIPPO E PLUTO
```

quindi solo gli spazi e destra della stringa saranno eliminati, al contrario di TRIM$ che li elimina da ambo i lati.

### VIDEO – VIDEO=numero – A=VIDEO

Quest’istruzione di base è sia comando che funzione, in pratica una variabile di sistema.

Mi rendo conto che il nome VIDEO non è molto chiaro: la sua funzione è quella di impostare o leggere il valore della locazione di RAM VIDEO dove si trova il cursore (0 - 255).

Esempio:

```
PRINT VIDEO
```

stamperà 32, se il video sarà vuoto, altrimenti il codice video del carattere alla posizione del cursore.

Oppure:

```
VIDEO = 0
```

stamperà una @, il colore del carattere sarà quello corrente.

Per la tabella dei codici schermo e codici colore è opportuno consultare la documentazione del VIC-20, infatti i codici schermo differiscono da quelli usati nella normale PRINT.  
**Attenzione:** l’istruzione VIDEO non si limita a mettere il codice sullo schermo ma imposta anche il colore di quella locazione.

Il cursore non viene fatto avanzare, ma è possibile farlo:

```
VIDEO=10,+:VIDEO=11
```

stamperà:

```
JK
```

infatti il parametro + fa avanzare il cursore.

### VIDEO multibyte

C’è però un’altra caratteristica dell’istruzione VIDEO: è multibyte e si possono usare valori esadecimali con il simbolo $ sul primo di essi (\# per tornare al decimale), quindi possiamo scrivere anche:

```
VIDEO=$B1,B2,B3
```

otterremo 123 on reverse.

### VIDEO (x,y,c) multibyte

Altra caratteristica dell’istruzione VIDEO: è possibile specificare coordinate e colore, ciò consente di usare una sola istruzione per posizionare il cursore e stampare a video, in modo da ottenere maggiore velocità. Non solo: **si possono usare coordinate negative** in modo da poter far uscire dallo schermo parte o tutta una sequenza di caratteri! Non solo: **è possibile usare il ";" come separatore di riga in modo da stampare i caratteri in più righe!**

Esempio:

```
100 BGN[OCCHI]

110 INK=6

120 CSR

130 FOR I=-6 TO 28

140 [OCCHIO],I-2,12

150 [OCCHIO],I+2,12

160 FOR J=1 TO 100:NEXT:' RITARDO

170 NEXT

180 END

190 BGN[OCCHIO], X, Y

200 VIDEO(X-1,Y)=$20;20;20:' CANCELLA A SINISTRA

210 VIDEO(X,Y,2)=$55,43,49;42,51,48;4A,46,4B

220 END
```

in quest’esempio vediamo due occhi rossi fatti con i caratteri semigrafici che si muovono entrando da sinistra dello schermo ed uscendo a destra. Un ciclo FOR-NEXT si occupa di dare un certo ritardo in maniera che il movimento non sia troppo veloce.

L’istruzione non modifica le coordinate correnti del cursore, così come non modifica il colore corrente. E’ possibile specificare anche solo singoli parametri tra parentesi, ad esempio: VIDEO(x)=0 oppure VIDEO(,y)=6 o ancora VIDEO(,,c)=2 sono tutte istruzioni valide e consentono di posizionare solo x, y oppure di impostare il colore. Logicamente è possibile anche una combinazione: VIDEO(x,,c)=3 non specifica la Y che pertanto rimane quella definita dalla posizione corrente del cursore.

### VIDEO$ - comando e funzione: VIDEO$(n)=A$ oppure A$=VIDEO$(n)

Quest’istruzione è molto particolare: consente di leggere e scrivere un’intera riga di video, 22 byte, in una stringa. Non imposta il colore: per quello si usa l’istruzione complementare COLOR$.

Attenzione: nel caso si fornisca una stringa di lunghezza superiore ai 22 caratteri questa verrà troncata. Se si fornisce invece una stringa di lunghezza inferiore verrà stampata solo quella stringa e non tutta la riga di 22 caratteri. Per la tabella dei codici schermo e codici colore è opportuno consultare la documentazione del VIC-20, infatti i codici schermo differiscono da quelli usati nella normale PRINT.

Esempio per copiare una riga in un’altra:

```
A$=VIDEO$(0):VIDEO$(10)=A$
```

Se non serve acquisire la stringa si può scrivere anche:

```
VIDEO$(10)=VIDEO$(0)
```

Perché venga visualizzato correttamente anche il colore è opportuno eseguire di seguito:

```
COLOR$(10)=COLOR$(0)
```

Con l’aiuto della funzione REPEAT$:

```
VIDEO$(0)=REPEAT$(CHR$(160),22):COLOR$(0)=REPEAT$(CHR$(2),22)
```

In questo caso verrà stampata una barra rossa (con il carattere spazio in reverse) sulla prima riga dello schermo.

### VOLUME – VOLUME = numero – A = VOLUME

E’ sia comando che funzione, in pratica una variabile di sistema.

Il suo utilizzo è intuitivo: serve per impostare o leggere il valore corrente del volume (0 – 15).

E’ possibile esprimere anche il valore in esadecimale, ad esempio: VOLUME = $06.

Esempi:

```
VOLUME = 15

PRINT VOLUME
```

### VPEN

Funzione che va usata in coppia con HPEN e consente la lettura della coordinata orizzontale della light pen.

