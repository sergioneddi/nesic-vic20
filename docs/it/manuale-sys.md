# 🧠 Manuale tecnico: l'istruzione SYS avanzata (parametrica e bidirezionale)

Il Nesic estende il classico comando SYS del BASIC introducendo il passaggio nativo dei parametri e la possibilità di invocare routine in Linguaggio Macchina (LM) come funzioni, con la restituzione di valori numerici o stringhe direttamente nel flusso del programma.

## Sintassi in Nesic

Come **comando** (passaggio parametri in ingresso)

```
SYS $1000, par1, par2, par3$
```

Permette di passare un numero indefinito di parametri (numerici o stringhe) direttamente alla routine che risiede all'indirizzo specificato.

Come **funzione** (valore di ritorno numerico o stringa)

```
A = SYS($1000, par1)
B$ = SYS($1010, par1$)
```

In questa modalità, la routine in linguaggio macchina elabora i dati in ingresso e restituisce un valore che il Nesic assegna direttamente alla variabile designata.

## Architettura lato assembler (6502)

Per usufruire di questa caratteristica, lo sviluppatore di routine in linguaggio macchina deve interfacciarsi con i vettori e le routine del Kernel/Interprete del Nesic per prelevare i parametri dallo stack del parser e depositare il valore di ritorno.

### Leggere i parametri in ingresso

Quando il Nesic incontra una virgola dopo l'indirizzo della SYS, il puntatore del parser si sposta sul parametro successivo. Lato Assembler, è possibile sfruttare le routine interne dell'interprete (mappate nella ROM della cartuccia Nesic) per validare e prelevare i dati:

• **Parametri numerici (byte / word):** La routine in codice macchina può chiamare la routine del parser del Nesic (es. JSR GETNUM) che analizza l'espressione, verifica che sia un numero e deposita il valore nei registri della CPU (es. Registro A per un byte, o una coppia di celle in Pagina Zero per una Word a 16 bit).

• **Parametri stringa:** Chiamando la routine preposta (es. JSR GETSTR), l'interprete Nesic convalida la stringa e restituisce in Pagina Zero il puntatore (Descrittore della stringa: Indirizzo e Lunghezza) dell'area di memoria in cui il testo è temporaneamente allocato.

### Gestire il valore di ritorno (modalità funzione)

Se la SYS è stata invocata all'interno di un'espressione di assegnazione (es. A = SYS(...)), l'interprete si aspetta che la routine in linguaggio macchina depositi il risultato prima di eseguire l'istruzione RTS.

• **Ritorno numerico:** Prima di uscire con RTS, la routine in LM deve caricare il valore finale nell'accumulatore o nei registri designati dal Nesic (es. l'accumulatore Floating Point del VIC-20 o un registro interno del Nesic) affinché il parser possa prelevarlo e assegnarlo alla variabile.

• **Ritorno stringa:** La routine deve costruire la stringa nella RAM libera (o nell'area dei buffer temporanei), impostare il descrittore di stringa corretto e passare l'indirizzo di questo descrittore all'interprete del Nesic subito prima del ritorno.

## 🔀 Flessibilità asimmetrica e tolleranza della SYS

L'istruzione SYS del Nesic v2.4 opera in modo dinamico e adattivo, garantendo la massima libertà al programmatore sia nell'uso ad alto livello che nella scrittura delle routine in linguaggio macchina.

### Ignorare il valore di ritorno (uso come comando)

Se una routine in linguaggio macchina è stata progettata per restituire un valore (numerico o stringa), l'utente è comunque libero di invocarla come un semplice comando standard, qualora il risultato dell'elaborazione non sia di suo interesse:

```
SYS $1000, 5 :' Esegue la routine ma scarta il risultato
```

In questo scenario, il parser del Nesic esegue la routine e, al ritorno dall'istruzione RTS, rileva che non è presente alcuna variabile di destinazione. Il sistema provvede quindi a ripulire istantaneamente i buffer temporanei e a scartare il dato in sicurezza, evitando perdite di memoria (memory leak) o accumuli nello stack delle stringhe.

### Valore di ritorno di default (uso come funzione)

Allo stesso modo, se si tenta di invocare in un'assegnazione una vecchia routine in LM non progettata per il Nesic (che quindi non imposta alcun flag di ritorno prima dell' RTS):

