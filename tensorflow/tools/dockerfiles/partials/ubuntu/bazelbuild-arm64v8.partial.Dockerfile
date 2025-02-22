RUN apt-get update && apt-get install -y \
    build-essential \
    curl \
    git \
    openjdk-8-jdk \
    python3-dev \
    virtualenv \
    swig

RUN apt-get update && apt-get install -y \
    gfortran \
    libblas-dev \
    liblapack-dev

RUN python3 -m pip --no-cache-dir install \
    Pillow \
    keras_preprocessing \
    tb-nightly \
    h5py \
    matplotlib \
    mock \
    'numpy<1.19.0' \
    scipy \
    sklearn \
    pandas \
    portpicker \
    enum34

# Build and install bazel
ENV BAZEL_VERSION 4.2.2
WORKDIR /
RUN mkdir /bazel && \
    cd /bazel && \
    curl -fSsL -O https://github.com/bazelbuild/bazel/releases/download/$BAZEL_VERSION/bazel-$BAZEL_VERSION-dist.zip && \
    unzip bazel-$BAZEL_VERSION-dist.zip && \
    bash ./compile.sh && \
    cp output/bazel /usr/local/bin/ && \
    rm -rf /bazel && \
    cd -
