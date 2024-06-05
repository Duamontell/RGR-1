PROGRAM CountWords(INPUT, OUTPUT);
USES 
  ReadWords, TreeWord; 
VAR
  F1, F2: TEXT;                  
BEGIN {CountWords}
  ASSIGN(F1, 'warandpeacebig.txt');
  ASSIGN(F2, 'output-rgr1.txt');
  RESET(F1);
  REWRITE(F2);
  ReadSortWord(F1);
  CLOSE(F1);    
  PrintWords(F2);
  CLOSE(F2)
END. {CountWords}
