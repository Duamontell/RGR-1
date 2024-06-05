UNIT ReadWords;
INTERFACE

USES
  TreeWord;
     
PROCEDURE ReadSortWord(VAR F: TEXT);   
IMPLEMENTATION
VAR
  Ch, StateRead: CHAR;
  Word: STRING;
      
PROCEDURE LowLetter(VAR Ch: CHAR);
BEGIN {LowLetter}
  IF (Ch IN ['A'..'Z']) OR (Ch IN ['À'..'ß']) OR (Ch = '¨')
  THEN 
    CASE Ch OF
      'A': Ch := 'a';
      'B': Ch := 'b';
      'C': Ch := 'c';
      'D': Ch := 'd';
      'E': Ch := 'e';
      'F': Ch := 'f';
      'G': Ch := 'g';
      'H': Ch := 'h';
      'I': Ch := 'i';
      'J': Ch := 'j';
      'K': Ch := 'k';
      'L': Ch := 'l';
      'M': Ch := 'm';
      'N': Ch := 'n';
      'O': Ch := 'o';
      'P': Ch := 'p';
      'Q': Ch := 'q';
      'R': Ch := 'r';
      'S': Ch := 's';
      'T': Ch := 't';
      'U': Ch := 'u';
      'V': Ch := 'v';
      'W': Ch := 'w';
      'X': Ch := 'x';
      'Y': Ch := 'y';
      'Z': Ch := 'z';
      'À': Ch := 'à';
      'Á': Ch := 'á';
      'Â': Ch := 'â';
      'Ã': Ch := 'ã';
      'Ä': Ch := 'ä';
      'Å': Ch := 'å';
      '¨': Ch := '¸';
      'Æ': Ch := 'æ';
      'Ç': Ch := 'ç';
      'È': Ch := 'è';
      'É': Ch := 'é';
      'Ê': Ch := 'ê';
      'Ë': Ch := 'ë';
      'Ì': Ch := 'ì';
      'Í': Ch := 'í';
      'Î': Ch := 'î';
      'Ï': Ch := 'ï';
      'Ð': Ch := 'ð';
      'Ñ': Ch := 'ñ';
      'Ò': Ch := 'ò';
      'Ó': Ch := 'ó';
      'Ô': Ch := 'ô';
      'Õ': Ch := 'õ';
      'Ö': Ch := 'ö';
      '×': Ch := '÷';
      'Ø': Ch := 'ø';
      'Ù': Ch := 'ù';
      'Ú': Ch := 'ú';
      'Û': Ch := 'û';
      'Ü': Ch := 'ü';
      'Ý': Ch := 'ý';
      'Þ': Ch := 'þ';
      'ß': Ch := 'ÿ';
    END 
END; {LowLetter}    

FUNCTION CorrectSymbol(VAR Ch: CHAR): BOOLEAN;
BEGIN {CorrectSymbol}
  IF (Ch IN ['a'..'z', 'à'..'ÿ', 'À'..'ß', '-', 'A'..'Z', '¨', '¸'])
  THEN 
    CorrectSymbol := TRUE
  ELSE
    CorrectSymbol := FALSE   
END; {CorrectSymbol}

{PROCEDURE CleanInsertWord(VAR R: Tree; VAR W: STRING);
BEGIN {CleanInsertWord}
  {IF W[1] <> '-'
  THEN
    BEGIN
      Insert(R, W);
      W := ''
    END
  ELSE
    W := ''  
END;} {CleanInsertWord}

{PROCEDURE InsertWord(VAR Wr: STRING);
BEGIN
  CleanInsertWord(Root, Wr)  
END;}

PROCEDURE ReadSortWord(VAR F: TEXT); 
BEGIN
  Word := '';
  WHILE NOT EOF(F)
  DO
    BEGIN 
      WHILE NOT EOLN(F)
      DO
        BEGIN
          READ(F, Ch);
          IF CorrectSymbol(Ch)
          THEN
            StateRead := 'W'
          ELSE
            IF StateRead = 'W'
            THEN
              BEGIN
                StateRead := 'R';
                InsertWord(Word)
                //Insert(Root, Word);
                //Word := ''
              END;
          IF StateRead = 'W'
          THEN
            BEGIN
              LowLetter(Ch);
              Word := Word + Ch
            END
        END;
      IF StateRead = 'W'
      THEN
        BEGIN
          InsertWord(Word);
          //Insert(Root, Word);
          //Word := '';
          StateRead := 'R'
        END;  
      READLN(F)
    END
END; 
     
BEGIN
END.
