/*
   The Docs.Trans module, when found in an action statement,
   like OUTPUT, produces three files, tf_idf, WordBag and WordsCounted

*/

IMPORT ML;
IMPORT ML.Docs AS Docs;
d := 
  DATASET(
   [
    {'One of the wonderful things about tiggers is tiggers are wonderful things'},
    {'It is a little scary the drivel that enters ones mind when entering random text'},
    {'I almost quoted Oscar Wilde; but I had gotten a little too silly already!'},
    {'I would hate to have quoted silly people!'},
    {'Oscar Wilde is often quoted'},
    {'In Hertford, Hereford and Hampshire Hurricanes hardly ever happen'},
    {'It is a far, far better thing that I do, than I have ever done'}
   ],{STRING r});
d1 := PROJECT(d,TRANSFORM(Docs.Types.Raw,SELF.Txt := LEFT.r));
d2 := Docs.Tokenize.Enumerate(d1);
OUTPUT(d2,NAMED('d_enumerated'));
d3 := Docs.Tokenize.Clean(d2);
OUTPUT(d3,NAMED('d_cleaned'));
d4 := Docs.Tokenize.Split(d3);
OUTPUT(d4,NAMED('d_tokenized'));
lex := Docs.Tokenize.Lexicon(d4);
OUTPUT(lex,NAMED('lexicon_from_d'));
o1 := Docs.Tokenize.ToO(d4,lex);
OUTPUT(o1,NAMED('d_ToO'));
OUTPUT(Docs.Trans(o1));
