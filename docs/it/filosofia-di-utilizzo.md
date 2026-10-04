# NESIC v2.4

## filosofia di utilizzo

### Cos'è il Nesic?

Il Nesic è una mia variante strutturata del Basic (**NESIC** = **NE**ddi-ba**SIC**).  
Ma attenzione! Il Nesic non è precisamente Basic, almeno secondo le convenzioni standard.  
L'acronimo lo possiamo intendere anche come **N**on **E'** ba**SIC** oppure come **N**esic non **E'** ba**SIC**.  
Il Nesic è basato su procedure: non utilizza GOTO e GOSUB tipiche del Basic ma delle procedure che vengono richiamate per nome.

Si tratta di un linguaggio che avevo scritto per il VIC-20 nel lontano 1984 e del quale ho rinvenuto una stampa di una versione purtroppo non definitiva. Ultimamente l'ho completato ricostruendo le caratteristiche che avevo perso ed ho aggiunto anche qualche funzionalità. Essendo comunque una variante del Basic in linea di massima le istruzioni sono quelle del Basic v2.0 del VIC-20 ma con delle mie aggiunte.

Il fatto che il Nesic sia basato su procedure potrà disorientare chi è abituato al Basic classico, dove si può scrivere:

```
10 PRINT "CIAO MONDO!"
```

In questo caso il Nesic ci risponderà così:

```
?PROC NOT FOUND

ERROR
```

Questo perché il programma per venire eseguito ha bisogno che la prima riga inizi con una dichiarazione di procedura, con un nome qualsiasi. Io di solito ci metto il nome del programma, così mi resta come promemoria quando ritrovo il file. Questo mi è servito per identificare alcuni listati che avevo stampato nel lontano 1984 e li avevo conservati senza altre annotazioni. Quindi il fatto che il Nesic costringa a scrivere una dichiarazione di procedura all'inizio del programma è una cosa utile, anche se ha una sua occupazione di memoria, che nel caso del VIC-20 è veramente ridotta all'osso.

Nel caso dell'esempio sopra ecco la sua conversione in Nesic:

```
10 BGN[ESEMPIO 1]

20 PRINT "CIAO MONDO!"

30 END
```

A questo punto notiamo anche la riga 30 END che nel Nesic indica la fine di una procedura e consente il ritorno alla procedura chiamante. Possiamo infatti pensare alle procedure del Nesic un po' come a delle GOSUB che vanno ad etichette alfanumeriche e alla END come ad un RETURN.  
Nel nostro caso se non ci fosse la END finale non succederebbe nulla: il programma terminerebbe comunque, ma se la procedura ESEMPIO 1 fosse richiamata da altra parte del programma questa una volta eseguita non ritornerebbe al chiamante ma terminerebbe il programma.

### Come si richiamano le procedure?

Le procedure si richiamano per nome. Ad esempio facciamo delle procedure per un'ipotetica lavatrice:

```
100 BGN[LAVATRICE]

110 [LAVA]

120 [RISCIACQUA]

130 [CENTRIFUGA]

140 [STOP]

150 END

160 BGN[LAVA]

170 PRINT "METTI DETERSIVO"

180 PRINT "CARICA ACQUA"

190 PRINT "SCALDA ACQUA"

200 PRINT "MESCOLA"

210 PRINT "SCARICA ACQUA"

220 END

230 BGN[RISCIACQUA]

240 PRINT "CARICA ACQUA"

250 PRINT "MESCOLA"

260 PRINT "SCARICA ACQUA"

270 END

280 BGN[CENTRIFUGA]

290 PRINT "CENTRIFUGA"

300 END

310 BGN[STOP]

320 PRINT "LAVAGGIO FINITO!"

330 END
```

Dando il RUN otterremo:

```
METTI DETERSIVO

CARICA ACQUA

SCALDA ACQUA

MESCOLA

SCARICA ACQUA

CARICA ACQUA

MESCOLA

SCARICA ACQUA

CENTRIFUGA

LAVAGGIO FINITO!
```

Come si vede la struttura è molto chiara, anche perché ho messo un'istruzione per linea ma si possono metterne di più come per il Basic standard. Ad esempio la procedura STOP può venire scritta così:

```
310 BGN[STOP]:PRINT "LAVAGGIO FINITO!":END
```

Le procedure però possono venire richiamate anche in modo diretto, ad esempio digitando:

```
[RISCIACQUA]
```

avremo come risultato la stampa:

```
CARICA ACQUA

MESCOLA

SCARICA ACQUA
```

Risultato analogo lo avremo digitando RUN\[RISCIACQUA\] però RUN esegue una procedura cancellando le variabili, come l'esecuzione di un normale RUN del Basic.

### Si possono passare dei parametri?

Il Nesic consente di passare parametri alle procedure. Ad esempio:

```
10 BGN[PROVA PARAMETRO]

20 [NOME],"PIPPO"

30 END

40 BGN[NOME],N$

50 PRINT "CIAO ";N$;"!"

60 END
```

Dando il RUN otterremo:

```
CIAO PIPPO!
```

Ma potremo anche digitare:

```
[NOME],"SERGIO"
```

