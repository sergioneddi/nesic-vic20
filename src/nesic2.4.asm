*=$A000

; ************ NESIC 2.4 ************

; SUBROUTINE ROM
READY=$C474     ; Display READY message
CHROUT=$FFD2    ; Output character to channel
CLR=$C660       ; go do "CLEAR"
CLSR=$E55F      ; Clear the screen
PRTSTR=$CB1E    ; Print string ASCIIZ pointed to by .A .Y with CR return
LINKPRG=$C533   ; Rechain BASIC program lines
ESPR=$CD9E      ; FRMEVL - Master routine for formula and expression
ESPRAR=$CD8A    ; evaluate expression and check is numeric, else do type mismatch
PARDX=$CEF7     ; Check for close parenthesis
PARSX=$CEFA     ; Check for open parenthesis
VIRGOLA=$CEFD   ; Check for comma in syntax
CMPCAR=$CEFF    ; Syntax check for specific character from CHRGET
LNUMINT=$C96B   ; LeggiNUMeroINTero - get fixed-point number into temporary integer
FINEISTR=$C8F8  ; SKIPST - scan for next BASIC statement ([:] or [EOL])
UNTOKENS=$C71A  ; uncrunch BASIC tokens
GETBYTE=$D79E   ; prende in X un parametro numerico 0 - 255
IRQHANDLER=$EABF ; IRQ HANDLER
GETSTK=$C3FB    ; Check Stack Depth
STRINGCHK=$CD8F ; check if source is string, else do type mismatch
BASICWARM=$C483 ; Basic Warm Start
FRETMP=$D6DB    ; scarica la stringa temporanea dallo stack (fornire puntatore in A-Y)
RUNSTOP=$F770   ; test se tasto RUN/STOP premuto
ALCSPC1=$D47D   ; crea spazio per nuova stringa con lunghezza A, byte basso in X e byte alto in Y
                ; il descrittore sarà creato in $61, $62, $63
POPDESC=$D6AA   ; pop (YA) descriptor off stack or from top of string space in $22-$23
                ; returns with A = length, X = pointer low byte, Y = pointer high byte
POPDESC1=$D6A6  ; pop (descriptor ptr $64-$65) descriptor off stack or from top of string space in $22-$23
                ; returns with A = length, X = pointer low byte, Y = pointer high byte
STRCOPY=$D68C   ; store string from pointer to utility pointer (lungh. A, $22-$23 => $35-$36)
PUTSTR=$D4CA    ; controlla che ci sia spazio nel descriptor stack
                ; e poi mette in questo stack il descrittore presente a $61, $62 e $63
INITMEM=$FD8D   ; Initialize system memory
RESTOR=$FD52    ; Reset RAM vectors to defaults
INITVIA=$FDF9   ; Initialize the 6522 VIA registers
INITSK=$E518    ; Initialize 6550 VIC chip screen, and pointers
INITBA=$E3A4    ; Initialize BASIC: restore page zero pointers
FREMSG1=$E412   ; calcola e stampa "bytes free"
COLDBA1=$E381   ; inizializza Stack Pointer e va al READY
NEWSTT=$C7AE    ; Find next BASIC statement for execution
BISEXE=$C7ED    ; esegue istruzioni BASIC
BFNEXE=$CE8D    ; esegue funzioni BASIC
BLIST=$C6EF     ; LIST Basic
BUMPTP=$C8FB    ; Increment TXTPTR by amount in .Y - per puntare a istruzione successiva
DECPTR=$C8C5    ; prende il puntatore $5F-$60 e lo salva decrementato in $7A-$7B
                ; va chiamata con Carry settato!
FLTASC=$DDDD    ; convert float FAC1 to ASCII string result in (AY)
POC01=$DC49     ; set exponent = X, clear mantissa 4 and 3 and normalise FAC1
GETLIN=$C560    ; input in $0200 stringa terminata con zero
POC02=$C496
NEWLIN1=$C49F   ; handle new BASIC line
CLR2=$C659      ; reset execute pointer and do CLR
FINLIN=$C613    ; Find BASIC program line from line number
STXTPT=$C68E    ; set BASIC execute pointer to start of memory -1
EVLVAR=$D08B    ; get/create variable and get variable address
POC03=$C9B1     ; calcola e assegna valore
POC04=$C38D     ; search the stack - TRAMITE X - for FOR or GOSUB activity - return Zb=1 if FOR variable found
SCNSTK=$C38A    ; search the stack for FOR or GOSUB activity - return Zb=1 if FOR variable found
UDTIM=$F734     ; Increment jiffy clock (160-162)
STOPK=$FFE1     ; Test Stop key
BASICBRK=$C002  ; do BASIC break entry
RETI=$FF56      ; Restore 6502 registers from stack, return interrupt
CLNAM=$FFBD     ; clear file name
SETLFS=$FFBA    ; set logical, first, second addresses
SETNAM=$E254    ; set filename
SCNBYT=$E1FD    ; scan for ",byte" and get byte, else do syntax error then warm start
DLOAD=$FFD5     ; load RAM from a device
BASIOERR=$E0F6  ; go handle BASIC I/O error
DSAVE=$FFD8     ; save RAM to device, A = index to start address, XY = end address low/high
POC05=$D48D     ; sposta stringa nella parte alta della RAM
LET5=$C9DA      ; assegna stringa
DELST=$D6A3     ; controlla se stringa e libera stringa temporanea
                ; pop string off descriptor stack, or from top of string space
                ; returns with A = length, X = pointer low byte, Y = pointer high byte
PAREXP=$CEF1    ; Evaluation within parenthesis
GSINFO=$D782    ; evaluate string, get length in Y
ZERFAC=$D8F7    ; clear FAC1 exponent and sign
CBASTOKEN=$C57C ; ACCETTA SOLO TOKENS ORIGINALI
SETSLINK=$E587  ; set screen pointers for cursor row .X, column .A e ricalcola indirizzo video
COLORSY=$EAB2   ; ricalcola indirizzo colore
MAKADR=$D7F7    ; convert FAC1 to integer in temporary integer
CREADST=$FFB7   ; Read I/O status word
BIFCHRG=$E203   ; Check for more characters in current statement
SCNXTBL=$C909   ; passa alla linea successiva (scan for next BASIC line)
FNDVAR=$D0E7    ; Cerca/Crea variabile - Indirizzo in $47-$48
INTFP=$DC3C     ; Converte 8bit con segno a floating point, usata principalmente come flag: $00=0, $FF=-1
GOTO01=$C8A3    ; GOTO linea => $14 - $15
BLIST2=$C69C    ; Routine: BASIC LIST
BLIST3=$C6BB    ; LIST interna
BSYS=$E12D      ; esegue sys con ripristino e salvataggio registri
                ; A=$030C, X=$030D, Y=$030E, STATUS=$030F
INTIDX=$D1AA    ; Convert float point to 2-byte fixed point in A and Y
BYTFLOAT=$D3A2  ; convert byte Y to float FAC1
BERROR=$C447    ; Basic Error stampa messaggio ? errore, clear current I/O channel, flag default
VIRGOLABYTE=$D7F1 ; controlla virgola e prende in X un parametro numerico 0 - 255
MAKFP=$D391     ; converte intero in A (byte high) e Y (byte low)in FP
                ; usato per FUNZIONI: ritorna valore presente in A (byte high) e Y (byte low)

; SUBROUTINE RAM
CHRGET=$0073
CHRGOT=$0079

; LOCAZIONI RAM
NVOLTE=$02B0    ; n. volte
FREQ0=$02B4     ; frequenza corrente
FREQ1=$02A8     ; frequenza 1
FREQ2=$02AC     ; frequenza 2
PROCPTRORI=$0110  ; 2 byte: puntatore parametro ORIGINE per procedure
PROCPTRDEST=$0112 ; 2 byte: puntatore parametro DESTINAZIONE per procedure
STACKSAVE=$0114 ; salvataggio Stack Pointer per recupero in caso di errore
PTRSAVE=$0115   ; 2 byte: salvataggio puntatore Basic per recupero in caso di errore
NAMECMP1=$5F    ; 2 byte: ptr nome procedura 1 per confronto
NAMECMP2=$14    ; 2 byte: ptr nome procedura 2 per confronto
LAVORO1=$0110   ; locazione temporanea
LAVORO2=$0111   ; locazione temporanea
LAVORO3=$0112   ; locazione temporanea
LAVORO4=$0113   ; locazione temporanea
LAVORO5=$22     ; locazione temporanea pag zero
LAVORO6=$23     ; locazione temporanea pag zero
LAVORO7=$24     ; locazione temporanea pag zero
LAVORO8=$25     ; locazione temporanea pag zero

; GESTIONE TOKEN
; ISTTOP, FUNBOT E FUNTOP VARIANO A SECONDA DEL NUMERO DI ISTRUZIONI E FUNZIONI AGGIUNTE
LASTBASTOK=$CB  ; ULTIMO TOKEN DEL BASIC
ISTBOT=$CC      ; PRIMO TOKEN ISTRUZIONI DEL NESIC
ISTTOP=$ED      ; ULTIMO TOKEN ISTRUZIONI DEL NESIC
FUNBOT=$E5      ; PRIMO TOKEN DELLE FUNZIONI DEL NESIC
FUNTOP=$F7      ; ULTIMO TOKEN+1 DELLE FUNZIONI DEL NESIC
BASICKWT=$C09E  ; Basic keyword table

; MESSAGGI DI ERRORE
ERRORE=$C43A    ; ROUTINE ERRORE STANDARD DEL BASIC
SYERR=$CF08     ; SYNTAX ERROR
UNDEFSTERR=$C8E3 ; UNDEFINED STATEMENT ERROR
ILLQUERR=$D248  ; ILLEGAL QUANTITY ERROR
STRTLGERR=$C571 ; STRING TOO LONG ERROR
TYPEMISMATCH=$CD99 ; TYPEMISMATCH ERROR
ILLDIRECTCHK=$D3A6 ; SUBROUTINE che effettua il controllo per ILLEGAL DIRECT ERROR
BLDERR=$E19C    ; LOAD ERROR

; HEADER PER BLOCCO 5
        WORD COLDSTART
        WORD NMIREST
        BYTE $41,$30,$C3,$C2,$CD
        
COLDSTART
        JSR INITMEM     ; initialize and test RAM
        LDA #$1A        ; indirizzo inizio RAM per Basic MEMBOT
        STA $0282       ; MEMBOT - SPOSTA INIZIO MEMORIA PER RISERVARE SPAZIO PER SCHERMO
        LDA #$18        ; SCREEN - sposta indirizzo memoria schermo
        STA $0288
; se MEMTOP inferiore a $2000 (su VIC-20 inespanso o +3K) lo imposta a $2000
        LDA #$20
        CMP $0284
        BCC CSTRT1
        STA $0284

CSTRT1  JSR RESTOR      ; Reset RAM vectors to defaults
        JSR INITVIA     ; Initialize the 6522 VIA registers
        JSR INITSK      ; Initialize 6550 VIC chip, screen and pointers
        JSR INTINI      ; inizializza vettori Basic e interrupt
        JSR INITBA      ; Initialize BASIC: restore page zero pointers
        
        ; stampa messaggio di benvenuto e versione Nesic
        LDA #<STR1
        LDY #>STR1
        JSR PRTSTR      ; Print string ASCIIZ pointed to by .A .Y with CR return

        JSR FREMSG1     ; stampa memoria libera e "bytes free"
        JSR MAXVOL      ; imposta volume al massimo
        JMP COLDBA1     ; inizializza Stack Pointer e va al READY

; TAB1 = TABELLA VETTORI
;0300-0301   768-769  Error message link
;0302-0303   770-771  Basic warm start link
;0304-0305   772-773  Crunch Basic tokens link
;0306-0307   774-775  Print tokens link
;0308-0309   776-777  Start new Basic code link -  ISTRUZIONI
;030A-030B   778-779  Get arithmetic element link - FUNZIONI

TAB1    WORD NERROR,AUTO4,TOKENS,LIST,ISTRUZIONI,FUNZIONI
        BYTE $FF,$FF

STR1    ; INTESTAZIONE NESIC
        BYTE $93, $1D, $1D, $D5, $C3, $C3, $C3, $C3, $C3,  $C3, $C3, $C3, $C3
        BYTE $C3, $C3, $C3, $C3, $C3, $C3, $C3, $C9
        BYTE $0D
        BYTE $1D, $1D, $C2
        TEXT "neddi  computers"
        BYTE $C8
        BYTE $0D
        BYTE $1D, $1D, $CA, $C6, $C6, $C6, $12
        TEXT "nesic v2.4"
        BYTE $92, $C6, $C6, $C6, $CB
        BYTE $0D,$0D,0

; *** ESECUZIONE ISTRUZIONI ***
ISTRUZIONI
        TSX
        STX STACKSAVE   ; salva stack pointer per eventuale recupero da errore
        LDA $7A
        STA PTRSAVE     ; salva puntatore Basic LOW
        LDA $7B
        STA PTRSAVE+1   ; salva puntatore Basic HIGH
        JSR CHRGET
        CMP #$2C        ; carattere virgola
        BNE IST1        ; salta e prosegue se non virgola
        CPY #$04        ; controlla se siamo all'inizio riga
        BNE IST1        ; salta se non siamo a inizio riga
IST2    JSR FINEISTR    ; va alla fine dell'istruzione, pronto per quella successiva
        JMP NEWSTT      ; interpreter inner loop

IST1    CMP #$27        ; carattere apice
        BEQ IST2
IST3    JSR ISTEXE
        JMP NEWSTT      ; interpreter inner loop

; confronta se l'istruzione è un token Basic oppure Nesic e la esegue conseguentemente
ISTEXE  CMP #ISTBOT
        BCC ISTBAS       ; è Basic
        CMP #ISTTOP
        BCS ISTBAS       ; è Basic
        JMP ESECUZIONE+1 ; è Nesic, salta all'esecuzione delle istruzioni del Nesic

; Istruzioni Basic
ISTBAS  JSR CHRGOT      ; riprende il carattere
        JMP BISEXE      ; salta all'esecuzione delle istruzioni del Basic

; *** ESECUZIONE FUNZIONI ***
; confronta se è un token Basic oppure Nesic
FUNZIONI
        LDA #$00
        STA $0D
        JSR CHRGET
        CMP #$CC
        BNE FUNZ0
        JMP REPEAFN    ; funzione REPEAT$

