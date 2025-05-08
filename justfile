all: build run run-switch

build: build-c build-rust build-test-c build-test-rust

build-c:
    make -C ./example-clib/

build-rust:
    cargo build --manifest-path=./example_rust/Cargo.toml

build-test-rust:
    gcc -O3 -g -o test_rust test.c -L. -lexample -L./example_rust/target/release -I./example-clib/

build-test-c:
    gcc -O3 -g -o test_clib test.c -lexample -L./example-clib -I./example-clib/

run: run-c run-rust

run-rust:
    LD_LIBRARY_PATH=./example_rust/target/release ./test_rust

run-c:
    LD_LIBRARY_PATH=./example-clib ./test_clib

run-switch: run-c-switch run-rust-switch

run-rust-switch:
    echo "compiling with clib, running with rust"
    LD_LIBRARY_PATH=./example_rust/target/release ./test_clib

run-c-switch:
    echo "compiling with rust, running with clib"
    LD_LIBRARY_PATH=./example-clib ./test_rust
