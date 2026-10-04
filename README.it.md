# NESIC (NEsic is not baSIC)

> \*\*[🇬🇧 Read the documentation in English\*\*](file:///D:/Download/Software/VIC20/prg/nesic/per%20rilascio/doc/README.md)

**NESIC** (*NEsic is not baSIC*) è un linguaggio di programmazione strutturato progettato per il **Commodore VIC-20**.

Concepito e sviluppato originariamente nel **1984**, il progetto era stato inizialmente interrotto a causa dei severi limiti di memoria fisica del VIC-20 base, che costringevano a spezzare il codice sorgente in due parti distinte per poterlo assemblare tramite *Mikro Assembler*.

Dopo decenni in cui era andato perduto, il codice sorgente originale è stato meticolosamente recuperato da stampe dell'epoca. I frammenti incompleti sono stati fusi in un unico sorgente, completati e potenziati con nuove funzionalità moderne, trasferendo l'intero flusso di sviluppo su **CBM prg Studio**.

## 🚀 Caratteristiche Principali

- **🧩 Programmazione Strutturata:** Dì addio al codice a "spaghetti" pieno di `GOTO` e `GOSUB`. NESIC introduce flussi di controllo strutturati, puliti e leggibili.

- **💾 Compatibilità Parziale con il BASIC 2.0:** Progettato per far sentire a casa qualsiasi programmatore VIC-20, permettendo di riutilizzare la sintassi familiare e i comandi fondamentali.

- **🔌 Funzionalità SYS Avanzata:** Una chiamata `SYS` evoluta che non si limita a eseguire routine in linguaggio macchina, ma gestisce il passaggio dei parametri e restituisce valori, fungendo da potente meccanismo per espandere all'infinito il linguaggio stesso.

## 📋 Requisiti di Memoria e Contesto Hardware

NESIC è stato originariamente sviluppato nel 1984 su un **Commodore VIC-20 dotato di un'espansione di RAM da 16 KB**. A causa delle funzionalità grafiche avanzate, l'ambiente ha dei prerequisiti di memoria ben precisi:

- **Macchina Base:** Commodore VIC-20 (PAL/NTSC).

- **Espansione di RAM:** Richiede **almeno un'espansione da 8 KB** (o superiore, come 16 KB/24 KB).

- **Nota Importante sulla Memoria:** Le routine grafiche integrate allocano e utilizzano **2 KB** di RAM esclusivamente per la memoria video. Su un VIC-20 base rimarrebbero solo 1.5 KB liberi, rendendo l'ambiente inutilizzabile.

- **Espansioni da 3 KB:** Un'eventuale espansione da 3 KB **verrà ignorata**, poiché è strutturalmente insufficiente e incompatibile con la mappatura di memoria richiesta dall'interprete.

- **Emulazione:** Pienamente compatibile con **VICE** (xvic) o hardware reale.

## 🛠️ Come compilare ed eseguire

### Compilare dal sorgente

1. Scaricare e installare [CBM prg Studio](http://ajordison.co.uk/).

2. Clonare questa repository o scaricare i file sorgente.

3. Aprire nesic2.4.asm in CBM prg Studio.

4. Premere **Build** (F2) per generare il file eseguibile (.prg).

### Eseguire l’interprete

Caricare il file binario compilato nesic-blk5-2.4.0.crt o nesic-blk5-2.4.0.prg nell’emulatore come cartuccia nel Blocco 5, oppure su un VIC-20 reale.

## 📚 Panoramica sulla sintassi del linguaggio

NESIC colma il divario tra gli ambienti Commodore di vecchia concezione e la programmazione strutturata.

### Strutture di controllo

Invece di basarsi pesantemente sui numeri di riga, NESIC utilizza procedure e moderne strutture di controllo del flusso, come i blocchi **IF ... THEN ... ELSE**, per una ramificazione pulita. L'uso dell'istruzione **THEN** è facoltativo.

### La funzione avanzata SYS

Il fiore all'occhiello dell'architettura di NESIC è il suo comando (che è anche funzione) SYS estensibile. Esso consente di passare variabili direttamente a routine in linguaggio assembly 6502 e di recuperare un risultato all'interno dell'ambiente:

```
X = SYS($1600, A, B):PRINT "Risultato della routine assembly: "; X
```

*Per un'analisi dettagliata dell'architettura e una guida passo-passo alla mappatura dei registri, si prega di consultare il manuale dedicato nella cartella docs/.*

## 📜 Cronologia delle Versioni e Roadmap

NESIC segue una numerazione che rispetta la timeline di sviluppo originale del 1984, creando un ponte diretto tra il codice storico e le estensioni moderne.

### ⏳ Cronologia

- **v1.x (1984):** Sviluppo iniziale. Focalizzato esclusivamente sull'introduzione delle strutture del linguaggio, demandando il resto delle funzionalità al BASIC 2.0 del Commodore.

- **v2.0 – v2.3 (1984):** Architettura estesa. Inizio dell'aggiunta e della sostituzione dei comandi nativi. La versione 2.3 (~3.5 KB) è stata l'ultima release incompleta conservata su tabulati cartacei prima che il progetto andasse perduto.

- **v2.4 (2026 - Versione Attuale):** **Il Restauro e l'Espansione.** I frammenti cartacei della v2.3 sono stati interamente recuperati, fusi e completati. Nuove funzionalità moderne sono state implementate tramite CBM prg Studio, portando l'interprete a occupare circa 5.5 KB.

### 🎯 Gestione della Memoria e Sviluppi Futuri

L'interprete risiede nell'area di espansione del **Blocco 5** del VIC-20 (8 KB di capacità totale).

- Spazio attuale occupato: **~5.5 KB**.

- Spazio residuo: **~2.5 KB** ancora disponibili per ottimizzazioni future e nuovi comandi.

### 🗺️ 🤝 Contributi e licenza

Questo progetto è un omaggio open source alla storia del retrocomputing. Sentiti libero di aprire segnalazioni (issue), inviare pull request o condividere i tuoi esempi di codice NESIC!

Distribuito con **licenza MIT**. Consulta il file `LICENSE` per ulteriori informazioni.

*Creato da Sergio Neddi — 1984, restaurato nel 2026.*

