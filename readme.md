# C to Rust Shared Library Migration Example

A perfect example of how to migrate a C shared library to Rust.

```bash
# install github.com/casey/just
$ just all
```

### Result

```bash
make -C ./example-clib/ &&
cargo build --manifest-path=./example_rust/Cargo.toml &&
gcc -O3 -g -o test_clib test.c -lexample -L./example-clib -I./example-clib/ &&
gcc -O3 -g -o test_rust test.c -L. -lexample -L./example_rust/target/release -I./example-clib/ &&
LD_LIBRARY_PATH=./example-clib ./test_clib &&
LD_LIBRARY_PATH=./example_rust/target/release ./test_rust &&
echo "compiling with rust, running with clib" &&
LD_LIBRARY_PATH=./example-clib ./test_rust &&
echo "compiling with clib, running with rust" &&
LD_LIBRARY_PATH=./example_rust/target/release ./test_clib

...
Hello, World! (from C)
Hello, World! (from Rust)
compiling with rust, running with clib
Hello, World! (from C)
compiling with clib, running with rust
Hello, World! (from Rust)

```
