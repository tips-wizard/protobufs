## Building types
In order to generate protobuf types you can use the commands listed in this section.

Make sure you set the `OUT_DIR` environment variable.

The examples also use an `example.proto` as the target file. Make sure you replace that name with the actual protobuf you wish to build.

### Go
```
protoc --proto_path=$OUT_DIR --go_out=plugins=grpc:proto /protobufs/example.proto
```

### Typescript
```
protoc -I=. /protobufs/example.proto \
--js_out=import_style=commonjs,binary:$OUT_DIR \
--grpc-web_out=import_style=typescript,mode=grpcwebtext:$OUT_DIR
```