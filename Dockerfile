FROM gcc:9.2 as build
WORKDIR /build
ADD cpuload.cc /build
RUN g++ -static cpuload.cc -o cpuload

FROM scratch as run
WORKDIR /bin
COPY --from=build /build/cpuload .
CMD ["cpuload"]
