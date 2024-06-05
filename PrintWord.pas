UNIT PrintWord;
INTERFACE
USES
  TreeWord;
  
PROCEDURE PrintWords(VAR F: TEXT);  
PROCEDURE PrintTree(VAR F: TEXT; Ptr: Tree);

IMPLEMENTATION

PROCEDURE PrintWords(VAR F: TEXT);
BEGIN
  PrintTree(F, Root)
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

BEGIN
END.
