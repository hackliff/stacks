#! /bin/sh

readonly PROTOC_PATH=${PROTOC_PATH:-"./_protoc"}
readonly PROTOC_RELEASES="https://github.com/google/protobuf/releases"
readonly PROTOC_NODE_PLUGIN=./node_modules/.bin/grpc_tools_node_protoc_plugin

readonly PROTOS_PATH="./protos"
readonly PROTOS_DEST="./generated"

install_protoc() {
  local protoc_version=${1:-"3.0.0"}
  # TODO http://stackoverflow.com/questions/394230/detect-the-os-from-a-bash-script
  #local platform="osx-$(uname -m)"
  local platform="osx-$(uname -m)"
  local pkg="protoc-${protoc_version}-${platform}.zip"

  test -d ${PROTOC_PATH} || mkdir -p ${PROTOC_PATH}

  curl \
    -Lk \
    "${PROTOC_RELEASES}/download/v${protoc_version}/${pkg}" \
    | tar -xf - -C ${PROTOC_PATH}
}

install_go_deps() {
  go get golang.org/x/net/context
  go get google.golang.org/grpc
  go get -u github.com/golang/protobuf/{proto,protoc-gen-go}
}

install_python_deps() {
  pip install grpcio grpcio-tools
}

install_node_deps() {
  npm install
}

gen_go_stubs() {
  local lib="$1"
  local proto_src="${PROTOS_PATH}/${lib}.proto"

  test -d ${PROTOS_DEST}/${lib} || mkdir -p ${PROTOS_DEST}/${lib}
  protoc \
    -I./${PROTOS_PATH}/ \
    --go_out=plugins=grpc:${PROTOS_DEST}/${lib} \
    ${proto_src}
}

gen_py_stubs() {
  local lib="$1"
  local proto_src="${PROTOS_PATH}/${lib}.proto"

	python -m grpc.tools.protoc \
	  -I${PROTOS_PATH} \
	  --python_out=${PROTOS_DEST} \
	  --grpc_python_out=${PROTOS_DEST} \
	  ${proto_src}
}

gen_node_stubs() {
  local lib="$1"
  local proto_src="./${lib}.proto"

  cd ${PROTOS_PATH}
	protoc \
	  --js_out=import_style=commonjs,binary:../${PROTOS_DEST} \
	  --grpc_out=../${PROTOS_DEST} \
	  --plugin=protoc-gen-grpc=../${PROTOC_NODE_PLUGIN} \
	  ${proto_src}
}

bootstrap_grpc() {
  command -v protoc || install_protoc
  install_go_deps
  install_python_deps
  install_node_deps
}

main() {
  local target="$1"
  local proto_lib="$2"

  if [[ "${target}" == "grpc" ]]; then
    bootstrap_grpc
  elif [[ "${target}" == "protos" ]]; then
    test -d ${PROTOS_DEST} || mkdir -p ${PROTOS_DEST}
    gen_go_stubs ${proto_lib}
    gen_py_stubs ${proto_lib}
    gen_node_stubs ${proto_lib}
  else
    echo "unknown target: ${target}"
  fi
}

main $@
