## Building types
In order to generate protobuf types you can use the commands listed in this section.

The devcontainers already have the `PROTO_SRC` environment variable setup, it points to the directory that hosts the `.proto` files. They also have a `WORKSPACE_FOLDER` environment variable which stores the project's root path in the container.

The examples also use an `example.proto` as the target file. Make sure you replace that name with the actual protobuf you wish to build.

### Go
```
protoc --proto_path=$PROTO_SRC --go_out=$WORKSPACE_FOLDER/protobufs $PROTO_SRC/example.proto
```

### Typescript
```
PROTO_OUT=$WORKSPACE_FOLDER/src/protobufs \
&& protoc -I=$PROTO_SRC $PROTO_SRC/example.proto \
--js_out=import_style=commonjs,binary:$PROTO_OUT \
--grpc-web_out=import_style=typescript,mode=grpcwebtext:$PROTO_OUT
```