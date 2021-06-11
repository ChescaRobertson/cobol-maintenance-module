       IDENTIFICATION DIVISION.
       PROGRAM-ID. "gilded-rose".

       ENVIRONMENT DIVISION.
           INPUT-OUTPUT SECTION.
           FILE-CONTROL.
             SELECT FI-IN-ITEMS ASSIGN "in.dat"
               ORGANISATION IS LINE SEQUENTIAL.
             SELECT FI-OUT-ITEMS ASSIGN "out.dat"
               ORGANISATION IS LINE SEQUENTIAL.

       DATA DIVISION.
           FILE SECTION.
           FD FI-IN-ITEMS.
           01 FS-IN-ITEM PIC X(60).
           FD FI-OUT-ITEMS.
           01 FS-OUT-ITEM.
             05 SELL-IN PIC S9(3) SIGN IS LEADING SEPARATE CHARACTER.
             05 FILLER PIC X VALUE SPACE.
             05 QUALITY PIC S9(3) SIGN IS LEADING SEPARATE CHARACTER.
             05 FILLER PIC X VALUE SPACE.
             05 ITEM-NAME PIC X(50).

       PROCEDURE DIVISION.
           OPEN INPUT FI-IN-ITEMS OUTPUT FI-OUT-ITEMS.
          
       0100-START SECTION.
           READ FI-IN-ITEMS END GO TO 0200-END.
           MOVE FS-IN-ITEM TO FS-OUT-ITEM.
           IF ITEM-NAME(1:8) NOT = "Sulfuras" 
               SUBTRACT 1 FROM SELL-IN
           END-IF.
      
       0110-AGED-BRIE SECTION.
           IF ITEM-NAME = "Aged Brie"
               ADD 1 TO QUALITY
           END-IF.
       
       0120-BACKSTAGE-PASS SECTION.
           IF ITEM-NAME(1:16) = "Backstage passes"
             IF SELL-IN = 0
                  SET QUALITY TO 0
             ELSE IF SELL-IN < 11
                   ADD 2 TO QUALITY
             ELSE IF SELL-IN < 6
                    ADD 3 TO QUALITY
             ELSE IF SELL-IN < 0
                    SUBTRACT 2 FROM QUALITY
             ELSE 
                    ADD 1 TO QUALITY
             END-IF
           END-IF.

       0130-SULFURAS SECTION.
           IF ITEM-NAME(1:8) = "Sulfuras"
             SET QUALITY TO 80
           END-IF.

       0140-CONJURED SECTION.
           IF ITEM-NAME(1:8) = "Conjured"
              IF SELL-IN >= 0
               SUBTRACT 2 FROM QUALITY
              ELSE 
               SUBTRACT 4 FROM QUALITY
           END-IF.
       
       0150-NORMAL-ITEMS SECTION.
           IF ITEM-NAME NOT = "Aged Brie" 
           AND ITEM-NAME(1:16) NOT = "Backstage passes" 
           AND ITEM-NAME(1:8) NOT  = "Sulfuras" 
           AND ITEM-NAME(1:8) NOT = "Conjured"
             IF SELL-IN >= 0
               SUBTRACT 1 FROM QUALITY
             ELSE 
               SUBTRACT 2 FROM QUALITY
             END-IF
           END-IF.

       0160-WRITE SECTION.
           IF ITEM-NAME(1:8) NOT = "Sulfuras" 
           AND QUALITY > 50
               SET QUALITY TO 50
           END-IF. 
           WRITE FS-OUT-ITEM.
           GO TO 0100-start.

       0200-END SECTION.
           CLOSE FI-IN-ITEMS.
           CLOSE FI-OUT-ITEMS.




