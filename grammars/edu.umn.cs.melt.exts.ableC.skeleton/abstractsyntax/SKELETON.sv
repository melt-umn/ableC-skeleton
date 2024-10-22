grammar edu:umn:cs:melt:exts:ableC:skeleton:abstractsyntax;

imports edu:umn:cs:melt:ableC:abstractsyntax:host;
imports silver:langutil;

abstract production skeleton
s::Stmt ::=
{
  attachNote extensionGenerated("ableC-skeleton");
  local printStmts :: [Stmt] 
    = map (mkSkeletonLinePrint, skeletonLines);

  forwards to 
    foldl1 (seqStmt, printStmts);

  -- The skeleton, as a list of strings.  The need to escape
  -- backslashes and double quotes obscures things a bit.
  local skeletonLines :: [ String ] =
   [ "                 .-\\\"```\\\"-.     ",
     "                /         \\\\    ",
     "                |  _   _  |    ",
     "                | (_\\\\ /_) |    ",
     "                (_   A   _)    ",
     "                 | _____ |     ",
     "                 \\\\`\\\"\\\"\\\"\\\"\\\"`/     ",
     "                  '-.-.-'      ",
     "                   _:=:_                   \\\\\\\\|  ",
     "            .-\\\"\\\"\\\"\\\"`_'='_`\\\"\\\"\\\"\\\"-.           \\\\///  ",
     "           (`,-- -`\\\\   /`- --,`)          (`/  ",
     "           / //`-_--| |--_-`\\\\\\\\ \\\\         .//  ",
     "          / /(_-_  _| |_  _-_)\\\\ \\\\       ///  ",
     "         / / (_- __ \\\\ / __ -_) \\\\ \\\\     ///  ",
     "        / /  (_ -_ - ^ - _- _)  \\\\ \\\\   ///  ",
     "       / /   (_-  _ /=\\\\ _ - _)   \\\\ \\\\ '//  ",
     "      / /     (_ -.':=:'. -_)     \\\\ \\\\//  ",
     "     (`;`     (_-'  :=:  '-_)      (_,'  ",
     "      \\\\\\\\.   jgs __  :=:  __     ",
     "       \\\\\\\\\\\\    .'  `':=:'`  '.     ",
     "        \\\\\\\\\\\\  |  .--. = .--.  |    ",
     "         \\\\\\\\\\\\ |  (  / = \\\\  )  |    ",
     "          \\\\\\\\` \\\\ _`' \\\\=/ '`_ /    ",
     "          ;`)  ( ;_/`v`\\\\_; )    ",
     "          |||\\\\ | |       | |    ",
     "          |\\\\\\\\  | |       | |    ",
     "               | |       | |    ",
     "               | |       | |    ",
     "               | |       | |    ",
     "               | |       | |    ",
     "               | |       | |    ",
     "              (._)       (_.)    ",
     "               ||,       ,||    ",
     "               ||:       :||    ",
     "               ||:       :||    ",
     "               ||:       :||    ",
     "               ||:       :||    ",
     "               ||'       '||    ",
     "              ///)       (\\\\\\\\\\\\    ",
     "            .///`         `\\\\\\\\\\\\.    ",
     "           `//`             `\\\\\\\\`    ",
     "",
     "     Courtesy of http://ascii-art.com."
   ] ;
}

function mkSkeletonLinePrint
Stmt ::= skeletonLine::String
{
  local strForPrintf :: String =
    "\"" ++ skeletonLine ++ "\\n\"" ;

  return
    exprStmt(
      directCallExpr( 
        name("printf"),
        consExpr( stringLiteral(strForPrintf),
	          nilExpr() )
      )
    ) ;
}



{-
                 .-"```"-.
                /         \
                |  _   _  |
                | (_\ /_) |
                (_   A   _)
                 | _____ |
                 \`"""""`/
                  '-.-.-'
                   _:=:_                   \\|
            .-""""`_'='_`""""-.           \///
           (`,-- -`\   /`- --,`)          (`/
           / //`-_--| |--_-`\\ \         .//
          / /(_-_  _| |_  _-_)\ \       ///
         / / (_- __ \ / __ -_) \ \     ///
        / /  (_ -_ - ^ - _- _)  \ \   ///
       / /   (_-  _ /=\ _ - _)   \ \ '//
      / /     (_ -.':=:'. -_)     \ \//
     (`;`     (_-'  :=:  '-_)      (_,'
      \\.   jgs __  :=:  __
       \\\    .'  `':=:'`  '.
        \\\  |  .--. = .--.  |
         \\\ |  (  / = \  )  |
          \\` \ _`' \=/ '`_ /
          ;`)  ( ;_/`v`\_; )
          |||\ | |       | |
          |\\  | |       | |
               | |       | |
               | |       | |
               | |       | |
               | |       | |
               | |       | |
              (._)       (_.)
               ||,       ,||
               ||:       :||
               ||:       :||
               ||:       :||
               ||:       :||
               ||'       '||
              ///)       (\\\
            .///`         `\\\.
           `//`             `\\`

     Courtesy of http://ascii-art.com.
-}

