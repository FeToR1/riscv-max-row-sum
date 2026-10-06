FROM ubuntu:24.04
RUN apt-get update && apt-get install -y --no-install-recommends curl ca-certificates
RUN curl -fsSL https://github.com/xpack-dev-tools/riscv-none-elf-gcc-xpack/releases/download/v15.2.0-1/xpack-riscv-none-elf-gcc-15.2.0-1-linux-x64.tar.gz | tar -xz -C /opt --strip-components=1
ENV PATH="/opt/bin:${PATH}"
WORKDIR /work
CMD ["sh", "build.sh"]
