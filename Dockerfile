FROM ekidd/rust-musl-builder:latest

ADD extra-cargo-conf /

RUN sudo apt-get update && sudo apt-get install -y \
	gcc-mingw-w64 && \
	sudo apt-get clean && sudo rm -rf /var/lib/apt/lists/* && \
	rustup target add x86_64-pc-windows-gnu && \
	sudo bash -c 'cat /extra-cargo-conf >> ~/.cargo/config && rm /extra-cargo-conf'

