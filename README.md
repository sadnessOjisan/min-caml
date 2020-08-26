

# min-caml

* [オリジナルのREADME](README_ORIGINAL.md)
* [MacOSで動かすための試行錯誤](./DEBUG_MEMO.md)


```sh
docker build -t mincaml-builder .

docker run --rm -v $PWD:/min-caml -w /min-caml mincaml-builder make
```