FUNZ0   CMP #$DC
        BNE FUNZ1
        JMP CSRXY       ; salta alla funzione CSRXY

FUNZ1   CMP #$E0        ; token SYS
        BNE FUNZ2
        ; funzione SYS
        JSR CHRGET
        JMP SYSFUNZ

FUNZ2   CMP #FUNBOT
        BCC FUNBAS      ; è Basic
        CMP #FUNTOP
        BCS FUNBAS      ; è Basic
        LDX #$00

; ESECUZIONE ISTRUZIONI E FUNZIONI NESIC
ESECUZIONE
        BIT $FFA2 ;BYTE DOPO: LDX #$FF
        CLC
        SBC #LASTBASTOK ; ULTIMO TOKEN DEL BASIC
        ASL A
        TAY
        LDA INDCOM+1,Y  ; TABELLA INDIRIZZI ISTRUZIONI E FUNZIONI
        PHA
        LDA INDCOM,Y    ; TABELLA INDIRIZZI ISTRUZIONI E FUNZIONI
        PHA
        JMP CHRGET

; Funzioni Basic
FUNBAS  JSR CHRGOT      ; riprende il carattere
        JMP BFNEXE      ; salta all'esecuzione delle funzioni del Basic

; LIST
LIST    PHP
        PHA
        LDA #$01
LIST0   CMP $028D
        BEQ LIST0
        LDA #$00
        STA $C6
        PLA
        CMP #$FF
        BEQ TOKBAS      ; TOKEN BASIC
        BIT $0F
        BMI TOKBAS      ; TOKEN BASIC
        CMP #ISTBOT
        BCC TOKBAS      ; TOKEN BASIC
        PLP
        SEC
        SBC #LASTBASTOK ; ULTIMO TOKEN DEL BASIC
        TAX
        STY $49
        LDY #$FF
LIST2   DEX
        BEQ LIST4
LIST3   INY
        LDA PARCHIAVE,Y
        BPL LIST3
        BMI LIST2
LIST4   INY
        LDA PARCHIAVE,Y
        BMI LIST5
        JSR CHROUT
        BNE LIST4
LIST5   JMP BLIST       ; LIST Basic

; TOKEN BASIC
TOKBAS  PLP
        JMP UNTOKENS       ; uncrunch BASIC tokens

; TOKEN
TOKENS  LDX $7A
        LDY #$04
        STY $0F
TK3     LDA $0200,X
        BPL TK1
        CMP #$FF
        BEQ TK2
        INX
        BNE TK3
TK1     CMP #$20
        BEQ TK2
        STA $08
        CMP #$22
        BNE TK4
        JMP TK5

TK4     BIT $0F
        BVS TK2
        CMP #$3F
        BNE TK6
        LDA #$99
        BNE TK2
TK6     CMP #$30
        BCC TK7
        CMP #$3C
        BCC TK2
TK7     STY $71
        LDY #$FF
        STX $7A
        DEX
        LDA #$CC ;CORRISPONDE A ISTBOT
        STA $0B
TK8     INY
        INX
TK11    LDA $0200,X
        SEC
        SBC PARCHIAVE,Y
        BEQ TK8
        CMP #$80
        BEQ TK9+1
        LDX $7A
        INC $0B
TK10    INY
        LDA PARCHIAVE-1,Y
        BPL TK10
        LDA PARCHIAVE,Y
        BNE TK11
        LDY #$00
        STY $0B
        DEY
        LDX $7A
        DEX
TK12    INY
        INX
TK21    LDA $0200,X
        SEC
        SBC BASICKWT,Y
        BEQ TK12
        CMP #$80
        BNE TK13
        ORA $0B
TK9     BIT $0BA5 ;TK9+1 LDA $0B
TK22    LDY $71
TK2     INX
        INY
        STA $01FB,Y
        LDA $01FB,Y
        BEQ TK15
        SEC
        SBC #$3A
        BEQ TK16
        CMP #$49
        BNE TK17
TK16    STA $0F
TK17    SEC
        SBC #$55
        BEQ TK18
        JMP TK3

TK18    STA $08
TK19    LDA $0200,X
        BEQ TK2
        CMP $08
        BEQ TK2
TK5     INY
        STA $01FB,Y
        INX
        BNE TK19
TK13    LDX $7A
        INC $0B
TK20    INY
        LDA $C09D,Y
        BPL TK20
        LDA BASICKWT,Y
        BNE TK21
        LDA $0200,X
        BPL TK22
TK15    STA $01FD,Y
        DEC $7B
        LDA #$FF
        STA $7A
REPRTS  RTS

; funzione REPEAT$
REPEAFN
        JSR CHRGET
        CMP #$24        ; "$"
        BEQ REPEFN1
        JMP SYERR

REPEFN1 JSR CHRGET
        JSR PARSX
        JSR ESPRSTR     ; acquisizione stringa
        ; qui mi ritrovo con lungh stringa in $61
        ; e puntatore stringa fornita a $62 - $63
        LDY #$00
        LDA ($62),Y
        PHA             ; salva carattere
        LDA $61         ; carica n. caratteri della stringa fornita
        PHA             ; salva n. caratteri della stringa fornita
        JSR VIRGOLABYTE ; controlla virgola e prende in X un parametro numerico 0 - 255
        JSR PARDX       ; controllo parentesi destra
        PLA
        TAY             ; riprende n. caratteri della stringa fornita
        LDA #$00
        INY
        DEY             ; incrementa e decrementa Y per vedere se 0
        BEQ REPEFN2     ; è 0, salta
        TXA             ; in A il n. caratteri richiesti
REPEFN2 JSR ALCSPC1     ; crea spazio per la stringa con lunghezza A, descriptor in $61, $62, $63
        ; lunghezza nuova stringa $61
        ; puntatore nuova stringa $62-$63
        PLA             ; ripristina carattere
        LDY $61         ; n. caratteri
        CPY #$00
        BEQ REPDL2      ; stringa zero
        DEY
REPDLP  STA ($62),Y
        DEY
        BPL REPDLP
REPDL2  JMP PUTSTR      ; controlla che ci sia spazio nel descriptor stack
                        ; e poi mette in questo stack il descrittore presente a $61, $62 e $63

; REPEAT
REPEA1  BNE REPRTS
        JSR ILLDIRECTCHK   ; ILLEGAL DIRECT ERROR
; qui viene copiato il numero di linea nel registro temporaneo degli interi $0014-$0015
; poi viene chiamata GOTO01 ($C8A3) che effettua un GOTO a quel numero
        LDX $3A
        STX $15
        LDX $39
        STX $14
        JMP GOTO01      ; REPEAT: effettua un GOTO alla medesima linea

; LBL< Ignora la label se trovata nel corso dell'esecuzione
LBL     LDY #$FF
LBLOOP  INY
        LDA ($7A),Y
        BEQ LBLERR      ; Syntax Error se non è inizio riga
        CMP #$B1        ; token > (cerca fine LBL)
        BNE LBLOOP      ; loop ricerca
        JSR BUMPTP      ; puntatore a istruzione successiva (add Y to the BASIC execute pointer)
        JMP CHRGET

LBLERR  JMP SYERR

; riconosce nome procedura compreso tra BGN[ e ]
; se ritorna flag zero allora non trovato
NOMPROC LDY #$CE        ; TOKEN BGN[
        LDA #$5D        ; "]"
; riconosce nome compreso tra delimitatori nei registri Y e A
; se ritorna flag zero allora non trovato
; usato per LBL< e >
NOME    STY $B0         ; salva Y - delimitatore iniziale
        STA $08         ; salva A - delimitatore finale
        LDA $2B         ; Pointer: Start of Basic LOW
        LDX $2C         ; Pointer: Start of Basic HIGH - ricerca dall'inizio
NOMLOOP LDY #$01
        STA $5F         ; salva puntatore
        STX $60         ; salva puntatore
        LDA ($5F),Y     ; carica carattere
        BEQ SUBRTS      ; se 0 confronto terminato SENZA TROVARE NULLA
        LDY #$04
        LDA $B0         ; riprende delimitatore iniziale
        CMP ($5F),Y     ; confronta
        BEQ SUB4        ; delimitatore iniziale trovato
; riprova su altra riga
SUB3    LDY #$01
        LDA ($5F),Y
        TAX
        DEY
        LDA ($5F),Y
        JMP NOMLOOP

; delimitatore iniziale trovato
; si saltano 5 byte e si salva il puntatore in $14-$15
SUB4    CLC
        LDA #$05
        ADC $5F
        STA $14
        LDA #$00
        ADC $60
        STA $15
; salta eventuali spazi
        LDY #$00
SUBLOOP LDA ($14),Y
        CMP #$20
        BNE SUBE        ; spazi saltati
        INC $14
        BNE SUBLOOP
        INC $15
        JMP SUBLOOP

; CONFRONTO NOME PROCEDURA O LBL
SUB5    INY
SUBE    LDA ($7A),Y     ; Basic pointer (within subroutine)
        CMP ($14),Y     ; confronto dei caratteri del nome procedra o lbl
        BNE SUB3        ; fine confronto: non corrisponde, riprova su altra riga
        CMP $08         ; confronto con delimitatore finale
        BNE SUB5
; prende il puntatore $5F-$60 e lo salva decrementato in $7A-$7B
        SEC
        JMP DECPTR

SUBRTS  RTS

