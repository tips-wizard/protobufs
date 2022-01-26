## Building types
In order to generate protobuf types you can use the commands listed in this section. These presume you're using the devcontainers, i.e. the protobufs folder is at `/protobufs`.

The `OUT_DIR` makes it so the protobufs will be executed from the folder you're calling this from.

The examples also use an `example.proto` as the target file. Make sure you replace that name with the actual protobuf you wish to build.

### Go
```
OUT_DIR=. && \
protoc --proto_path=$OUT_DIR --go_out=plugins=grpc:proto /protobufs/example.proto
```

### Typescript
```
OUT_DIR=. && \
protoc -I=. /protobufs/example.proto \
--js_out=import_style=commonjs,binary:$OUT_DIR \
--grpc-web_out=import_style=typescript,mode=grpcwebtext:$OUT_DIR
```