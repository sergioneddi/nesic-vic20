# 📜 Cronache di un restauro: il recupero del Nesic

Il rilascio del **Nesic v2.4** non è solo la pubblicazione di un linguaggio di programmazione, ma il culmine di un'avventura di archeologia del software durata più di quarant'anni. È la storia di un codice che ha rischiato di svanire nel nulla e che è stato salvato un pezzo alla volta.

### 📼 Il nastro smarrito, i traslochi e la versione 1.4

Negli anni '80, il supporto di memorizzazione standard per il Commodore VIC-20 era l'audiocassetta. L'intera suite di sviluppo originale del Nesic, completata nel **1984**, risiedeva su un nastro magnetico che, nel corso degli anni, è andato irrimediabilmente perduto.

Dall'epoca dello sviluppo a Vicenza fino all'attuale residenza in provincia di Padova, il progetto ha attraversato ben **tre traslochi**. Come recita il famoso detto popolare, *"tre traslochi equivalgono a un incendio"*: è un miracolo che il materiale cartaceo sia sopravvissuto a decenni di scatoloni e riorganizzazioni.

Il primo timido tentativo di recupero digitale è avvenuto grazie a una copia di backup conservata da mio fratello (che vive a oltre 200 km di distanza). Purtroppo, quella cassetta conteneva solo una vecchia **versione 1.4**: un prototipo embrionale con i soli comandi strutturali di base e nessuna delle ottimizzazioni avanzate.

### ✉️ Il rifiuto dell'editoria dell'epoca

Nel 1984, fiero del lavoro completato, scrissi alla celebre rivista **MC-microcomputer** descrivendo le potenzialità del linguaggio. Ero pronto a spedire alla redazione una schedina hardware autocostruita con una EPROM per permettere loro di testarlo sul campo. Purtroppo la rivista all'epoca non mostrò interesse per il progetto. Amareggiato dal mancato riscontro, decisi di archiviare il Nesic e di metterlo da parte. D’altronde era comprensibile: nel 1984 il VIC-20 era in declino, sopraffatto dalla nuova stella Commodore: il C64. Inoltre il Nesic, oltre alla cartuccia del linguaggio, richiedeva un’espansione RAM di almeno 8k, quindi anche di un bus in grado di ospitare entrambe. All’epoca pochi utenti avrebbero potuto effettivamente provarlo.

### 📄 i pacchi di carta e il re-typing

La svolta recente è arrivata con il rinvenimento di un immenso pacco di vecchie stampe cartacee del 1984. Tra quei fogli c'erano i due sorgenti originali in **Mikro Assembler** (all'epoca divisi in due tronconi separati poiché l'espansione RAM da 16K del VIC-20 non permetteva di gestire listati troppo lunghi). A un primo esame le stampe erano incomplete, ma i fogli mancanti sono saltati fuori mesi dopo, nascosti in tutt'altri scatoloni.

È iniziato così il monumentale lavoro di riscrittura manuale (*re-typing*) riga per riga all'interno dell'emulatore **VICE**, sempre sotto l'ambiente Mikro Assembler originale. Questa fase è stata un percorso a ostacoli tra centinaia di errori di battitura, correzioni a matita dell'epoca quasi indecifrabili e la parziale perdita della memoria storica sui flussi del codice.

### 🧠 Il tassello mancante: La ricostruzione a memoria

Una volta compilato con successo il sorgente cartaceo, è emersa l'ultima verità: quel listato non rappresentava la release finale del 1984, ma una versione precedente. All'appello **mancavano totalmente il passaggio dei parametri alle procedure e l'intera infrastruttura di gestione degli errori, così come mancava la possibilità di avere il THEN facoltativo**.

Fortunatamente possedevo la stampa dei listati dei programmi di prova definitivi dell'epoca. Sulla base di quei test, sapevo esattamente *come* il linguaggio avrebbe dovuto comportarsi. Per ricostruire il passaggio dei parametri, è venuta in aiuto la memoria: mi sono ricordato che nel 1984 avevo risolto il problema implementando a basso livello **una routine che eseguiva una serie di istruzioni `LET` ripetute**, mappando sequenzialmente i valori passati alla procedura. Questa intuizione del passato mi ha permesso di riscrivere da zero le funzionalità mancanti su *CBM prg Studio*, fondendo i due tronconi in un unico sorgente moderno e portando finalmente alla luce, dopo 40 anni, il **Nesic v2.4**.

