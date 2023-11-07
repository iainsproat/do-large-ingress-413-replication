FROM alpine
# Create a layer with over 2Gb of random data
RUN dd if=/dev/urandom of=/largelayer bs=1M count=2000
