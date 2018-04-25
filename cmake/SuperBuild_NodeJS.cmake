include (ExternalProject)

set (NODEJS_URL https://nodejs.org/dist/v8.11.1/node-v8.11.1-linux-x64.tar.gz)
set (NODEJS_URL_HASH 0e20787e2eda4cc31336d8327556ebc7417e8ee0a6ba0de96a09b0ec2b841f60)

if (APPLE)
    set (NODEJS_URL https://nodejs.org/dist/v8.11.1/node-v8.11.1-darwin-x64.tar.gz)
    set (NODEJS_URL_HASH 5c7b05899ff56910a2b8180f139d48612f349ac2c5d20f08dbbeffbed9e3a089)
endif()

set (NODE_ROOT_DIR ${CMAKE_BINARY_DIR}/nodejs)
set (NODE_BIN_DIR ${NODE_ROOT_DIR}/bin)
set (NODE_EXECUTABLE ${NODE_BIN_DIR}/node CACHE string "NodeJS executable path")

ExternalProject_Add (nodejs
    SOURCE_DIR ${NODE_ROOT_DIR}
    URL ${NODEJS_URL}
    URL_HASH SHA256=${NODEJS_URL_HASH}
    CONFIGURE_COMMAND "" 
    BUILD_COMMAND ""
    INSTALL_COMMAND ""
)

ExternalProject_Add_Step(nodejs INSTALL_NODE_MODULES
    WORKING_DIRECTORY ${NODE_BIN_DIR}
    COMMENT "Installing required node modules"
    COMMAND ${NODE_EXECUTABLE} ./npm i -g yarn mocha gulp@next pm2 typescript nexe
    LOG TRUE
    DEPENDEES install
)
