rm -rf build
mkdir build
cd build

export CXXFLAGS="${CXXFLAGS} -D_LIBCPP_DISABLE_AVAILABILITY=1"

if [[ $PKG_NAME == "powerloader" ]]; then
    cmake .. ${CMAKE_ARGS}              \
        -GNinja                         \
        -DCMAKE_INSTALL_PREFIX=$PREFIX  \
        -DCMAKE_PREFIX_PATH=$PREFIX     \
        -DBUILD_SHARED=ON               \
        -DENABLE_TESTS=OFF              \
        -DENABLE_PYTHON=OFF
elif [[ $PKG_NAME == "powerloader-static" ]]; then
    cmake .. ${CMAKE_ARGS}              \
        -GNinja                         \
        -DCMAKE_INSTALL_PREFIX=$PREFIX  \
        -DCMAKE_PREFIX_PATH=$PREFIX     \
        -DBUILD_STATIC=ON               \
        -DENABLE_TESTS=OFF              \
        -DENABLE_PYTHON=OFF
fi

ninja

ninja install