```
A = SYS($1000, 5) :' Forza la chiamata come funzione
```

Il Nesic applica una logica di tolleranza hardware: esegue la routine in sicurezza e, se al ritorno verifica che la routine non ha depositato dati né alterato la stabilità del sistema, assegna automaticamente alla variabile il valore di default 0.

**⚠️ Nota bene:** Sebbene il Nesic implementi algoritmi avanzati per evitare il collasso dello stack e proteggere la memoria, l'efficacia di questa tolleranza è legata alla correttezza della routine in linguaggio macchina, che non deve in alcun modo corrompere le locazioni vitali della Pagina Zero o lo stack pointer oltre i limiti di riallineamento dell'interprete.

## 🔬 Esempio: cambio di colore dinamico tramite SYS ibrida

Per comprendere appieno la potenza della SYS parametrica del Nesic V2.4, analizziamo una routine in Linguaggio Macchina (LM) scritta per risiedere all'indirizzo $1600.

Questa routine dimostra come lo stesso codice possa fungere contemporaneamente da **funzione di lettura** (per salvare lo stato hardware) e da **comando di scrittura** (per alterare i registri del chip video 6561), il tutto interfacciandosi con i vettori del sistema.

### Il codice sorgente assembler (6502)

```
*=$1600

; --- VETTORI E SUBROUTINE INTERNE ---
VIRGOLABYTE = $D7F1     ; Verifica la presenza di una virgola nel parser
                        ; ed estrae nel Registro X un intero limitato (0 - 255).
MAKFP       = $D391     ; Converte l'intero a 16 bit presente in A (High) 
                        ; e Y (Low) in formato Floating Point.

; --- ENTRY POINT PRINCIPALE ---
; Può essere chiamato come: SYS $1600, colore  OPPURE  C = SYS($1600, colore)

COLORS  JSR VIRGOLABYTE   ; Valuta l'argomento successivo e mette il colore in X
        LDA $900F         ; Legge il VECCHIO valore del registro Schermo/Bordo del VIC
        STX $900F         ; Scrive il NUOVO colore (prelevato da X) nel registro VIC
        TAY               ; Sposta il vecchio valore (da A) nel registro Y (Byte Low)
        LDA #$00          ; Azzera il registro A (Byte High) per formare una Word a 16 bit
        JMP MAKFP         ; Converte AY in valore di ritorno per il Nesic ed esegue l'RTS
```

#### Analisi dell'esecuzione in linea di comando

A questo punto può venire digitata ed eseguita la seguente riga multi-istruzione in modalità diretta (senza numero di linea) oppure può venire inserita in un programma:

```
C=SYS($1600, 0):FOR I=1 TO 255:SYS $1600,I:NEXT:SYS $1600,C
```

Il Nesic processa la riga dividendo l'azione in tre fasi distinte ad altissima velocità:

**1. Fase di lettura e salva (C=SYS($1600,0)):**

Viene invocata la SYS come funzione. Il parametro 0 viene passato alla routine che imposta momentaneamente lo schermo a nero. Subito prima, però, la routine legge il registro $900F, recupera il colore originario del sistema e lo restituisce al Nesic tramite MAKFP. Il Nesic assegna questo valore alla variabile C.

**2. Fase di ciclo (FOR I=1 TO 255 : SYS $1600,I : NEXT):**

Viene avviato un ciclo rapidissimo in cui la SYS viene usata come comando puro. Il valore di ritorno generato da MAKFP viene ignorato e scartato dal Nesic senza sporcare la memoria. La routine in LM aggiorna il registro video a ogni iterazione. La velocità del codice macchina è tale da anticipare e tracciare visivamente l'andamento del raster video, generando lo splendido effetto a barre colorate visibile nell'immagine.

**3. Fase di ripristino (SYS $1600,C):**

Al termine del ciclo, viene eseguita un'ultima chiamata passandogli la variabile C. Il registro del VIC $900F viene riscritta con il colore iniziale salvato nella prima fase, ripristinando lo stato originario dello schermo.

### 🧵 Gestione avanzata della memoria dinamica: il ritorno di stringhe tramite SYS

