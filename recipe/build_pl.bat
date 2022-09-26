rmdir /Q /S build
mkdir build
cd build

if /I "%PKG_NAME%" == "powerloader" (
    cmake .. ^
        %CMAKE_ARGS% ^
            -GNinja ^
            -DCMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% ^
            -DCMAKE_PREFIX_PATH=%PREFIX% ^
            -DBUILD_SHARED=ON ^
            -DENABLE_TESTS=OFF ^
            -DENABLE_PYTHON=OFF
)
if /I "%PKG_NAME%" == "powerloader-static" (
    cmake .. ^
        %CMAKE_ARGS% ^
            -GNinja ^
            -DCMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% ^
            -DCMAKE_PREFIX_PATH=%PREFIX% ^
            -DBUILD_STATIC=ON ^
            -DENABLE_TESTS=OFF ^
            -DENABLE_PYTHON=OFF
)
if errorlevel 1 exit 1

ninja
if errorlevel 1 exit 1

ninja install
if errorlevel 1 exit 1
