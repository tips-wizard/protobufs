PROTO_SRC="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
PROTO_OUT=$PROTO_SRC/build

# Create output dir if it doesn't exist.
[ ! -d $PROTO_OUT ] && mkdir $PROTO_OUT

ORDER=('general.proto' 'extraction.proto' 'auth.proto' 'broadcast.proto')

# TO-DO: Let user input what language they're building the protobuf for. Currently only supports Go.

for file in ${ORDER[@]}; do
    protoc --proto_path=$PROTO_SRC --go_out=$PROTO_OUT --go-grpc_out=$PROTO_OUT $PROTO_SRC/$file
done