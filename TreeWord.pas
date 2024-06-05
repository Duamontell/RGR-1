UNIT TreeWord;
INTERFACE

PROCEDURE InsertWord(VAR Wr: STRING);
PROCEDURE PrintWords(VAR F: TEXT);   
//PROCEDURE Insert(VAR Ptr: Tree; Data: STRING);

IMPLEMENTATION
TYPE 
  Tree = ^NodeType;
  NodeType = RECORD
               Key: STRING;
               LLink, RLink: Tree;
               Count: INTEGER
             END;
VAR
  Root: Tree;
  Found: CHAR;             

PROCEDURE CheckDefaultLetter(VAR V1, V2: STRING; VAR Index: INTEGER; VAR F: CHAR);
BEGIN {CheckDefaultLetter}
  IF V1[Index] > V2[Index]
  THEN
    F := 'M' //Меньше
  ELSE
    IF V1[Index] < V2[Index]
    THEN
      F := 'B'; //Больше
END; {CheckDefaultLetter}

PROCEDURE CheckMysteryLetter(VAR V1, V2: STRING; VAR Index: INTEGER; VAR F: CHAR);
BEGIN {CheckMysteryLetter}
  IF V1[Index] = 'ё'
  THEN
    IF V2[Index] > 'е'
    THEN
      F := 'B' //Больше
    ELSE
      F := 'M' //Меньше   
  ELSE
    IF V1[Index] > 'е'
    THEN
      F := 'M' //Меньше
    ELSE
      F := 'B' //Больше   
END; {CheckMysteryLetter}

PROCEDURE Insert(VAR Ptr: Tree; Data: STRING);
VAR
  i: INTEGER;
BEGIN {Insert}
  IF Ptr = NIL
  THEN
    BEGIN 
      NEW(Ptr);
      Ptr^.Key := Data;
      Ptr^.LLink := NIL;
      Ptr^.RLink := NIL;
      Ptr^.Count := 1
    END                                   
  ELSE                                  
    BEGIN
      i := 0;
      Found := 'N';
      WHILE (i <= Length(Ptr^.Key)) AND (i <= Length(Data)) AND (Found = 'N')
      DO
        BEGIN        
          IF ((Ptr^.Key[i] = 'ё') AND (Data[i] <> 'ё')) OR ((Ptr^.Key[i] <> 'ё') AND (Data[i] = 'ё')) //Проверяем на букву 'ё'
          THEN
            CheckMysteryLetter(Ptr^.Key, Data, i, Found)
          ELSE
            CheckDefaultLetter(Ptr^.Key, Data, i, Found);                
          IF (Ptr^.Key[i] = Data[i]) AND (i = Length(Ptr^.Key)) AND (i <> Length(Data))
          THEN
            Found := 'B' //Больше
          ELSE
            IF (Ptr^.Key[i] = Data[i]) AND (i <> Length(Ptr^.Key)) AND (i = Length(Data))
            THEN
              Found := 'M'; //Меньше 
          i := i + 1         
        END; 
      CASE Found OF
        'N': Ptr^.Count:= Ptr^.Count + 1;
        'M': Insert(Ptr^.LLink, Data);
        'B': Insert(Ptr^.RLink, Data)
      END                 
    END
END; {Insert}

PROCEDURE CleanInsertWord(VAR R: Tree; VAR W: STRING);
BEGIN {CleanInsertWord}
  IF W[1] <> '-'
  THEN
    BEGIN
      Insert(R, W);
      W := ''
    END
  ELSE
    W := ''  
END; {CleanInsertWord}

PROCEDURE InsertWord(VAR Wr: STRING);
BEGIN
  CleanInsertWord(Root, Wr)  
END;

PROCEDURE PrintTree(VAR F: TEXT; Ptr: Tree);
BEGIN {PrintTree}
  IF Ptr <> NIL
  THEN  
    BEGIN
      PrintTree(F, Ptr^.LLink);
      WRITE(F, Ptr^.Key);
      WRITE(F, ' '); 
      WRITELN(F, Ptr^.Count);
      PrintTree(F, Ptr^.RLink);
      DISPOSE(Ptr)
    END
END; {PrintTree}

PROCEDURE PrintWords(VAR F: TEXT);
BEGIN
  PrintTree(F, Root)
END;

BEGIN
  Root := NIL;
END.
