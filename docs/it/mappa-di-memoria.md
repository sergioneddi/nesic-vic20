# MAPPA DI MEMORIA

Il Nesic non usa le impostazioni RAM classiche che sono variabili in base al quantitativo di RAM installato nel computer, usa invece una configurazione fissa. Per la precisione la RAM da $1000 a $17FF viene utilizzata per la mappa caratteri ed eventualmente come zona per allocare delle routine in LM da parte dell'utente. Nei miei esempi le routine in LM sono allocate a partire da $1600.

Attualmente non è prevista vera grafica bitmap ma solo grafica a caratteri, come generalmente si usa per i giochi.

L'area schermo parte da $1800 fino a $19FF, mentre l'area programmi inizia a $1A00 e si estende a tutta la RAM disponibile.

L'eventuale espansione RAM da 3k, mappata nel campo $0400 - $0FFF **non viene utilizzata**.

## Ricapitolando:

**$0400 - $0FFF:** 3k RAM opzionale - se presente, **NON UTILIZZATA**

**$1000 - $17FF:** 2k Mappa caratteri ed eventualmente routine in LM (consigliato a partire da $1600)

**$1800 - $19FF:** 512 byte (in realtà 506 utilizzati) Area schermo (22 x 23)

**$1A00 - $????:** Area programmi che occupa tutta la RAM disponibile.

Dato che il Nesic occupa i primi 2k della RAM base non è consigliabile utilizzarlo su computer senza almeno un’espansione di 8k, visto che nel VIC inespanso la RAM che risulta disponibile è di 1,5k, troppo poca per qualsiasi utilizzo.

Nel mio caso, nel 1984, quando ho sviluppato il linguaggio, avevo disponibile un’espansione da 16k.

