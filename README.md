## Building types
In order to generate protobuf types you can use the commands listed in this section.

The devcontainers already have the `PROTO_SRC` environment variable setup, it points to the directory that hosts the `.proto` files. They also have a `WORKSPACE_FOLDER` environment variable which stores the project's root path in the container.

The examples also use an `example.proto` as the target file. Make sure you replace that name with the actual protobuf you wish to build. Note that you can add multiple protobuf filenames.

### Go
You'll need `protoc-gen-go` installed for building Go types. Go devcontainers in this project should already have that included. 

```
go install google.golang.org/protobuf/cmd/protoc-gen-go@v1.26 \
&& go install google.golang.org/grpc/cmd/protoc-gen-go-grpc@v1.1`
```

Now, to generate the protobufs:

```
protoc --proto_path=$PROTO_SRC --go_out=$PROTO_SRC/build --go-grpc_out=$PROTO_SRC/build $PROTO_SRC/example.proto
```

### Typescript
Make sure you have `protoc-gen-grpc-web` installed globally via npm: `npm install -g protoc-gen-grpc-web`


Finally, to build:
```
protoc \
-I=$PROTO_SRC \
--js_out=import_style=commonjs,binary:$PROTO_SRC/build \
--grpc-web_out=import_style=typescript,mode=grpcwebtext:$PROTO_SRC/build \
example.proto
```

Obs: It's likely you'll have to install some dependencies, such as `google-protobuf`. By default, the generated code disables es-lint errors, meaning you'll only find out when you run the app.