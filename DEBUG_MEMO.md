```
make

File "parser.cmo", line 1:
Warning 31: files parser.cmo and /Users/ojisan/.opam/4.09.1/lib/ocaml/compiler-libs/ocamlcommon.cma(Parser) both define a module named Parser
File "lexer.cmo", line 1:
Warning 31: files lexer.cmo and /Users/ojisan/.opam/4.09.1/lib/ocaml/compiler-libs/ocamlcommon.cma(Lexer) both define a module named Lexer
./min-caml test/print
free variable print_int assumed as external
iteration 1000
eliminating variable Ti7.13
eliminating variable Ti6.12
eliminating variable Ti4.15
iteration 999
register allocation: may take some time (up to a few minutes, depending on the size of functions)
generating assembly...
gcc -g -O2 -Wall -m32 test/print.s libmincaml.S stub.c -lm -o test/print
ld: warning: The i386 architecture is deprecated for macOS (remove from the Xcode build setting: ARCHS)
ld: warning: ignoring file /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/lib/libSystem.tbd, missing required architecture i386 in file /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/lib/libSystem.tbd
ld: warning: ignoring file /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/lib/libm.tbd, missing required architecture i386 in file /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/lib/libm.tbd
Undefined symbols for architecture i386:
  "___stack_chk_fail", referenced from:
      _main in stub-890dc1.o
  "___stack_chk_guard", referenced from:
      _main in stub-890dc1.o
  "___stderrp", referenced from:
      _main in stub-890dc1.o
  "_atan", referenced from:
      min_caml_atan in libmincaml-19fba4.o
     (maybe you meant: min_caml_atan)
  "_cos", referenced from:
      min_caml_cos in libmincaml-19fba4.o
     (maybe you meant: min_caml_cos)
  "_fabs", referenced from:
      min_caml_abs_float in libmincaml-19fba4.o
  "_floor", referenced from:
      min_caml_floor in libmincaml-19fba4.o
     (maybe you meant: min_caml_floor)
  "_fprintf", referenced from:
      min_caml_prerr_int in libmincaml-19fba4.o
      min_caml_prerr_float in libmincaml-19fba4.o
      _main in stub-890dc1.o
  "_fputc", referenced from:
      min_caml_prerr_byte in libmincaml-19fba4.o
  "_fwrite$UNIX2003", referenced from:
      _main in stub-890dc1.o
  "_malloc", referenced from:
      _main in stub-890dc1.o
  "_printf", referenced from:
      min_caml_print_int in libmincaml-19fba4.o
  "_putchar", referenced from:
      min_caml_print_newline in libmincaml-19fba4.o
      min_caml_print_byte in libmincaml-19fba4.o
  "_scanf", referenced from:
      min_caml_read_int in libmincaml-19fba4.o
      min_caml_read_float in libmincaml-19fba4.o
  "_sin", referenced from:
      min_caml_sin in libmincaml-19fba4.o
     (maybe you meant: min_caml_sin)
ld: symbol(s) not found for architecture i386
clang: error: linker command failed with exit code 1 (use -v to see invocation)
make: *** [test/print] Error 1
```

Dockerから実行する

https://qiita.com/takaya030/items/cb1a75dda86643d35224


```sh
docker pull i386/centos:6
docker run -it --rm i386/centos:6 /bin/bash
```

```
[root@09c4393e474a /]# sed -i 's/$basearch/i386/g' /etc/yum.repos.d/CentOS-*.repo
[root@09c4393e474a /]# yum install git ocaml

git clone https://github.com/sadnessOjisan/min-caml.git

cd min-caml/

./to_x86

make

./min-caml test/adder

[root@09c4393e474a min-caml]# min-caml test/adder
adder      adder.ans  adder.cmp  adder.ml   adder.res  adder.s 

[root@09c4393e474a min-caml]# less test/adder.res
10
```