; ON - esegue procedure o salti a LBL a seconda del risultato di una funzione
; comando: ON n [P1]; [P2]; GO<L1>; [P3]
ON      JSR GETBYTE     ; prende in X un parametro numerico 0 - 255
        ; accetta solo token [ e GO<
ONLOOP  CMP #$CD        ; TOKEN [
        BEQ ON5
        CMP #$D2        ; TOKEN GO<
        BNE ONERR       ; errore
        ; token validi
ON5     DEC $65         ; decrementa contatore ON
        BNE ON3         ; continua se non è il parametro da eseguire
        JSR CHRGOT
        JMP ISTEXE      ; esegue l'istruzione

ON3     CMP #$D2        ; TOKEN GO<
        BNE ON6         ; non è token GO<, quindi è [ e salta a ON6
        JSR LBL         ; è token GO<, quindi salta oltre LBL
        JMP ON7         ; continua

ON6     JSR LSUB        ; presume sia [ e salta fino a oltre ]
ON7     BEQ ONRTS
        CMP #$3B        ; ";" 
        BEQ ON9         ; se è ; allora prosegue, altrimenti continua il loop
        JSR CHRGET
        JMP ON7         ; loop per saltare eventuali parametri

ON9     JSR CHRGET      ; è punto e virgola, prende prossimo carattere
        JMP ONLOOP      ; continua il loop

; SALTA NOME PROCEDURA
LSUB    LDY #$FF
LSBLOOP INY
        LDA ($7A),Y
        BEQ ONERR
        CMP #$5D        ; "]"
        BNE LSBLOOP
        JSR BUMPTP      ; puntatore a istruzione successiva (add Y to the BASIC execute pointer)
        JMP CHRGET

ONERR   JMP SYERR

ONRTS   RTS

; OLD - recupera un programma Nesic cancellato, purché la sua area di memoria non sia stata alterata
; comando diretto: OLD
OLD     JSR DIRECT_ONLY_CHK ; DIRECT ONLY ERROR se in programma
        LDY #$01
        TYA
        STA ($2B),Y
        JSR LINKPRG
        CLC
        LDA #$02
        ADC $22
        STA $2D
        LDA #$00
        ADC $23
        STA $2E
        JSR CLR
        JMP READY

; AUTO - numerazione automatica linee Nesic
; comando diretto: AUTO oppure AUTO n oppure AUTO n,step
AUTO    JSR DIRECT_ONLY_CHK ; DIRECT ONLY ERROR se in programma
        BNE AUTO15
        JMP AUTO12

AUTO15  BCS AUTO2
        JSR PARAURN     ; legge parametri per AUTO e RENUMBER
        PLA
        PLA
AUTO21  JSR AUTO8
        JMP AUTO4

AUTO8   LDA #$01
        STA $02A6
        LDA $02A3
        ;STA $62
        LDY $02A2
        ;LDA $02A2
        ;STA $63
        ;LDX #$90
        ;SEC
        ;JSR POC01      ; set exponent = X, clear mantissa 4 and 3 and normalise FAC1
        JSR UINT2FP     ; converte intero senza segno in FP A=high, Y=low
        JSR FLTASC      ; convert float FAC1 to ASCII string result in (AY)
        LDY #$FF
AUTO3   INY
        LDA $0101,Y
        STA $0277,Y
        BNE AUTO3
        LDA #$20
        STA $0277,Y
        INY
        LDA #$00
        STA $0277,Y
        STY $C6
        RTS

AUTO2   JMP SYERR

AUTO4   LDA $02A6
        BNE AUTO5
        JMP BASICWARM   ; BASIC warm start

AUTO5   JSR GETLIN      ; input in $0200 stringa terminata con zero
        STX $7A
        STY $7B
        JSR CHRGET
        TAX
        BNE AUTO0
        JSR AUTO7
        JMP AUTO4

AUTO0   LDX #$FF
        STX $3A
        BCC AUTO6
        JMP POC02

AUTO6   JSR LNUMINT     ; LeggiNUMeroINTero - get fixed-point number into temporary integer
        JSR AUTO18
        JMP NEWLIN1     ; handle new BASIC line

AUTO18  TAX
        BEQ AUTO7
AUTO19  JSR AUTO9
        BCC AUTO10
AUTO11  TYA
        CLC
        ADC $02A4
        STA $02A2
        TXA
        ADC $02A5
        STA $02A3
        BCS AUTO7
        CMP #$FA
        BCC AUTO8
AUTO7   LDA #$00
        STA $02A6
AUTO10  RTS

AUTO9   SEC
        LDA $14
        TAY
        SBC $02A2
        LDA $15
        TAX
        SBC $02A3
        RTS

AUTO12  PLA
        PLA
        JSR INIZAUTO    ; inizializza parametri di default per AUTO e RENUMBER
        LDA #$00
        STA $14
        STA $15
        LDA $2B
        STA $62
        LDA $2C
        STA $63
AUTO13  LDY #$01
        LDA ($62),Y
        BEQ AUTO14
        TAX
        INY
        LDA ($62),Y
        STA $14
        INY
        LDA ($62),Y
        STA $15
        LDY #$00
        LDA ($62),Y
        STA $62
        STX $63
        JMP AUTO13

AUTO14  JSR AUTO9
        BCS AUTO20
        JMP AUTO21

AUTO20  JSR AUTO11
        JMP AUTO4

TABAUTO BYTE 100,0,10,0,0

; legge parametri per AUTO e RENUMBER
; primo parametro $02A2-$02A3 - secondo parametro $02A4-$02A5
PARAURN JSR LNUMINT     ; LeggiNUMeroINTero
        PHA
        JSR INIZAUTO    ; inizializza parametri di default per AUTO e RENUMBER
        LDA $14
        STA $02A2
        LDA $15
        STA $02A3
        PLA
        BEQ PARARTS
        JSR VIRGOLA
        JSR LNUMINT     ; LeggiNUMeroINTero
        BNE PARAERR
; se il secondo parametro è zero allora lo pone a 1
        LDA $14
        ORA $15
        BNE PARA2
        INC $14
; fine controllo secondo parametro
PARA2   LDA $14
        STA $02A4
        LDA $15
        STA $02A5
PARARTS RTS

PARAERR JMP SYERR

; inizializza parametri di default per AUTO e RENUMBER
INIZAUTO
        LDX #$04
AUTLOOP LDA TABAUTO,X
        STA $02A2,X
        DEX
        BPL AUTLOOP
        RTS

; LIST
; comando diretto: LIST o LIST linea_iniziale o LIST linea_iniziale-linea_finale
; oppure LIST[nome_procedura]
LISTA   CMP #$CD ;TOKEN [
        BEQ LISTB
        JSR CHRGOT
        JMP BLIST2      ; Routine: BASIC LIST

LISTB   JSR CHRGET
        JSR LAB1
        LDY #$03
        LDA ($5F),Y
        STA $15
        DEY
        LDA ($5F),Y
        STA $14
        DEY
        LDA ($5F),Y
        TAX
        DEY
        LDA ($5F),Y
LISTC   LDY #$01
        STA $22
        STX $23
        LDA ($22),Y
        BEQ LISTE
        LDY #$04
        LDA #$CE ; TOKEN BGN[
        CMP ($22),Y
        BEQ LISTE
        DEY
        LDA ($22),Y
        STA $15
        DEY
        LDA ($22),Y
        STA $14
        DEY
        LDA ($22),Y
        TAX
        DEY
        LDA ($22),Y
        JMP LISTC

LAB1    JSR NOMPROC
        BNE LABRTS
        LDA #$FF
        STA $15
        STA $14
LABRTS  RTS

LISTE   JMP BLIST3      ; LIST interna

; RENUMBER
; comando: RENUMBER o RENUMBER linea_iniziale o RENUMBER linea_iniziale,step
RENUMBER
        JSR DIRECT_ONLY_CHK ; DIRECT ONLY ERROR se in programma
        BNE REN1
        JSR INIZAUTO    ; inizializza parametri di default per AUTO e RENUMBER    
        JMP REN3

REN1    BCC REN2
        JMP SYERR

REN2    JSR PARAURN     ; legge parametri per AUTO e RENUMBER
REN3    LDA $2B
        LDX $2C
RENLOOP LDY #$01
        STA $5F
        STX $60
        LDA ($5F),Y
        BNE REN4
        JMP OLD         ; per sicurezza fa un OLD per ricalcolare i puntatori

REN4    INY
        LDA $02A2
        STA ($5F),Y
        INY
        LDA $02A3
        STA ($5F),Y
        CLC
        LDA $02A2
        ADC $02A4
        STA $02A2
        LDA $02A3
        ADC $02A5
        STA $02A3
        CMP #$FA
        BCC REN5
        JMP ILLQUERR

REN5    LDY #$01
        LDA ($5F),Y
        TAX
        DEY
        LDA ($5F),Y
        JMP RENLOOP

; DELETE - cancella un blocco di linee di programma
; comando diretto: DELETE linea_iniziale-linea_finale, DELETE[nome_procedura]
DELETE  JSR DIRECT_ONLY_CHK ; DIRECT ONLY ERROR se in programma
        CMP #$CD ;TOKEN [
        BNE DEL1
        JMP DEL6

DEL1    JSR DEL2
DEL3    LDY #0
        LDA ($5A),Y
        STA ($58),Y
        INC $58
        BNE DEL4
        INC $59
DEL4    INC $5A
        BNE DEL5
        INC $5B
DEL5    LDX $2D
        CPX $5A
        BNE DEL3
        LDX $2E
        CPX $5B
        BNE DEL3
        LDA $58
        STA $2D
        LDA $59
        STA $2E
        JSR CLR2        ; reset execute pointer and do CLR
        JSR LINKPRG
        JMP READY

DEL2    LDA $2B
        LDY $2C
        STA $58
        STY $59
        SEC
        LDA $2D
        SBC #2
        STA $5A
        LDA $2E
        SBC #0
        STA $5B
        JSR CHRGOT
        BCC DEL9
        LDA #$AB        ; TOKEN - (segno meno)
        JSR CMPCAR
        BEQ DEL13
        BNE DEL10
DEL9    JSR LNUMINT     ; LeggiNUMeroINTero - get fixed-point number into temporary integer
        JSR FINLIN      ; Find BASIC program line from line number
        LDA $5F
        LDY $60
        STA $58
        STY $59
        LDA #$AB
        JSR CMPCAR
        BEQ DEL11
DEL10   JSR LNUMINT     ; LeggiNUMeroINTero - get fixed-point number into temporary integer
        BEQ DEL12
DEL13   JMP SYERR

DEL12   INC $14
        BNE DEL16
        INC $15
DEL16   JSR FINLIN      ; Find BASIC program line from line number
        LDA $5F
        LDY $60
        STA $5A
        STY $5B
        CMP $58
        LDA $5B
        SBC $59
        BCC DEL13
DEL11   RTS

DEL6    JSR CHRGET
        JSR FNDPROC
        LDA $5F
        LDY $60
        STA $58
        STY $59
DEL14   LDY #1
        LDA ($5F),Y
        TAX
        DEY
        LDA ($5F),Y
        INY
        STA $5F
        STX $60
        LDA ($5F),Y
        BEQ DEL15
        LDY #4
        LDA #$CE        ;TOKEN BGN[
        CMP ($5F),Y
        BNE DEL14
DEL15   LDA $5F
        LDY $60
        STA $5A
        STY $5B
        JMP DEL3

; RUN esegue il programma a partire dalla procedura iniziale o una specifica procedura
; comando: RUN oppure RUN[nome procedura] (anche con parametri diretti, NON VARIABILI, ad esempio RUN[nome procedura],2,"TEST")
; RUN "NOMEFILE" o RUN "NOMEFILE",1 carica ed esegue NOMEFILE da cassetta
; RUN "NOMEFILE",8 carica ed esegue NOMEFILE da disco
RUN     LDA #$00
        STA $9D         ; Direct=$80/RUN=0 output control
        JSR CLR         ; go do "CLEAR"
        JSR CHRGOT
        BEQ RUN1        ; RUN senza parametri
        CMP #$CD        ; TOKEN [
        BEQ RUN2        ; esegue la procedura specificata
        JMP LRUN        ; Load and RUN

RUN2    JSR DIRECT_ONLY_CHK ; DIRECT ONLY ERROR se in programma
        JSR CHRGET
        JMP SUB         ; ESEGUE LA PROCEDURA [

; RUN senza parametri
RUN1    JSR CLR
        JSR RUNA        
        LDY #5
        LDA ($7A),Y
        CMP #$CE        ; TOKEN BGN[
        BEQ RUN6        ; esegue dalla prima procedura
        JMP PROC_NOT_FOUND_ERROR ; PROC NOT FOUND ERROR

RUNSYERR
        JMP SYERR

RUN6    JSR SALTABGN    ; salta all'inizio del nome procedura
        LDA $7B         ; Basic pointer (within subroutine) HIGH
        PHA
        LDA $7A         ; Basic pointer (within subroutine) LOW
        PHA
        LDA #$FF
        PHA
        PHA
        LDA #$8D        ; TOKEN GOSUB
        PHA
        JSR LSUB        ; salta nome procedura
RUN4    JSR FINEISTR
        JMP NEWSTT      ; interpreter inner loop

; RUN senza parametri
RUNA    JSR STXTPT       ; set BASIC execute pointer to start of memory -1
        LDY #$02
        LDA ($7A),Y
        BNE RUNRTS
        JMP END2

RUNRTS  RTS

; salta all'inizio del nome procedura
SALTABGN
        LDA $3A         ; Current Basic line number HIGH
        STA $3C         ; Previous Basic line number HIGH
        LDA $39         ; Current Basic line number LOW
        STA $3B         ; Previous Basic line number LOW
     
        LDY #$03
        LDA ($7A),Y     ; Basic pointer (within subroutine)
        STA $39         ; Current Basic line number LOW
        INY
        LDA ($7A),Y     ; Basic pointer (within subroutine)
        STA $3A         ; Current Basic line number HIGH
        LDA $7B         ; Basic pointer (within subroutine) HIGH
        STA $3E         ; Pointer: Basic statement for CONT HIGH
        LDA $7A         ; Basic pointer (within subroutine) LOW
        STA $3D         ; Pointer: Basic statement for CONT LOW
; incrementa di 5 il puntatore Basic
        CLC
        LDA #$05
        ADC $7A         ; Basic pointer (within subroutine) LOW
        STA $7A
        LDA #$00
        ADC $7B
        STA $7B         ; Basic pointer (within subroutine) HIGH
        JMP CHRGET

; GO<
; comando: GO<nome_label>
GTO     LDY #$DE        ; TOKEN LBL<
        LDA #$B1        ; TOKEN >
        JSR NOME        ; riconosce nome etichetta compreso tra LBL< e >
        BNE RUNRTS      ; ritorna se trovato
        JMP LBL_NOT_FOUND_ERROR ; non trovato, LBL NOT FOUND ERROR

; procedura [ cerca il nome
; errore se nome non trovato
FNDPROC JSR NOMPROC
        BNE RUNRTS
        JMP PROC_NOT_FOUND_ERROR ; PROC NOT FOUND ERROR

; [ ESECUZIONE PROCEDURA
SUB     LDA #$03
        JSR GETSTK      ; Check Stack Depth if overflow go do out of memory error then warm start

; QUESTO BLOCCO COMMENTATO SERVE AD IGNORARE I PARAMETRI NELLA MODALITA' DIRETTA
;        LDX $3A         ; Current Basic line number HIGH
;        INX
;        BNE SUBB
;        JMP RUN3

; qui viene inserita la procedura nello stack con il token della GOSUB
SUBB    LDA $7B         ; Basic pointer (within subroutine) HIGH
        STA PROCPTRORI+1 ; viene salvato per poter accedere ad eventuali parametri
        PHA
        LDA $7A         ; Basic pointer (within subroutine) LOW
        STA PROCPTRORI  ; viene salvato per poter accedere ad eventuali parametri
        PHA
        LDA $3A         ; Current Basic line number HIGH
        PHA
        LDA $39         ; Current Basic line number LOW
        PHA
        LDA #$8D        ; TOKEN GOSUB
        PHA
        JSR FNDPROC
        JSR SALTABGN

        JSR BGNPARM ; acquisizione parametri procedura

        JMP RUN4

; ACQUISIZIONE PARAMETRI PROCEDURA *************************************
; PROCPTRORI - PROCPTRORI+1 locazioni salvataggio puntatore origine
; PROCPTRDEST - PROCPTRDEST+1 locazioni salvataggio puntatore destinazione
BGNPARM JSR LSUB        ; salta nome procedura DESTINAZIONE
        JSR PTRORI      ; imposta puntatore di ORIGINE
        JSR LSUB        ; salta nome procedura ORIGINE
        JSR PTRDEST     ; imposta puntatore di DESTINAZIONE
        JMP BGNP1

; cerca parametro DESTINAZIONE
BPLOOP  JSR CHRGET
BGNP1   BEQ BPFINE      ; fine parametri
        CMP #$2C        ; "," 
        BNE BPLOOP      ; cerca virgola
        JSR PFOUND      ; virgola trovata, valutazione dei parametri
        JMP BGNP1

BPFINE  RTS

; trovato un parametro DESTINAZIONE, cerca parametro ORIGINE
PFOUND  JSR CHRGET
        JSR PTRORI      ; imposta puntatore di ORIGINE
PFOUND1 CMP #$2C        ; "," 
        BEQ PEFOUND     ; virgola trovata
        JSR CHRGET
        BEQ ORIERR      ; fine inaspettata parametri
        JMP PFOUND1

; trovato parametro ORIGINE
PEFOUND JSR CHRGET      ; una volta trovata la virgola passa oltre
        JSR PTRDEST     ; imposta puntatore di DESTINAZIONE

        ; qui abbiamo entrambi i parametri per fare l'assegnazione
        ; procediamo con l'assegnazione

        JSR EVLVAR      ; get/create variable and get variable address
        STA $49         ; save variable address low byte
        STY $4A         ; save variable address high byte
        JSR PTRORI      ; imposta puntatore di ORIGINE
        JSR POC03       ; calcola e assegna valore
        JMP PTRDEST     ; imposta puntatore di DESTINAZIONE

ORIERR  JMP SYERR

; imposta puntatore Basic su origine
PTRORI  ; salva puntatore destinazione
        LDA $7A
        STA PROCPTRDEST ; puntatore LOW parametro procedura destinazione
        LDA $7B
        STA PROCPTRDEST+1 ; puntatore HIGH parametro procedura destinazione
        ; carica puntatore sorgente
        LDA PROCPTRORI ; puntatore LOW parametro procedura origine
        STA $7A
        LDA PROCPTRORI+1 ; puntatore HIGH parametro procedura origine
        STA $7B
        JMP CHRGOT      ; prende il carattere

; imposta puntatore Basic su destinazione
PTRDEST ; salva puntatore sorgente
        LDA $7B
        STA PROCPTRORI+1 ; puntatore HIGH parametro procedura origine
        LDA $7A
        STA PROCPTRORI ; puntatore LOW parametro procedura origine
        ; ripristina puntatore destinazione
        LDA PROCPTRDEST+1 ; puntatore HIGH parametro procedura destinazione
        STA $7B
        LDA PROCPTRDEST ; puntatore LOW parametro procedura destinazione
        STA $7A
        JMP CHRGOT      ; prende il carattere

; FINE ACQUISIZIONE PARAMETRI PROCEDURA *************************************

; END e AGAIN
END0    LDA #0
AGAIN   BIT $01A9
        STA $B0         ; flag END/AGAIN: END=0, AGAIN=1
        JSR CHRGOT
        BEQ ENDNOPAR    ; salta se END/AGAIN senza parametri
        CMP #$CD        ; token [
        BNE ENDERR      ; non è una procedura, Syntax Error
        JSR CHRGET
        TSX             ; trasferisce stack in X
        JMP END20       ; cerca la procedura specificata

; scala un livello di stack (tramite INX) [
ENDLOOP INX
        INX
        INX
        INX
        INX
; entry point per cercare la procedura specificata
END20   LDA #$FF
        STA $4A         ; mette $FF in $4A per fare la ricerca del token GOSUB senza interferire con il FOR
        JSR POC04       ; search the stack - TRAMITE X - for FOR or GOSUB activity - return Zb=1 if FOR variable found
        CMP #$8D        ; TOKEN GOSUB
        BEQ END1        ; ha trovato il token, tutto ok
ENDERR2 JMP PROC_NOT_FOUND_ERROR ; PROC NOT FOUND ERROR

ENDERR  JMP SYERR       ; Syntax Error

; prosegue, token trovato
END1    LDA $0104,X
        STA $14         ; salva indirizzo nome LOW
        LDA $0105,X
        STA $15         ; slava indirizzo nome HIGH
        LDY #$FF
END12   INY
        LDA ($7A),Y
        CMP ($14),Y     ; confronto tra ($7A),Y e ($14),Y, quindi tra nome corrente e nome trovato
        BNE ENDLOOP     ; confronto fallito, scala un livello di stack e riprova
        CMP #$5D        ; "]"
        BNE END12       ; se non è terminatore continua a confrontare
        INY             ; incrementa puntatore
        LDA ($7A),Y     ; carica carattere successivo
        BNE ENDERR      ; se non è 0 allora Syntax Error
        TXS             ; trasterisce X nello STACK POINTER
        LDA $B0         ; flag END/AGAIN
        BNE END14       ; salta se AGAIN
ENDRET  PLA             ; END, fa un RETURN
        PLA
        STA $39         ; n. riga LOW
        PLA
        STA $3A         ; n. riga HIGH
        PLA
        STA $7A         ; adr inizio procedura LOW
        PLA
        STA $7B         ; adr inizio procedura HIGH
        JSR FINEISTR
        LDX $3A         ; legge n.riga HIGH
        INX             ; lo incrementa
        BEQ END2        ; se è zero (quindi $3A è $FF) allora termina il programma
        RTS

; END e AGAIN senza parametri
ENDNOPAR
        LDA #$FF
        STA $4A
        LDA $B0         ; flag END/AGAIN
        BEQ END8        ; solo END senza parametri
        ; solo AGAIN senza parametri
        JSR SCNSTK      ; search the stack for FOR or GOSUB activity - return Zb=1 if FOR variable found
        CMP #$8D        ; TOKEN GOSUB
        BNE ENDERR2     ; PROC NOT FOUND ERROR
        TXS
        LDA $0104,X
        STA $7A
        LDA $0105,X
        STA $7B
END14   JSR FNDPROC
        JSR SALTABGN
        JMP RUN4

; solo END senza parametri
END8    JSR SCNSTK      ; search the stack for FOR or GOSUB activity - return Zb=1 if FOR variable found
        TXS
        CMP #$8D        ; TOKEN GOSUB
        BEQ ENDRET      ; fa un RETURN
; fine programma
END2    LDX #$FA
        TXS             ; resetta lo stack
        LDA #0          ; 0 significa che è terminato correttamente e non ci sarà alcun cont
        STA $3E         ; puntatore per com.Basic (CONT)
        JMP READY

; NMI - TASTO RESTORE
NMIREST BIT $9111       ; test VIA 1 DRA
        JSR UDTIM       ; increment the real time clock
        JSR STOPK       ; scan stop key
        BNE NMIEND      ; if not [STOP] restore registers and exit interrupt
        JSR RESTOR      ; restore default I/O vectors
        JSR INTINI      ; INIZIALIZZAZIONE VETTORI BASIC E INTERRUPT
        JSR INITVIA     ; initialize I/O registers
        JSR INITSK      ; initialise hardware
        JSR SILENTE     ; silenzia audio
        JSR MAXVOL      ; imposta volume al massimo
        JMP (BASICBRK)  ; do BASIC break entry

NMIEND  JMP RETI        ; restore registers and exit interrupt

        TEXT "(C) 1984 S. NEDDI VICENZA" ; MESSAGGIO COPYRIGHT - NON USATO
        TEXT "(R) 2026 S. NEDDI - THE REBIRTH"

; TABELLA INDIRIZZI ISTRUZIONI E FUNZIONI, token nei commenti
INDCOM  WORD REPEA1-1   ; $CC
        WORD SUB-1      ; $CD
        WORD SYERR-1    ; $CE
        WORD ON-1       ; $CF
        WORD OLD-1      ; $D0
        WORD AUTO-1     ; $D1
        WORD GTO-1      ; $D2
        WORD SYERR-1    ; $D3
        WORD SYERR-1    ; $D4
        WORD END0-1     ; $D5
        WORD NIF0-1     ; $D6
        WORD LISTA-1    ; $D7
        WORD RENUMBER-1 ; $D8
        WORD RUN-1      ; $D9
        WORD DELETE-1   ; $DA
        WORD BEEP-1     ; $DB
        WORD CSR-1      ; $DC
        WORD POKE-1     ; $DD
        WORD LBL-1      ; $DE
        WORD AGAIN      ; $DF ATTENZIONE! qui non ci va il -1 come nelle altre voci!
        WORD SYS-1      ; $E0
        WORD GRAPHIC-1  ; $E1
        WORD EFFECT-1   ; $E2
        WORD MERGE-1    ; $E3
        WORD ELS0-1     ; $E4
        WORD SOUND-1    ; $E5
        WORD VIDEO-1    ; $E6
        WORD BORDER-1   ; $E7
        WORD COLOR-1    ; $E8
        WORD INK-1      ; $E9
        WORD VOLUME-1   ; $EA
        WORD PAPER-1    ; $EB
        WORD AUX-1      ; $EC
        WORD FIRE-1     ; $ED
        WORD JOY-1      ; $EE
        WORD PEEK-1     ; $EF
        WORD EVAL-1     ; $F0
        WORD HPEN-1     ; $F1
        WORD VPEN-1     ; $F2
        WORD PADDLE-1   ; $F3
        WORD SHAPE-1    ; $F4
        WORD TRIM-1     ; $F5
        WORD INSTR-1    ; $F6

; TABELLA NOMI E FUNZIONI
PARCHIAVE TEXT "repea"  ; REPEAT
        BYTE $D4        ; t + $80
        BYTE $DB        ; [
        TEXT "bgn"      ; BGN[
        BYTE $DB        ; [ + $80
        TEXT "o"        ; ON
        BYTE $CE        ; N + $80
        TEXT "ol"       ; OLD
        BYTE $C4        ; D + $80
        TEXT "aut"      ; AUTO
        BYTE $CF        ; O + $80
        TEXT "go"       ; GO<
        BYTE $BC
        TEXT "g"        ; GO
        BYTE $CF        ; O + $80
        TEXT "retur"    ; RETURN
        BYTE $CE        ; N + $80
        TEXT "en"       ; END
        BYTE $C4        ; D + $80
        TEXT "i"        ; IF
        BYTE $C6        ; F + $80
        TEXT "lis"      ; LIST
        BYTE $D4        ; T + $80
        TEXT "renumbe"  ; RENUMBER
        BYTE $D2        ; R + $80
        TEXT "ru"       ; RUN
        BYTE $CE        ; N + $80
        TEXT "delet"    ; DELETE
        BYTE $C5        ; E + $80
        TEXT "bee"      ; BEEP
        BYTE $D0        ; P + $80
        TEXT "cs"       ; CSR
        BYTE $D2        ; R + $80
        TEXT "pok"      ; POKE
        BYTE $C5        ; E + $80
        TEXT "lbl"      ; LBL<
        BYTE $BC
        TEXT "agai"     ; AGAIN
        BYTE $CE        ; N + $80
        TEXT "sy"       ; SYS
        BYTE $D3        ; S + $80
        TEXT "graphi"   ; GRAPHIC
        BYTE $C3        ; C + $80
        TEXT "effec"    ; EFFECT
        BYTE $D4        ; T + $80
        TEXT "merg"     ; MERGE
        BYTE $C5        ; E + $80
        TEXT "els"      ; ELSE
        BYTE $C5        ; E + $80
        TEXT "sound"    ; SOUND(
        BYTE $A8
        TEXT "vide"     ; VIDEO
        BYTE $CF        ; O + $80
        TEXT "borde"    ; BORDER
        BYTE $D2        ; R + $80
        TEXT "colo"     ; COLOR
        BYTE $D2        ; R + $80
        TEXT "in"       ; INK
        BYTE $CB        ; K + $80
        BYTE "volum"    ; VOLUME
        BYTE $C5        ; E + $80
        TEXT "pape"     ; PAPER
        BYTE $D2        ; R + $80
        TEXT "au"       ; AUX
        BYTE $D8        ; X + $80
        TEXT "fir"      ; FIRE
        BYTE $C5        ; E + $80
        TEXT "jo"       ; JOY
        BYTE $D9        ; X + $80
        TEXT "pee"      ; PEEK
        BYTE $CB        ; K + $80
        TEXT "eva"       ; EVAL
        BYTE $CC        ; L + $80
        TEXT "hpe"      ; HPEN
        BYTE $CE        ; N + $80
        TEXT "vpe"      ; VPEN
        BYTE $CE        ; N + $80
        TEXT "paddle"   ; PADDLE(
        BYTE $A8
        TEXT "shape"    ; SHAPE(
        BYTE $A8
        TEXT "tri"      ; TRIM
        BYTE $CD
        TEXT "inst"     ; INSTR
        BYTE $D2
        BYTE 0          ; FINE TABELLA NOMI ISTRUZIONI E FUNZIONI

; SYS LOAD
SYSLOAD JSR CHRGET
        JSR CLNAM       ; clear filename
        LDX #$01        ; set default device number, cassette
        LDY #$00        ; set default command
        JSR SETLFS      ; set logical, first and second addresses
        JSR CHRGOT
        BEQ LOAD2
        JSR SETNAM       ; set filename
        JSR CHRGOT
        BEQ LOAD2
        JSR SCNBYT      ; scan for ",byte" and get byte, else do syntax error then warm start
        LDY #$FF        ; start address dal file
        STX $49         ; save device number
        JSR SETLFS      ; set logical, first and second addresses
        JSR CHRGOT
        BEQ LOAD2
        JSR VIRGOLA
        JSR BASE
        JSR ADR         ; ADR in $AE-$AF
        JSR CHRGOT
        BEQ LOAD1
        JMP SYERR

LOAD1   LDY #$00        ; start address da parametro
        STY $B9         ; start address da parametro / dal file
LOAD2   LDA #$00        ; 0 = load , 1 = verify
        LDX $AE         ; get start address low byte
        LDY $AF         ; get start address high byte
        JSR DLOAD       ; load RAM from a device LOAD
        BCS BLDERR2     ; if error go handle BASIC I/O error
        RTS

BLDERR2 JMP BASIOERR    ; go handle BASIC I/O error

; SYS SAVE
SYSSAVE JSR CHRGET
        LDA #$10
        STA $15         ; start address default HIGH
        LDA #$00        ; start and end address LOW and clear file name length
        STA $14         ; end address default LOW
        JSR CLNAM       ; clear filename
        LDX #$01        ; set default device number, cassette
        LDY #$00        ; set default command
        JSR SETLFS      ; set logical, first and second addresses
        JSR CHRGOT
        BEQ SAVE1
        JSR SETNAM       ; set filename
        JSR CHRGOT
        BEQ SAVE1
        JSR SCNBYT      ; scan and GET BYTE, else do syntax error then warm start
        LDY #$00        ; clear command
        STX $49         ; save device number
        JSR SETLFS      ; set logical, first and second addresses
        JSR CHRGOT
        BEQ SAVE1
        JSR VIRGOLA
        JSR BASE
        JSR ADR
        LDA $AF
        STA $15         ; start address HIGH
        LDA $AE
        STA $14         ; start address LOW
        JSR CHRGOT
        BEQ SAVE1
        JSR VIRGOLA
        JSR BASEB
        JSR ADR
        BNE SYSERR
        JMP SAVE2

        ; imposta il default per l'indirizzo di fine se non specificato
SAVE1   LDA #$18
        STA $AF         ; end address default HIGH
        LDA #$00        ; start and end address LOW and clear file name length
        STA $AE         ; start address default LOW

SAVE2   SBC $14         ; Sottrai Low Byte Inizio
        STA LAVORO1     ; Memorizziamo temporaneamente il risultato LB
        LDA $AF         ; Carica High Byte Fine
        SBC $15         ; Sottrai High Byte Inizio
        ORA LAVORO1     ; "OR" tra il risultato HB e quello LB
        BEQ SYSILLRERR  ; Se il risultato dell'OR è zero, allora Fine = Inizio -> Errore
        BCC SYSILLRERR  ; Se il Carry è 0, allora Fine < Inizio -> Errore
        ; Se arriviamo qui, Fine è strettamente maggiore di Inizio (>).
        LDX $AE         ; get end address LOW
        LDY $AF         ; get end address HIGH
        LDA #$14        ; index to start address
        JSR DSAVE       ; save RAM to device, A = index to start address, XY = end address low/high
        BCC SAVERTS
        JMP BASIOERR    ; go handle BASIC I/O error

SYSILLRERR
        JMP ILLEGAL_RANGE_ERROR

SYSERR  JMP SYERR       ; Syntax Error

; COMANDO SYS - esegue routine in LM con indirizzo espresso anche in esadecimale
; comando: SYS 4096 oppure SYS $2000
; SYS inoltre può essere prefisso per altri comandi, come SYS INPUT, SYS SAVE o SYS LOAD
SYS     CMP #$85        ; TOKEN INPUT
        BEQ SYSINP      ; SYS INPUT
        CMP #$94        ; TOKEN SAVE
        BNE SYS1
        JMP SYSSAVE

SYS1    CMP #$93        ; TOKEN LOAD
        BEQ SYSLOAD1    ; SYS LOAD
        JSR BASE
        JSR ADR
        LDA $AF
        STA $15
        LDA $AE
        STA $14
        JSR BSYS        ; esegue sys con ripristino e salvataggio registri
                        ; A=$030C, X=$030D, Y=$030E, STATUS=$030F
        LDA #$19        ; RESET STACK STRINGHE
        STA $16         ; *** RESET STACK STRINGHE ***
        RTS

SYSLOAD1 JMP SYSLOAD    ; SYS LOAD

SAVERTS RTS

; COMANDO SYS INPUT - input di una stringa da tastiera senza interpretazione
; comando: SYS INPUT A$
SYSINP  JSR ILLDIRECTCHK ; controllo per ILLEGAL DIRECT ERROR
        JSR CHRGET
        JSR EVLVAR      ; get/create variable and get variable address
        STA $49         ; save variable address low byte
        STY $4A         ; save variable address high byte
        JSR STRINGCHK   ; check if source is string, else do type mismatch
        JSR GETLIN      ; input in $0200 stringa terminata con zero
        LDA $0201
        CMP #$00        ; è terminatore?
        BNE NOSPACE     ; no, salta
        LDA $0200
        CMP #$20        ; è lo spazio "d'ufficio"?
        BNE NOSPACE
        LDA #$00        ; Se sì, trasformalo in un terminatore
        STA $0200
NOSPACE LDA #$0D
        STA $07         ; delimitatore stringa alternativo 1
        LDA #$00
        STA $08         ; delimitatore stringa alternativo 2
        LDY #$02        ; puntatore al buffer HIGH
        LDA #$00        ; puntatore al buffer LOW
        JSR POC05       ; sposta stringa nella parte alta della RAM
        JMP LET5        ; assegna stringa

BASE    TAX
        LDA #$23        ; "#"
        STA $B4
        TXA
BASEB   CMP #$24        ; "$"
        BEQ BASE1
        CMP #$23        ; "#"
        BNE BASE2
BASE1   STA $B4
        JSR CHRGET

BASE2   LDA $B4
        CMP #$23        ; "#"
        RTS

; PEEK - legge il valore di una locazione di memoria anche in esadecimale e a 16 bit
; funzione: PEEK(4096) oppure PEEK($2000)
; funzione: PEEK+(4096) oppure PEEK+($2000) ritorna valori a 16 bit (2 byte)
PEEK    CMP #$AA        ; token "+"
        BEQ PEEKPLUS
        JSR PEEK1
        LDY #$00
        LDA ($AE),Y
        JMP VI2


PEEK1   JSR PARSX
        JSR BASE
        JSR ADR
        JMP PARDX

; PEEK+
PEEKPLUS
        JSR CHRGET
        JSR PEEK1
        LDY #$01
        LDA ($AE),Y
        PHA
        DEY
        LDA ($AE),Y
        TAY
        PLA
        JMP UINT2FP    ; converte intero senza segno in FP A=high, Y=low

; parametri coordinate cursore e colore per istruzione VIDEO
VIDPARM JSR CHRGOT
        CMP #$28        ; "("
        BNE VPRMRTS
        JSR CHRGET
        CMP #$2C        ; ","
        BEQ VPRM2
        JSR GETINTS
        STY $D3         ; cursor x
        STY LAVORO4     ; salva posizione cursore x per eventuali righe successive
        JSR CHRGOT
        CMP #$29        ; ")"
        BEQ VPRM1
        CMP #$2C        ; ","
        BNE VDSYERR
VPRM2   JSR CHRGET
        CMP #$2C        ; ","
        BEQ VPRM3
        JSR GETINTS
        STY $D6         ; cursor y
        JSR CHRGOT
        CMP #$29        ; ")"
        BEQ VPRM1
        CMP #$2C        ; ","
        BNE VDSYERR
VPRM3   JSR CHRGET
        JSR GETINTS
        STY $0286       ; colore corrente
        JSR CHRGOT
        CMP #$29        ; ")"
        BEQ VPRM1
VDSYERR JMP SYERR

VPRM1   JMP CHRGET

; legge intero con segno
GETINTS JSR ESPRAR
        JMP INTIDX      ; Convert float point to 2-byte fixed point in A and Y

VPRMRTS RTS

; comando VIDEO$
VIDDOLCMD
        LDA #$18        ; byte HIGH memoria video
COLDOLCMD
        PHA             ; salva byte HIGH memoria video o colore
        JSR CHRGET
        JSR PARSX       ; controllo parentesi sinistra
        JSR GETBYTE     ; prende in X un parametro numerico 0 - 255
        JSR PARDX       ; controllo parentesi destra
        CPX #23         ; limite n. righe
        BCC VIDDLC1
        JMP ILLQUERR

VIDDLC1 LDA #$B2 ; TOKEN =
        JSR CMPCAR
        STX LAVORO1     ; salva il numero di riga
        JSR ESPRSTR     ; acquisizione stringa
        LDA $61         ; carica in A la lunghezza della stringa
        TAX
        LDA #22         ; prepara limite stringa a 22 caratteri
        CPX #22         ; limite stringa 22 caratteri
        BCS VIDDLC2
        TXA             ; in A lunghezza stringa limitata a 22 caratteri
VIDDLC2 STA $61         ; salva lunghezza stringa
        LDX LAVORO1     ; numero riga
        LDA $EDFD,X     ; tabella in ROM
        STA $64
        PLA             ; ripristina byte HIGH memoria video o colore
        STA $65
        TXA
        CMP #$0C
        BMI VIDDO2
        INC $65         ; incrementa indirizzo iniziale RAM VIDEO o colore (HIGH)
; a questo punto ci ritroviamo l'indirizzo della RAM video o colore in $62-$63
; il n. di caratteri in $61 e il puntatore alla stringa in $64-$65
VIDDO2  LDY $61
        TYA
        BEQ VIDDRTS
VIDDLOOP
        DEY            ; decrement length/index
        LDA ($62),Y    ; get byte from string
        STA ($64),Y    ; save byte to destination
        TYA            ; copy length/index
        BNE VIDDLOOP   ; loop if not all done yet
VIDDRTS RTS

; VIDEO - imposta o legge il carattere alla locazione del cursore
; comando: VIDEO=32 (scrive anche colore)
; con più parametri, anche hex: VIDEO=$35,A8,C9...
; con punto e virgola per andare su più righe: VIDEO=$35,A8,C9;AA,5C,31
; non modifica coordinate cursore, a meno di non terminare con ,+
; VIDEO=31,+
; funzione: A = VIDEO
VIDEO   TXA
        BNE VID0
        JMP VIDFUNZ     ; salta se funzione

VID0    JSR CHRGOT
        CMP #$24        ; "$"
        BEQ VIDDOLCMD
; scollega le righe della tabella righe logiche
;        LDX #21             ; 22 righe sul VIC-20 (da 0 a 21)
;CLEAN_LOOP
;        LDA $D9,X           ; Leggi il byte della tabella
;        ORA #$80            ; accendi SOLO il bit di wrap logico ($80)
;        STA $D9,X           ; Salva il valore pulito
;        DEX
;        BPL CLEAN_LOOP

        LDA $D3
        STA LAVORO1     ; salva posizione cursore x
        STA LAVORO4     ; salva posizione cursore x per eventuali righe successive
        LDX $D6
        STX LAVORO2     ; salva posizione cursore y
        LDA $0286
        STA LAVORO3     ; salva colore
        JSR VIDPARM
        JSR UGUALE      ; prende segno di uguale e parametro numerico seguente (anche hex)
VIDLOOP TAX
        LDA $D3
        CMP #22         ; colonne
        BCS VID1C
        LDA $D6
        CMP #23         ; righe
        BCS VID1C
        TXA
        PHA
        JSR RICVID
        PLA
        LDY $D3
        STA ($D1),Y     ; imposta carattere video
        LDA $0286       ; colore corrente
        STA ($F3),Y     ; imposta colore carattere
VID1C   INC $D3
        JSR CHRGOT
        BEQ VIDFINE     ; fine istruzione
        CMP #$3B        ; ";" se ; allora continua su riga testo seguente
        BNE VID5        ; non è ";" continua
        LDA LAVORO4     ; è ";", riposiziona cursore
        STA $D3
        INC $D6
        JSR CHRGET      ; passa al carattere successivo
        BEQ VIDSYERR    ; se il punto e virgola è alla fine dell'istruzione allora Syntax Error
        JMP VID6

VIDSYERR JMP SYERR
        
VID5    JSR VIRGOLA
        CMP #$AA        ; TOKEN "+"
        BEQ VIDPIU
VID6    JSR BASEB       ; imposta base dec o hex
        JSR DATO        ; legge il codice nel formato della base
        JMP VIDLOOP

; esce e conserva nuova posizione cursore e colore
VIDPIU  LDA $D3
        CMP #22
        BCC VID5B
        SEC
        SBC #22
        STA $D3
        INC $D6
        JSR RICVID      ; ricalcola indirizzi video e colore
VID5B   JMP CHRGET

; fine istruzione, ripristina posizione cursore e colore
VIDFINE LDA LAVORO1     ; ripristina posizione cursore x
        STA $D3
        LDA LAVORO2     ; ripristina posizione cursore y
        STA $D6
        LDA LAVORO3     ; ripristina colore
        STA $0286
        JMP RICVID      ; ricalcola indirizzi video e colore

; video funzione
VIDFUNZ JSR CHRGOT
        CMP #$24        ; "$"
        BEQ VIDDOL      ; funzione VIDEO$
        LDY $D3
        LDA ($D1),Y
; ritorno valore intero al Basic
VI2     TAY
        JMP BYTFLOAT    ; convert byte Y to float FAC1 - ritorna parametro

; funzione VIDEO$
VIDDOL  LDA #$18        ; byte HIGH memoria video
COLDOL1 STA LAVORO2
        JSR CHRGET
        JSR PARSX
        JSR GETBYTE     ; prende in X un parametro numerico 0 - 255
        JSR PARDX       ; controllo parentesi destra
        CPX #23         ; limite n. righe
        BCC VIDDO0
        JMP ILLQUERR

VIDDO0  TXA
        PHA
        LDA #22         ; numero di caratteri per riga
        JSR ALCSPC1     ; crea spazio per la stringa con lunghezza A, descriptor in $61, $62, $63
        PLA
        TAX
        LDA $EDFD,X     ; tabella in ROM
        STA LAVORO5
        LDA LAVORO2     ; indirizzo iniziale RAM VIDEO (HIGH) o RAM COLORE (HIGH)
        STA LAVORO6
        TXA
        CMP #$0C
        BMI VIDDO1
        INC LAVORO6     ; incrementa indirizzo iniziale RAM VIDEO (HIGH)
VIDDO1  LDA LAVORO2
        AND #$80
        BNE COLRAM      ; è RAM COLORE
        LDY #21         ; numero di caratteri per riga -1
VIDDLP  LDA (LAVORO5),Y
        STA ($62),Y
        DEY
        BPL VIDDLP
        JMP PUTSTR      ; controlla che ci sia spazio nel descriptor stack
                        ; e poi mette in questo stack il descrittore presente a $61, $62 e $63

COLRAM  LDY #21         ; numero di caratteri per riga -1
COLDLP  LDA (LAVORO5),Y
        AND #$0F        ; fa l'AND con $0F in quanto la RAM colore è 4 bit
        STA ($62),Y
        DEY
        BPL COLDLP
        JMP PUTSTR      ; controlla che ci sia spazio nel descriptor stack
                        ; e poi mette in questo stack il descrittore presente a $61, $62 e $63

UGUALE  LDA #$B2 ; TOKEN =
        JSR CMPCAR
        JSR BASE        ; imposta base dec o hex
        JMP DATO        ; legge il codice nel formato della base

UG1     JSR UGUALE      ; prende segno di uguale e parametro numerico seguente (anche hex)
        CMP #$10
        BMI UG2
UG3     JMP ILLQUERR

UG2     RTS

; BORDER - imposta/legge il codice del colore del bordo
; comando: BORDER=5, funzione: BORDER
BORDER  TXA
        BEQ BOFUN       ; è una funzione
        JSR UGUALE      ; prende segno di uguale e parametro numerico seguente (anche hex)
        CMP #$08
        BCS UG3         ; ILLQUERR
        STA $B0
        LDA $900F
        AND #$F8
        JMP PA2

BOFUN   LDA $900F
        AND #$07
        JMP VI2

; COLOR - scrive/legge codice colore alla locazione CSR
; comando: COLOR=5, funzione: COLOR
; senza parametri allora ripristina i colori normali
COLOR   BEQ COLNOPR     ; non ci sono parametri
        TXA
        BEQ COLFUN      ; è una funzione
        JSR CHRGOT
        CMP #$24        ; "$"
        BEQ COLDOLCMD1  ; comando COLOR$
        JSR UG1
        LDY $D3
        STA ($F3),Y
        RTS

; comando COLOR$
COLDOLCMD1
        LDA #$94        ; byte HIGH RAM colore
        JMP COLDOLCMD

; funzione COLOR
COLFUN  JSR CHRGOT
        CMP #$24        ; "$"
        BEQ COLDOL      ; funzione COLOR$
        LDY $D3
        LDA ($F3),Y
        AND #$0F
        JMP VI2

; funzione COLOR$
COLDOL  LDA #$94        ; byte HIGH RAM colore
        JMP COLDOL1

COLNOPR TXA
        BEQ COLFUN       ; è una funzione
; non ci sono parametri e non è una funzione, imposta colori di default
COLDEF  LDA #$1B         ; colori predefiniti sfondo e bordo
        STA $900F
        LDA #$06
        STA $0286       ; colore corrente
        RTS             ; JMP CLSR se si vuole anche cancellare lo schermo
        
; INK - imposta/legge il colore per il PRINT
; comando: INK=5, funzione: INK
INK     TXA
        BEQ INKFUN      ; è una funzione
        JSR UG1
        STA $0286       ; colore corrente
        RTS

INKFUN  LDA $0286       ; colore corrente
        JMP VI2

; VOLUME - imposta/legge il volume
; comando: VOLUME=15 funzione: VOLUME ritorna il livello di volume impostato
VOLUME  TXA
        BEQ VOLFUN      ; è una funzione
        JSR UG1
        STA $B0
        LDA $900E
        AND #$F0
VOL2    ORA $B0
        STA $900E
        RTS

VOLFUN  LDA $900E
        AND #$0F
        JMP VI2         ; ritorna il valore al Basic

; PAPER - imposta/legge il valore del colore di sfondo
; comando: PAPER=5 funzione: PRINT PAPER
PAPER   TXA
        BEQ PAPFUN      ; è una funzione
        JSR UG1
        ASL A
        ASL A
        ASL A
        ASL A
        STA $B0
        LDA $900F
        AND #$0F
PA2     ORA $B0
        STA $900F
        RTS

PAPFUN  LDA $900F
        LSR A
        LSR A
        LSR A
        LSR A
        AND #$0F
        JMP VI2

; AUX - scrive o imposta il registro del colore ausiliario
; inserito per completezza, non realmente usato in Nesic
; comando: AUX=6, funzione: PRINT AUX
AUX     TXA
        BEQ AUXFUN      ; è una funzione
        JSR UG1
        ASL A
        ASL A
        ASL A
        ASL A
        STA $B0
        LDA $900E
        AND #$0F
        JMP VOL2

AUXFUN  LDA $900E
        LSR A
        LSR A
        LSR A
        LSR A
        AND #$0F
        JMP VI2

; FIRE - legge il tasto FIRE del joystick
FIRE    LDA $911F
        CMP $911F
        BNE FIRE        ; attende dati stabili
        AND #32
        BEQ FIRE1
        LDA #$FF
FIRE1   EOR #$FF
        JMP INTFP       ; ritorna valore

; JOY - legge joystick e ritorna un valore a seconda della posizione
; funzione: JOY
JOY     SEI
        LDX #$7F
        STX $9122
JOY1    LDY $9120
        CPY $9120
        BNE JOY1        ; attende dati stabili
        LDX #$FF
        STX $9122
        LDX #$F7
        STX $9120
        CLI
JOY2    LDA $911F
        CMP $911F
        BNE JOY2        ; attende dati stabili
        LSR A
        LSR A
        AND #7
        CPY #$80
        BCC JOY3
        ORA #8
JOY3    TAY
        LDA TABJOY,Y
        JMP VI2         ; ritorna valore

TABJOY  BYTE 0,0,0,3,0,6,7,2,0,8,5,1,0,4,3,0

PADDLE  JSR GETBYTE     ; prende in X un parametro numerico 0 - 255
        JSR PARDX       ; controllo parentesi destra
        CPX #2          ; controllo validità parametro
        BCS PAD1        ; errore se parametro non valido
        LDA $9008,X     ; legge paddle
        JMP VI2         ; ritorna parametro

PAD1    JMP ILLQUERR

HPEN    LDY $9006       ; coordinata orizzontale
        JMP BYTFLOAT    ; convert byte Y to float FAC1 - ritorna parametro

VPEN    LDY $9007       ; coordinata verticale
        JMP BYTFLOAT    ; convert byte Y to float FAC1 - ritorna parametro

; SOUND( variabile di sistema: comando e funzione
; esempio: comando SOUND(1)=100 e funzione SOUND(1)
SOUND   TXA
        BEQ SNDFUNZ     ; è una funzione
        ; è un comando
        JSR SNDPAR      ; prende n.voce e parentesi chiusa
        STA $B0
        JSR UGUALE      ; prende segno di uguale e parametro numerico seguente (anche hex)
        CMP #$80
        BCC SOUND1      ; controllo validità parametro
        JMP ILLQUERR

SOUND1  CLC
        ADC #$7F
        LDY $B0
        STA $900A,Y     ; inserisce il valore nel registro audio
        RTS

; è una funzione
SNDFUNZ JSR SNDPAR      ; prende n.voce e parentesi chiusa
        TAY
        LDA $900A,Y     ; legge il valore dal registro audio
        BMI SOUND2
        LDA #$7F
SOUND2  SEC
        SBC #$7F
        JMP VI2         ; ritorna il valore letto

SNDPAR  JSR GETBYTE ; n. voce - prende in X un parametro numerico 0 - 255
        JSR PARDX
        TXA
        CMP #$04
        BMI SNDRTS
        JMP ILLQUERR

SNDRTS  RTS

; EVAL - valuta espressione fornita come stringa
EVAL    JSR ILLDIRECTCHK
        JSR PAREXP      ; Evaluation within parenthesis
        JSR GSINFO      ; evaluate string, get length in Y
        BNE EVAL1
        JMP ZERFAC      ; clear FAC1 exponent and sign

EVAL1   CMP #89
        BCC EVAL2
        JMP STRTLGERR

EVAL2   TAY
        LDA $7B
        PHA
        LDA $7A
        PHA
        LDA #0
        STA $0200,Y
        DEY
EVAL3   LDA ($22),Y
        STA $0200,Y
        DEY
        BPL EVAL3
        LDA #0
        STA $7A
        LDA #2
        STA $7B
        JSR CBASTOKEN   ; ACCETTA SOLO TOKENS ORIGINALI
        JSR CHRGET
        JSR ESPRAR
        LDA #$00
        JSR CMPCAR
        PLA
        STA $7A
        PLA
        STA $7B
        RTS

; BEEP
; comando: BEEP o BEEP 1 per attivare il beep dei tasti, BEEP 0 per disattivare
BEEP    BEQ BEEP1+1
        JSR GETBYTE     ; prende in X un parametro numerico 0 - 255
        TXA
        CMP #$02        ; controllo validità parametro
        BMI BEEP1
        JMP ILLQUERR

BEEP1   BIT $01A9       ;BYTE DOPO: LDA #$01
        SEI
        STA $02A7       ; salva parametro
        LDA #$00
        STA $900A       ; silenzia canale 1
MAXVOL  LDA #$0F        ; IMPOSTA VOLUME AL MASSIMO
        ORA $900E
        STA $900E
        CLI
        RTS

; CSR
; funzione: CSRX o CSRY ritornano la posizione del cursore
CSRXY   JSR CHRGET
        CMP #$58        ; "X"
        BEQ CSRX
        CMP #$59        ; "Y"
        BNE CRSYERR
CSRY    JSR CHRGET
        LDA $D6         ; locazione Y cursore
        JMP VI2         ; ritorna il valore letto

CSRX    JSR CHRGET
        LDA $D3         ; locazione X cursore
        JMP VI2         ; ritorna il valore letto

CRSYERR JMP SYERR       ; SYNTAX ERROR

; CSR
; comando: CSR x,y per posizionare il cursore, CSR da solo per cancellare lo schermo
CSR     BEQ CLS
        JSR GETBYTE     ; prende in X un parametro numerico 0 - 255
        TXA
        CMP #$16
        BPL IQERR01
        PHA
        JSR VIRGOLABYTE ; controlla virgola e prende in X un parametro numerico 0 - 255
        TXA
        CMP #$17
        BPL IQERR01
        STA $D6
        PLA
        STA $D3
RICVID  LDX $D6         ; coordinata x
        LDA $D9,X       ; tabella righe logiche
        ORA #$80
        STA $D9,X       ; scollega la riga della tabella righe logiche
        JSR SETSLINK    ; set screen pointers for cursor row .X, column .A e ricalcola indirizzo video
        JMP COLORSY     ; ricalcola indirizzo colore

CLS     JMP CLSR

IQERR01 JMP ILLQUERR

; POKE
; comando: POKE indirizzo, valore, valore, valore... anche multilinea iniziandola con la virgola
; i valori possono essere esadecimali iniziando il valore con segno $ e 2 o 4 caratteri
; e tale modalità continua fino a valore con #
; esempio: POKE $5000, A1, FF 00, 5A, #12, 141, 247, $51, $47
POKE    CMP #$AA        ; token "+"
        BEQ POKEPLUS
        JSR BASE
        JSR ADR
POKE1   LDA $AF
        PHA
        LDA $AE
        PHA
        JSR VIRGOLA
        JSR BASEB
        PHA
        JSR DATO
        TAX
        PLA
        STA $B4
        PLA
        STA $AE
        PLA
        STA $AF
        TXA
        LDY #$00
        STA ($AE),Y
        INC $AE
        BNE POKE4
        INC $AF
POKE4   JSR CHRGOT
        BNE POKE1
        TAY
        BNE POKRTS
        LDY $3A
        INY
        BEQ POKRTS
        LDA $7A
        STA $3D
        LDA $7B
        STA $3E
        LDY #2
        LDA ($7A),Y
        BEQ POKRTS
        LDY #5
        LDA ($7A),Y
        CMP #$2C        ; ","
        BNE POKRTS
        DEY
        LDA ($7A),Y
        STA $3A
        DEY
        LDA ($7A),Y
        STA $39
        CLC
        LDA #5
        ADC $7A
        STA $7A
        LDA #0
        ADC $7B
        STA $7B
        JMP POKE1

POKRTS  RTS

POKEPLUS
        JSR CHRGET
        JSR BASE
        JSR ADR
        LDA $AF
        PHA
        LDA $AE
        PHA
        JSR VIRGOLA
        JSR BASEB
        JSR ADR
        PLA
        STA $69
        PLA
        STA $6A
        LDY #$00
        LDA $AE
        STA ($69),Y
        INY
        LDA $AF
        STA ($69),Y
        RTS

; valuta indirizzo in esadecimale se espresso con prefisso $, altrimenti decimale normale
ADR     BEQ ADR1
        JSR HEX
        STA $AF
        JSR HEX
        STA $AE
        RTS

; valuta indirizzo in maniera tradizionale
ADR1    JSR CHRGOT
        JSR ESPRAR
        JSR MAKADR      ; convert FAC_1 to integer in temporary integer
        LDA $15
        STA $AF
        LDA $14
        STA $AE
        RTS

; valuta dato in esadecimale se espresso con prefisso $, altrimenti decimale normale
DATO    BNE HEX
        JSR CHRGOT
        JSR GETBYTE ; prende in X un parametro numerico 0 - 255
        TXA
        RTS

; valuta dato in esadecimale
HEX     JSR CHRGOT
        JSR HEX1
        ASL A
        ASL A
        ASL A
        ASL A
        STA $2A
        JSR CHRGET
        JSR HEX1
        ORA $2A
        PHA
        JSR CHRGET
        PLA
        RTS

HEX1    CMP #$30
        BCC HEXERR
        CMP #$3A
        BCC HEX2
        CMP #$41
        BCC HEXERR
        CMP #$47
        BCS HEXERR
HEX2    CMP #$3A
        PHP
        AND #$0F
        PLP
        BCC HEXRTS
        ADC #$08
HEXRTS  RTS

HEXERR  JMP ILLQUERR

; GRAPHIC
; comando: GRAPHIC n con n compreso tra 0 e 2
; n = 0 caratteri in ROM, n = 1 primo set in RAM, n = 2 secondo set in RAM
; GRAPHIC senza parametri reimposta modo grafico, colori, suono
; GRAPHIC con secondo parametro 0 o 1:
; esempio: GRAPHIC 1,0 Passa al modo grafico senza inizializzare i caratteri, GRAPHIC 1,1 come GRAPHIC 1
GRAPHIC BEQ GRESET
        JSR GETBYTE     ; prende in X un parametro numerico 0 - 255
        TXA
        PHA
        LDA #$01
        STA $B0
        JSR CHRGOT
        CMP #$2C        ; ","
        BNE GR2
        JSR CHRGET
        JSR GETBYTE     ; prende in X un parametro numerico 0 - 255
        TXA
        CMP #$01
        BEQ GR1         ; secondo parametro 1
        CMP #$00
        BNE GRILLQE
GR1     STA $B0         ; secondo parametro 0
GR2     PLA
        TAX
        BEQ GRAPH0
        DEX
        BEQ GRAPH1+1
        DEX
        BEQ GRAPH2
GRILLQE JMP ILLQUERR

; reimposta modo grafico, colori, suono
GRESET  JSR GRAPH0
        JSR COLDEF
        JSR CLSR
        JMP SILENTE

GRAPH0  LDA $9005
        AND #$F0
        STA $9005
        LDA #$09
        JMP CHROUT ; CHROUT di $09 abilita la possibilità di alternare i set di caratteri con la tastiera

GRAPH2  LDA #$88
GRAPH1  BIT $80A9       ; BYTE DOPO LDA #$80
        STA $C2

        LDA $B0
        BEQ GR3

        LDA #$10
        STA $AF
        LDA #$00
        STA $AE
        STA $C1
        TAY
GRLOOP  LDA ($C1),Y     ; loop di copia del set di caratteri da ROM a RAM
        STA ($AE),Y
        INY
        BNE GRLOOP
        INC $C2
        INC $AF
        LDA #$18
        CMP $AF
        BNE GRLOOP
GR3     LDA $9005
        AND #$F0
        ORA #$0C
        STA $9005
        LDA #$08
        JMP CHROUT ; CHROUT di $08 disabilita la possibilità di alternare i set di caratteri con la tastiera

; silenzia i canali audio e la routine su interrupt
SILENTE LDA #$00
        LDY #$04
SILOOP  DEY
        STA NVOLTE,Y
        STA $900A,Y
        BNE SILOOP
        RTS

; EFFECT - genera effetti complessi in modo asincrono su interrupt
; comando:
; EFFECT n.voce, n.volte, freq1, freq2
; EFFECT n.voce, durata, frequenza
; EFFECT senza parametri silenzia tutte le voci, compresi i registri hardware
EFFECT  BEQ SILENTE
        JSR GETBYTE     ; N. VOCE - prende in X un parametro numerico 0 - 255
        TXA
        CMP #$04
        BMI NEF2        ; errore se superiore a 4
NEFERR  JMP ILLQUERR

NEF2    STA $B0         ; n. voce
        JSR VIRGOLABYTE ; controlla virgola e prende in X un parametro numerico 0 - 255
        TXA
        CMP #$81
        BCS NEFERR      ; errore se superiore a 128
        PHA
        CMP #$00
        BNE NEF3
        LDY $B0         ; n. voce
        JSR CHRGOT
        BEQ NEF4
NEF3    JSR NEFPAR      ; FREQ1 - prende parametro
        STA FREQ1,Y     ; FREQ1
        STA FREQ0,Y     ; frequenza corrente
        TAX
        JSR CHRGOT
        BEQ NEF7        ; se fine istruzione salta senza prendere FREQ2
        JSR NEFPAR      ; FREQ2 - prende parametro
NEF8    STA FREQ2,Y     ; FREQ2
NEF4    PLA
        STA NVOLTE,Y
        CMP #$00
        BNE NEFRTS      ; se NVOLTE=0 allora stop suono
        STA $900A,Y
NEFRTS  RTS

NEF7    DEX
        TXA
        JMP NEF8

; prende parametro
NEFPAR  JSR VIRGOLABYTE ; controlla virgola e prende in X un parametro numerico 0 - 255
        TXA
        CMP #$81
        BCS NEFERR      ; errore se superiore a 128
        CLC
        ADC #$7F
        LDY $B0
        RTS

; routine interrupt per BEEP tasti ed effetti sonori EFFECT
INTERRUPT
        ; gestione BEEP tastiera
        LDA $02A7
        BEQ NOBEEP
        LDA #$00
        STA $900A
        LDA 197
        CMP #$40
        BEQ BEEP3
        CMP 827
        BEQ BEEP3
        TAX
        LDA #$F8
        STA $900A
        TXA
BEEP3   STA 827
; gestione EFFECT su interrupt
NOBEEP  LDX #$03
INTLOOP LDA NVOLTE,X
        BEQ INT3        ; salta se NVOLTE=0 (non deve suonare)
        LDA FREQ2,X
        CMP FREQ1,X     ; confronto per stabilire se suono ascendente o discendente
        BPL INT4        ; salta se suono ascendente
        DEC FREQ0,X
        DEC FREQ0,X
INT4    INC FREQ0,X
        LDA FREQ0,X
        CMP FREQ2,X
        BNE INT2
        LDA FREQ1,X
        STA FREQ0,X
        LDY NVOLTE,X
        BMI INT2
        DEC NVOLTE,X
        BNE INT2
        LDA #$00
INT2    STA $900A,X
INT3    DEX
        BPL INTLOOP     ; ripete per tutte le voci
        JMP IRQHANDLER  ; Esegue la routine di interrupt originale del VIC-20

; ritorna indirizzo definizione carattere in RAM
; input: registro A
; output: registri A Y
CHR2ADR TAX
CH2ADR2 STX $C1
        LDA #$02
        STA $C2
        TXA
        LDX #$03
CHRLOOP ASL $C1
        ROL $C2
        DEX
        BNE CHRLOOP
        LDA $C2
        LDY $C1
        RTS

; funzione SHAPE( - ritorna l'indirizzo definizione del codice carattere specificato
SHAPE   JSR BASE        ; imposta base dec o hex
        JSR DATO        ; legge il codice nel formato della base
        TAX             ; trasferisce il risultato in X
        JSR PARDX       ; parentesi chiusa
        JSR CH2ADR2
        JMP MAKFP       ; Convert Integer in (AC/YR) to Floating Point

; COMANDO: MERGE SHAPE
MSHAPE  JSR CHRGET
        JSR BASE        ; imposta base dec o hex
        JSR DATO        ; legge il parametro nel formato della base
        STA $AE         ; salva il primo parametro
        STA $AF         ; lo salva anche nel secondo, nel caso che non sia fornito
        JSR CHRGOT
        CMP #$2C        ; "," controlla se c'è una virgola
        BNE MSHAPE1     ; non c'è il secondo parametro, lo salta
        JSR CHRGET
        JSR BASEB
        JSR DATO        ; legge il parametro nel formato della base
        STA $AF         ; salva il secondo parametro
MSHAPE1 JSR PARDX
        LDA #$A4        ; token TO
        JSR CMPCAR      ; Syntax Error se non è token TO
        JSR BASEB
        JSR DATO        ; legge il parametro nel formato della base
        STA $B4         ; salva il terzo parametro
        LDA $AE
        CMP $AF         ; confronta i primi due parametri
        BNE MSHAPE2     ; non sono uguali, prosegui
        LDA $B4         ; sono uguali, carica il terzo parametro
        STA $AF         ; e lo salva nel secondo
        LDA $AE         ; rilegge il primo parametro
MSHAPE2 JSR CHR2ADR     ; lo converte nel puntatore alla RAM caratteri
        STY $57
        STA $58         ; puntatore RAM caratteri primo parametro
        LDA $AF         ; prende il secondo parametro
        JSR CHR2ADR     ; lo converte nel puntatore alla RAM caratteri
        STY $59
        STA $5A         ; puntatore RAM caratteri secondo parametro
        LDA $B4         ; prende il terzo parametro
        JSR CHR2ADR     ; lo converte nel puntatore alla RAM caratteri
        STY $5B
        STA $5C         ; puntatore RAM caratteri terzo parametro
        JSR CHRGOT      ; riprende il carattere del puntatore Basic corrente
        CMP #$2C        ; ","
        BEQ MSHAPE3     ; è una virgola, continua nell'analisi
        ; non è una virgola quindi XOR!
; XOR
MSHEOR  LDY #$07
MSHLOOP LDA ($57),Y
        EOR ($59),Y
        STA ($5B),Y
        DEY
        BPL MSHLOOP
        RTS
; AND
MSHAND  JSR CHRGET
        LDY #$07
MSHALP  LDA ($57),Y
        AND ($59),Y
        STA ($5B),Y
        DEY
        BPL MSHALP
        RTS
; OR
MSHOR   JSR CHRGET
        LDY #$07
MSHOLP  LDA ($57),Y
        ORA ($59),Y
        STA ($5B),Y
        DEY
        BPL MSHOLP
        RTS

; LOAD (copia carattere)
MSHLOAD JSR CHRGET
        LDY #$07
MSHLOD1 LDA ($57),Y
        STA ($5B),Y
        DEY
        BPL MSHLOD1
        RTS

; analisi per identificare AND, OR e NOT
MSHAPE3 JSR CHRGET
        CMP #$AF        ; token AND
        BEQ MSHAND      ; esegue AND
        CMP #$B0        ; token OR
        BEQ MSHOR       ; esegue OR
        CMP #$A8        ; token NOT
        BEQ MSHNOT      ; esegue NOT
        CMP #$93        ; token LOAD
        BEQ MSHLOAD     ; esegue LOAD (copia carattere)
        JMP PMSYERR     ; che altro vuoi? Il Caffè? Syntax Error
; NOT
MSHNOT  JSR CHRGET
        LDY #$07
MSHNOT1 LDA ($57),Y
        EOR #$FF
        STA ($5B),Y
        DEY
        BPL MSHNOT1
        RTS

; COMANDO MERGE - più che un merge è un APPEND
MERGE   CMP #$F4        ; token SHAPE
        BNE MERGE1 
        JMP MSHAPE

MERGE1  JSR DIRECT_ONLY_CHK ; DIRECT ONLY ERROR se in programma
        JSR PARMERGE
        LDA $2D
        LDY $2E
        SEC
        SBC #$02
        BCS PMER1
        DEY
PMER1   TAX
        LDA $0A
        JSR DLOAD       ; load RAM from a device
        BCS LRUN3
        JSR CREADST     ; Read I/O status word
        AND #$BF
        BNE LRUN2
        STX $2D
        STY $2E
        JSR CLR
        JSR LINKPRG
        JSR RENUMBER+2
        JMP READY

PARMERGE
        LDA #$00
        STA $0A
        JSR CLNAM       ; clear file name
        LDA #$01
        LDY #$00
        JSR SETLFS      ; set logical, first, second addresses
        LDA #01         ; device predefinito
        STA $BA         ; salva in $BA, verrà usato come default se non specificato
        JSR BIFCHRG     ; Check for more characters in current statement
        JSR SETNAM      ; set filename
        JSR BIFCHRG     ; Check for more characters in current statement
        JSR SCNBYT      ; scan for ",byte" and get byte, else do syntax error then warm start
        LDY #$00
        STX $49
        JSR SETLFS      ; set logical, first, second addresses
        JSR CHRGOT
        BEQ PMERRTS
PMSYERR JMP SYERR

PMERRTS RTS

; Load and RUN
LRUN    JSR PARMERGE
        LDA $0A
        LDX $2B
        LDY $2C
        JSR DLOAD       ; load RAM from a device
        BCC LRUN1
LRUN3   JMP BASIOERR    ; go handle BASIC I/O error

LRUN1   JSR CREADST     ; Read I/O status word
        AND #$BF
        BEQ LRUN4
LRUN2   JMP BLDERR      ; LOAD ERROR

LRUN4   STX $2D
        STY $2E
        JSR CLR
        LDA #$0D
        JSR CHROUT
        JMP RUN1

; IF
NIF0    JSR ESPR        ; valuta espressione
        LDA $61         ; risultato vero/falso in $61
        BEQ NIFALSE     ; salta se IF è false
        LDY #$00
        LDA #$A7        ; TOKEN THEN
        CMP ($7A),Y
        BEQ NEXTIST     ; THEN trovato, esegue istruzioni successive
        JSR CHRGOT      ; THEN non trovato, riprende il medesimo carattere
        JMP ISTEXE      ; esegue istruzioni successive

NEXTIST JSR CHRGET      ; prende il carattere successivo
        JMP ISTEXE      ; esegue istruzioni successive

; ELSE
ELS0    JSR SCNXTBL     ; passa alla linea successiva (scan for next BASIC line)
NEXTPTR JMP BUMPTP      ; puntatore a istruzione successiva (add Y to the BASIC execute pointer)

; IF false, cerca eventuale ELSE, interrompi se c'è un IF successivo
NIFALSE INY             ; salta istruzioni successive
        LDA ($7A),Y
        BEQ NEXTPTR       ; fine riga, passa a istruzione successiva
        CMP #$D6        ; TOKEN IF
        BEQ ELS0        ; è un'altra IF, passa alla linea successiva
        CMP #$E4        ; TOKEN ELSE
        BNE NIFALSE     ; non è ELSE, cerca ancora
        JSR NEXTPTR     ; è ELSE, puntatore a istruzione successiva (add Y to the BASIC execute pointer)
        JMP NEXTIST     ; esegue istruzioni successive

; FUNZIONI TRIM$, TRIM LEFT$, TRIM RIGHT$
TRIM    PHA             ; salva token operazione da fare
        JSR CHRGET
        JSR PARSX       ; check parentesi sinistra
        JSR ESPRSTR     ; valutiamo espressione
        JSR PARDX       ; check parentesi destra
        ; adesso abbiamo tutto: descrittore stringa in $61-$62-$63
        ; possiamo procedere ad identificare l'operazione da fare
        PLA
        CMP #$C8        ; token LEFT$
        BEQ TRLEFT
        CMP #$C9        ; token RIGHT$
        BEQ TRRIGHT
        CMP #$24        ; "$"
        BEQ TRICOMP
        JMP PMSYERR     ; Syntax Error

; TRIM$
TRICOMP JSR TRRIGHT1

; TRIM LEFT$
TRLEFT  JSR TRLEFT1
TRIMEND ; salva puntatore stringa
        LDA $62
        PHA
        LDA $63
        PHA
        LDA $61         ; lunghezza
        JSR ALCSPC1     ; crea spazio per la stringa con lunghezza A, descriptor in $61, $62, $63
        ; imposta puntatori copia
        PLA
        STA $23
        PLA
        STA $22
        LDA $62
        STA $35
        LDA $63
        STA $36
        LDA $61         ; lunghezza stringa nuova = lunghezza stringa vecchia
        ; copia stringa
        JSR STRCOPY     ; store string from pointer to utility pointer (lungh. A, $22-$23 => $35-$36)
        JMP PUTSTR      ; controlla che ci sia spazio nel descriptor stack
                        ; e poi mette in questo stack il descrittore presente a $61, $62 e $63
; TRIM RIGHT$
TRRIGHT JSR TRRIGHT1
        JMP TRIMEND

TRRIGHT1
        LDA $61
        TAY
TRRLOOP DEY
        BMI TRRXLP
        LDA ($62),Y     ; carica in A un byte della stringa
        CMP #$20        ; SPAZIO
        BEQ TRRLOOP
TRRXLP  INY
        TYA             ; copy length to A
        STA $61
        RTS

TRLEFT1 LDA $61
        LDY #$FF
TRLLOOP INY
        CPY $61
        BEQ TLXLP       ; FINE STRINGA
        LDA ($62),Y     ; carica in A un byte della stringa
        CMP #$20        ; SPAZIO
        BEQ TRLLOOP
TLXLP   TYA             ; copy length to A
        CLC             ; clear carry for add
        ADC $62         ; add start offset to string start pointer low byte
        STA $62         ; save string start pointer low byte
        BCC TLIX1       ; if no overflow skip the high byte increment
        INC $63         ; else increment string start pointer high byte
TLIX1   TYA
        LDA $61
        STY $61
        SEC
        SBC $61
        STA $61
        RTS

; DIRECT ONLY ERROR se in programma
DIRECT_ONLY_CHK
        LDX $3A         ; get current line number high byte
        INX             ; increment it
        BEQ DOCHK       ; prosegue se in modo diretto
        JMP DIRECT_ONLY_ERROR ; DIRECT ONLY ERROR se in programma
                
DOCHK   JMP CHRGOT

; INIZIALIZZAZIONE VETTORI BASIC E INTERRUPT
INTINI  LDX #$0B
INILOOP LDA TAB1,X      ; inizializza tabella vettori
        STA $0300,X
        DEX
        BPL INILOOP
        LDA #<NEWRUNSTOP
        STA $0328
        LDA #>NEWRUNSTOP        ; intercetta la routine del RUN/STOP per silenziare audio se in programma
        STA $0329
; reindirizza interrupt
        SEI
        LDA #<INTERRUPT
        STA $0314
        LDA #>INTERRUPT
        STA $0315
        CLI
        RTS

; controlla il tasto RUN/STOP e se in programma allora silenzia l'audio
NEWRUNSTOP
        JSR RUNSTOP
        PHP
        BNE NRSTOP1
        LDX $3A         ; get current line number high byte
        INX             ; increment it
        BEQ NRSTOP1     ; prosegue se in modo diretto
        JSR SILENTE     ; silenzia
NRSTOP1 PLP
        RTS

; TABELLA ERRORI PERSONALIZZATA
ERRWORDS
        WORD ERR31, ERR32, ERR33, ERR34, ERR35

ERR31   TEXT "undefine"
        BYTE $C4        ; "D" + $80
ERR32   TEXT "illegal rang"
        BYTE $C5        ; "E" + $80
ERR33   TEXT "proc not foun"
        BYTE $C4        ; "D" + $80
ERR34   TEXT "lbl not foun"
        BYTE $C4        ; "D" + $80
ERR35   TEXT "direct onl"
        BYTE $D9        ; "Y" + $80

UNDEFINED_ERROR
        LDX #31
        JMP NERROR

ILLEGAL_RANGE_ERROR
        LDX #32
        JMP NERROR

PROC_NOT_FOUND_ERROR
        LDX #33
        JMP NERROR

LBL_NOT_FOUND_ERROR
        LDX #34
        JMP NERROR

DIRECT_ONLY_ERROR
        LDX #35
        JMP NERROR

; Nesic Error
NERROR  LDA $3A         ; se contiene $FF siamo in modo diretto
        CMP #$FF
        BNE NERROK      ; salta se siamo in programma, in modo diretto segnalazione errore standard
ERR2    CPX #$00
        BEQ ERR3        ; se X è 0 allora UNDEFINED ERROR
        CPX #$1F
        BCC ERR1
        TXA
        SEC
        SBC #$1F
        ASL
        TAX
ERR3    LDA ERRWORDS,X
        STA $22
        LDA ERRWORDS+1,X
        STA $23
        JSR SILENTE     ; silenzia suono
        JMP BERROR      ; Basic Error stampa messaggio ? errore, clear current I/O channel, flag default

ERR1    JSR SILENTE     ; silenzia suono
        JMP ERRORE

; Gestione personalizzata
NERROK  TXA
        PHA
        JSR LEGGIER
        STY $B0
        ORA $B0
        BEQ NERR1
        JSR GESTERR     ; la variabile ER è impostata, salta alla gestione errori
NERR1   PLA
        TAX
        JMP ERR2

; vede se la variabile ER (Error) contiene qualcosa di diverso da 0
LEGGIER LDA #$45        ; Carattere "E"
        STA $45         ; (Il BASIC usa $45-$46 per il nome cercato)
        LDA #$52        ; Carattere "R"
        STA $46
        JSR FNDVAR      ; Cerca/Crea variabile "ER" -> Indirizzo in $47-$48
        LDY #$00
        LDA ($47),Y
        RTS

; scrive variabile EC (Error Code) - mettere il numero in A e Y (A=HIGH, Y=LOW)
SCRIVIEC
        JSR MAKFP       ; Converti intero A/Y -> FAC
        LDA #$45        ; Carattere "E"
        STA $45         ; (Il BASIC usa $45-$46 per il nome cercato)
        LDA #$43        ; Carattere "C"
        STA $46
        JSR FNDVAR      ; Cerca/Crea variabile "EC" -> Indirizzo in $47-$48
; scrive il valore dal FAC ($61-$66) alla variabile puntata da $47-$48
        LDY #$05
SCRLOOP LDA $61,Y
        STA ($47),Y
        DEY
        BPL SCRLOOP
        ; patch per forzare il segno positivo
        LDY #$01
        LDA $62         ; Mantissa 1
        AND #$7F        ; <--- AZZERA IL BIT 7 (Forza POSITIVO)
        STA ($47),Y     ; Ora il BASIC vedrà SEMPRE un numero positivo
        RTS

ERRSTR  TEXT "err"
        BYTE $B0,$5D    ; token OR e "]"

; se arriva qui la variabile ER è impostata
GESTERR
; cerca se siamo dentro la procedura [ERROR]
        LDA #<ERRSTR
        STA NAMECMP1
        LDA #>ERRSTR
        STA NAMECMP1+1
        JSR FINDPRO
        BNE GESTRTS     ; ritorna se siamo già dentro la procedura [ERROR]
; non siamo dentro, cerca se nel programma esiste la procedura [ERROR]
        LDA #<ERRSTR
        STA $7A
        LDA #>ERRSTR
        STA $7B
        JSR NOMPROC
        BNE GESTERR1    ; salta se è stata trovata la procedura [ERROR]
GESTRTS RTS

; la procedura ERROR è stata trovata e non ci siamo ancora dentro
GESTERR1
        ; recupera l'Error Code dallo stack
        TSX
        LDA $0103,X
        TAY
        LDA #$00        ; A = #$00 Y = Error Code

        ; salva l'Error Code nella variabile EC
        JSR SCRIVIEC

; a questo punto per avviare procedura ERROR
; bisogna prima impostare lo Stack Pointer e mettere nello stack:
; indirizzo per proseguire il programma
; numero di linea
; token GOSUB

        ; riprende il puntatore del Basic nel punto di errore e salta l'istruzione, poi lo risalva
        ; in pratica consente di riprendere l'esecuzione a partire dall'istruzione successiva
        LDA PTRSAVE
        STA $7A
        LDA PTRSAVE+1
        STA $7B
        JSR CHRGET
        JSR FINEISTR
        LDA $7A
        STA PTRSAVE     ; salva puntatore Basic LOW
        LDA $7B
        STA PTRSAVE+1   ; salva puntatore Basic HIGH

        ; imposta puntatore Basic al nome della chiamata ERROR
        LDA #<ERRSTR
        STA $7A
        LDA #>ERRSTR
        STA $7B
        ; reimposta Stack Pointer
        LDX STACKSAVE
        DEX
        DEX             ; salta due byte, non so perché
        TXS             ; reimposta Stack Pointer
        ; salva nello stack i dati per la chiamata della procedura
        LDA PTRSAVE+1
        PHA
        LDA PTRSAVE
        PHA
        LDA $3A         ; Current Basic line number HIGH
        PHA
        LDA $39         ; Current Basic line number LOW
        PHA
        LDA #$8D        ; TOKEN GOSUB
        PHA
        ; cerca la procedura nel programma
        JSR FNDPROC
        ; salta all'inizio del nome procedura
        JSR SALTABGN
        ; esegue la procedura
        JMP RUN4

; trova nome ultima procedura nello stack e ritorna puntatore al nome trovato in NAMECMP2
; in X lo stack
LASTPRO LDX STACKSAVE
LPRLOOP LDA $0101,X     ; tipo
        CMP #$8D        ; token GOSUB (PROCEDURA)
        BEQ LPRO1
        CMP #$81        ; token FOR
        BNE FDNOTF      ; CONTROLLO TOKEN FOR, SI PUO' TOGLIERE QUANDO E' A PUNTO
        TXA
        CLC
        ADC #$12        ; salta stack FOR (18 byte)
        TAX
        JMP LPRLOOP

LPRO1   LDA $0105,X     ; NOME PTR HIGN
        STA NAMECMP2+1
        LDA $0104,X     ; NOME PTR LOW
        STA NAMECMP2
        RTS

FDNOTF  LDA #$00
        RTS

; trova procedura nello stack con nome uguale a quello puntato da NAMECMP1
; all'ingresso il puntatore al nome deve essere posto in NAMECMP1
; all'uscita il puntatore al nome trovato si trova in NAMECMP2
; flag 0 attivo se non trovato (A=#$00 se non trovato, A=#$01 se trovato)
; in X la posizione nello stack

FINDPRO LDX STACKSAVE
FDLOOP1 JSR LPRLOOP
        LDY #$00
FDLOOP2 LDA (NAMECMP1),Y
        CMP (NAMECMP2),Y
        BEQ FDPRO2
        TXA
        CLC
        ADC #$07        ; salta stack GOSUB (7 byte)
        CMP #$FB        ; limite stack
        BCS FDNOTF      ; NON TROVATO
        TAX
        JMP FDLOOP1

FDPRO2  INY
        CMP #$5D        ; "]"
        BNE FDLOOP2
        LDA #$01        ; TROVATO
        RTS
;
; ricerca procedura ERROR
FDINI   LDA #<ERRSTR
        STA NAMECMP1
        LDA #>ERRSTR
        STA NAMECMP1+1
        JMP FINDPRO

; SYS FUNZIONE (numerica o stringa, default numerica)
SYSFUNZ JSR PARSX
        JSR BASE
        JSR ADR
        LDA $AF
        STA $15
        LDA $AE
        STA $14
        LDA #$00
        JSR INTFP       ; azzera valore numerico di ritorno
        LDA $16         ; legge stack descrittori stringa
        PHA             ; salva stack descrittori stringa
        JSR BSYS        ; esegue sys con ripristino e salvataggio registri
                        ; A=$030C, X=$030D, Y=$030E, STATUS=$030F
        PLA             ; recupera stack descrittori stringa
        TAX
        STX $16         ; ripristina stack descrittori stringa al valore iniziale
        LDA $0D         ; get data type flag, $FF = string, $00 = numeric
        BEQ NOSTR       ; non è stringa
        DEX
        DEX
        DEX
        STX $17         ; imposta puntatore alla stringa corrente nello stack
        ; chiama la PUTSTR per rimettere l'ultima stringa nello stack
        JSR PUTSTR      ; controlla che ci sia spazio nel descriptor stack
                        ; e poi mette in questo stack il descrittore presente a $61, $62 e $63
; se non è stringa, è stato comunque ripristinato lo stack dei descrittori al valore pre chiamata
; in questo caso non mi serve impostare la locazione $17
; in quanto non ci devono essere stringhe in sospeso
NOSTR   JMP PARDX

; INSTR - trova una sottostringa all'interno di una stringa
; funzione: INSTR(A$,B$)
INSTR   JSR PARSX
        LDA #$01
        STA $6D         ; imposta offset inizio stringa
        JSR ESPR
        BIT $0D         ; test data type flag, $FF = string, $00 = numeric
        BMI INSTR1      ; salta se stringa
        ; numerico
        JSR MAKADR      ; converte in intero in $14-$15
        LDA $14
        BEQ INSTRERR    ; se 0 Illegal Quantity Error
        LDA $15         ; se maggiore di 255 Illegal Quantity Error
        BEQ INSTR0
INSTRERR
        JMP ILLQUERR

INSTR0  LDA $14
        STA $6D         ; salva il valore dell'offset iniziale in $6D
        JSR VIRGOLASTR  ; controllo sintassi virgola - valuta espressione 
                        ; in $64-$65 puntatore al descrittore stringa
                        ; $61-$62-$63: descrittore stringa
INSTR1  JSR FRESTR      ; scarica dallo stack la stringa temporanea $64-$65
                        ; e copia descrittore stringa in $61-$62-$63
        ; copia descrittore stringa da $61-$62-$63 a $69-$6A-$6B
        LDA $61
        STA $69
        LDA $62
        STA $6A
        LDA $63
        STA $6B

        JSR VIRGOLASTR     ; controllo sintassi virgola - valuta espressione 
                           ; in $64-$65 puntatore al descrittore stringa
                           ; $61-$62-$63 : descrittore stringa
        JSR PARDX
        LDA $69         ; Lunghezza A$
        BEQ INSTRRETZERO ; Se A$ è vuota -> Ritorna sempre 0!
        LDA $61         ; Lunghezza B$
        BEQ INSTRRETSTART ; Se B$ è vuota (e A$ no) -> Ritorna offset se non maggiore
                        ; della lungh altrimenti 0
        LDA $69         ; Confronta Lunghezza A$ con B$
        CMP $61
        BCC INSTRRETZERO ; Se A$ < B$ -> Ritorna 0 (B$ è più grande, impossibile trovarla)

INSTR2  LDA $69         ; Lunghezza A$
        SEC
        SBC $61         ; Sottrai Lunghezza B$
        TAX             ; X = (Lungh_A - Lungh_B)
        INX             ; X = Numero totale di tentativi reali
        LDA #$01
        STA $6C         ; imposta contatore
INSTRLOOP
        LDY #$00        ; Indice Y per scorrere i caratteri
INSTRLOOP2
        LDA $6C         ; contatore attuale
        CMP $6D         ; offset inizio stringa
        BCC INSTRNEXT
        LDA ($62),Y     ; Carica carattere da B$
        CMP ($6A),Y     ; Confronta con carattere in A$
        BNE INSTRNEXT   ; Se diversi, fallimento -> passa alla prossima posizione
        INY
        CPY $61         ; Abbiamo controllato tutta la lunghezza di B$?
        BEQ INSTRFOUND  ; Sì! Corrispondenza trovata!
        BNE INSTRLOOP2  ; No, continua il controllo interno sui caratteri successivi

; avanzamento alla prossima posizione
INSTRNEXT
        INC $6A
        BNE INSTRINCCTR
        INC $6B
INSTRINCCTR
        INC $6C
        DEX
        BNE INSTRLOOP   ; loop se diverso da zero
INSTRRETZERO
        LDA #$00        ; Risultato = 0
        BEQ INSTREXIT   ; salta sempre

INSTRRETSTART
        LDA $6D         ; Risultato = offset
        BNE INSTRF2     ; salta sempre

INSTRFOUND
        LDA $6C         ; Risultato = Valore del contatore di posizione attuale
INSTRF2 CMP $69
        BEQ INSTREXIT   ; se è uguale alla lunghezza della stringa prosegui
        BCS INSTRRETZERO ; se è maggiore della lunghezza della stringa ritorna 0
        ; prosegui se è minore della lunghezza della stringa
INSTREXIT
        TAY
        JMP BYTFLOAT    ; FUNZIONI: ritorna byte presente in Y

; converte intero senza segno in FP A=high, Y=low
UINT2FP
        STA $62          ; save high byte as FAC1 mantissa1
        STY $63          ; save low byte as FAC1 mantissa2
        LDX #$90         ; set exponent to 16d bits
        SEC              ; set integer is +ve flag
        JMP POC01        ; set exponent = X, clear mantissa 4 and 3 and normalise FAC1

; CONTROLLO SINTASSI VIRGOLA E ACQUISIZIONE STRINGA
; descrittore stringa: lungh stringa in $61 e puntatore stringa a $62 - $63
VIRGOLASTR
        JSR VIRGOLA     ; controllo sintassi virgola
ESPRSTR JSR ESPR        ; FRMEVL - valuta espressione (può porre la stringa nello stack dei descrittori)
        JSR STRINGCHK   ; controlliamo che sia una stringa, altrimenti diamo Type Mismatch Error
FRESTR  LDA $64
        LDY $65         ; in $64-$65 puntatore al descrittore stringa
        JSR FRETMP      ; scarica dallo stack la stringa temporanea
ESPCPY  LDY #$00        ; copia descrittore stringa in $61-$62-$63
        LDA ($64),Y 
        STA $61
        INY
        LDA ($64),Y
        STA $62
        INY
        LDA ($64),Y
        STA $63
        RTS

* = $BFFF
        BYTE $00