Se il passaggio e il ritorno di valori numerici tramite l'accumulatore Floating Point (MAKFP) è un'operazione lineare, la gestione del **ritorno di valori stringa** da una funzione in Linguaggio Macchina rappresenta la sfida tecnica più complessa dell'architettura a 8-bit.

Quando il Nesic esegue un'assegnazione o una concatenazione complessa, ad esempio:

```
A$ = "LIVELLO " + SYS($1600, Q) + " SUPERATO!"
```

L'interprete deve valutare le stringhe letterali e, nel contempo, saltare alla routine $1600 per prelevare il testo dinamico convertito in LM.

## 🔬 Ritorno di stringhe statiche tramite SYS

Mentre il ritorno di un valore numerico sfrutta l'accumulatore matematico del sistema, il ritorno di dati testuali richiede la configurazione di un **descrittore di stringa** in Pagina Zero e l'attivazione del flag di tipo stringa prima dell'istruzione RTS.

Il seguente codice mostra come predisporre due punti di ingresso distinti ($1600 e $1613) per restituire al volo due stringhe fisse da concatenare o assegnare direttamente in Nesic.

### Il codice sorgente assembler (6502)

```
*=$1600

; =========================================================================
; ENTRY POINT 1: Ritorna la stringa "ciao"
; Sintassi Nesic: A$ = SYS($1600)  [equivalente decimale: SYS 5632]
; =========================================================================

CIAO		LDA #TESTOEND-TESTO   ; Calcola la lunghezza della stringa "ciao" (4 byte)
            STA $61               ; Salva la lunghezza nel descrittore (Byte 1)
            LDA #<TESTO           ; Preleva l'indirizzo Low della stringa
            STA $62               ; Salva nel descrittore (Byte 2)
            LDA #>TESTO           ; Preleva l'indirizzo High della stringa
            STA $63               ; Salva nel descrittore (Byte 3)
            JMP RITSTR            ; Salta alla routine di chiusura stringa
TESTO       BYTE "ciao"
TESTOEND

; =========================================================================
; ENTRY POINT 2: Ritorna la stringa " mondo!"
; Sintassi Nesic: B$ = SYS($1613)  [equivalente decimale: SYS 5651]
; =========================================================================

MONDO       LDA #TESTOEND1-TESTO1 ; Calcola la lunghezza della stringa (7 byte)
            STA $61               ; Salva la lunghezza nel descrittore
            LDA #<TESTO1          ; Preleva l'indirizzo Low
            STA $62               ; Salva nel descrittore
            LDA #>TESTO1          ; Preleva l'indirizzo High
            STA $63               ; Salva nel descrittore
            JMP RITSTR            ; Salta alla routine di chiusura stringa

TESTO1      BYTE " mondo!"
TESTOEND1

; =========================================================================
; ROUTINE DI CHIUSURA E CONFIGURAZIONE DEL FLAG
; =========================================================================

RITSTR      LDA #$FF              ; Carica il valore $FF (Identificatore tipo Stringa)
            STA $0D               ; Imposta la cella $0D in Pagina Zero (Flag di Tipo del Nesic)
            RTS                   ; Ritorna in sicurezza all'interprete
```

### Applicazione in Nesic (esempio combinato)

Grazie alla precisione di questo interfacciamento a basso livello, le due chiamate in codice macchina possono essere inserite direttamente all'interno delle espressioni di stringa standard del Nesic, beneficiando della protezione dello stack a 3 posizioni di sistema.

A questo punto si potrà digitare direttamente nell'editor:

```
10 BGN[TEST STRINGHE]
20 PRINT SYS($1600) + SYS($1613)
30 END
```

All'esecuzione del programma tramite RUN, il Nesic:

**1.** Salterà a $1600, intercetterà il flag $FF in $0D, leggerà il descrittore in $61-$63 e depositerà temporaneamente la stringa "ciao".

**2.** Salterà immediatamente dopo a $1613, ripeterà l'operazione per " mondo!".

**3.** Il motore delle stringhe eseguirà la concatenazione sicura senza mandare in blocco l'ambiente o corrompere i puntatori della memoria dinamica, stampando a video:

```
CIAO MONDO!
```

Naturalmente è possibile lanciare il seguente comando diretto, invece di scrivere le tre righe di programma:

```
PRINT SYS($1600) + SYS($1613)
```

Il risultato sarà il medesimo.