oppure:

```
RUN[NOME],"SERGIO"
```

ed otterremo comunque:

```
CIAO SERGIO!
```

In questo caso, come avrete notato, il parametro consente di specificare un nome differente.

Digitando invece \[NOME\] o RUN\[NOME\], cioè richiamando la procedura senza specificare parametri otterrete:

```
?SYNTAX

ERROR IN 40
```

perché non è stato fornito il parametro richiesto dalla procedura in linea 40.

Tenere presente che, anche se l'uso dei parametri facilita la programmazione, le variabili sono quelle normali del Basic, quindi si tratta di variabili globali.

### Procedure annidate

Come abbiamo visto nell'esempio della lavatrice è possibile annidare più procedure.

Vediamo questo esempio semplificato:

```
10 BGN[ANNIDAMENTO]

20 PRINT "PRIMA"

30 [ANNIDATA]

40 PRINT "DOPO"

50 END

60 BGN[ANNIDATA]

70 PRINT "ANNIDATA"

80 END
```

Con il RUN otterremo:

```
PRIMA

ANNIDATA

DOPO
```

Ma ora proviamo questa variazione:

alla linea 80 digitiamo:

```
80 END[ANNIDAMENTO]
```

Al RUN otterremo:

```
PRIMA

ANNIDATA
```

questo perché abbiamo terminato non la procedura ANNIDATA ma la procedura precedente, nel nostro caso la principale, ANNIDAMENTO, e quindi quello che segue la chiamata alla procedura ANNIDATA non viene più eseguito.

### Ripetizione di una procedura

Può esserci la necessità di ripetere l'esecuzione di una procedura di continuo, ad esempio per il loop principale di un gioco. In tal caso possiamo usare AGAIN al posto di END.

Ad esempio alla linea 80 scriviamo:

```
80 AGAIN
```

E poi al RUN otterremo:

```
PRIMA

ANNIDATA

ANNIDATA

ANNIDATA

ANNIDATA

ANNIDATA

ANNIDATA

ANNIDATA

ANNIDATA
```

e così via finché non fermeremo il programma con RUN/STOP.

Questo perché una volta entrati nella procedura ANNIDATA questa si ripeterà indefinitamente.

### Ma se vogliamo uscire dalla procedura?

Semplice, con una determinata condizione lo possiamo fare: con una END o END\[procedura\].

Ad esempio aggiungiamo:

```
75 IF FIRE END
```

In questo caso usciremo premendo il tasto FIRE del joystick, infatti premendo questo tasto verrà eseguita l'istruzione END.

Al RUN avremo quindi:

```
PRIMA

ANNIDATA

ANNIDATA

ANNIDATA

ANNIDATA

ANNIDATA

...

ANNIDATA

ANNIDATA

ANNIDATA

DOPO
```

Quindi dopo una serie indefinita di ANNIDATA alla pressione del tasto FIRE avverrà l'uscita dal loop e quindi verrà stampata la parola DOPO.

### E se invece di proseguire vogliamo eseguire tutto daccapo?

Possiamo in tal caso invece che END scrivere AGAIN\[ANNIDAMENTO\]. Ciò eseguirà la procedura principale ANNIDAMENTO daccapo.

Modifichiamo la linea 75 in:

```
75 IF FIRE AGAIN[ANNIDAMENTO]
```

Al RUN otterremo:

```
PRIMA

ANNIDATA

ANNIDATA

ANNIDATA

ANNIDATA

ANNIDATA

ANNIDATA

ANNIDATA

ANNIDATA
```

quando premeremo FIRE otterremo:

```
PRIMA

ANNIDATA

PRIMA

ANNIDATA

PRIMA

ANNIDATA

PRIMA

ANNIDATA
```

e così via fino a quando termineremo il programma.

### E se vogliamo uscire proprio dal programma?

Come abbiamo visto negli esempi precedenti basta terminare la procedura principale.

Modifichiamo la linea 75 in:

```
75 IF FIRE END[ANNIDAMENTO]
```

In tal caso alla pressione del tasto FIRE verrà terminata la procedura denominata ANNIDAMENTO. E' la procedura principale, quindi si uscirà dal programma.

Come potete notare c'è un'altra particolarità che differenzia il Nesic dal normale Basic: **il THEN nella IF è facoltativo**.

**Facoltativo? Quasi!** Ci sono delle eccezioni che però ho incontrato raramente.

Ad esempio:

```
IF A=B C=1
```

Questa fallirà perché in Basic (e quindi in Nesic) gli spazi non contano come distanziatori.

La riga viene vista così:

```
IFA=BC=1
```

e quindi si coinvolge una variabile BC e non si otterrà ciò che si vuole. In questi casi le soluzioni sono 2: o si mette il THEN oppure più semplicemente un due punti ":"

```
IF A=B:C=1
```

In questa maniera funziona perfettamente e risparmia spazio sulla linea rispetto al THEN (non in memoria in quanto ":" occupa un byte come il token del THEN). Quindi nel dubbio oppure se vedete un comportamento strano in qualche IF mettete pure un ":" e vi trarrete d'impaccio.

