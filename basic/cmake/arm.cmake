# 设置目标系统
set(CMAKE_SYSTEM_NAME Linux)
set(CMAKE_SYSTEM_VERSION 1)
set(CMAKE_SYSTEM_PROCESSOR arm)

# 设置编译链 可设置工具链路径 -DTOOLCHAIN_DIR=/opt/toolchain/gcc-arm-none-linux-4.8.3
if (DEFINED TOOLCHAIN_DIR)
    set(TOOLCHAIN_INCLUDE ${TOOLCHAIN_DIR}/arm-none-linux-gnueabi/include)
    set(TOOLCHAIN_LIB ${TOOLCHAIN_DIR}/arm-none-linux-gnueabi/lib)
    set(TOOLCHAIN_BIN ${TOOLCHAIN_DIR}/bin)

     # specify cross compilers and tools
    set(CMAKE_C_COMPILER_WORKS 1)
    set(CMAKE_CXX_COMPILER_WORKS 1)
    set(CMAKE_C_COMPILER ${TOOLCHAIN_BIN}/arm-linux-gcc)
    set(CMAKE_CXX_COMPILER ${TOOLCHAIN_BIN}/arm-linux-g++)
    set(CMAKE_ASM_COMPILER  ${TOOLCHAIN_BIN}/arm-linux-gcc)
    set(CMAKE_AR ${TOOLCHAIN_BIN}/arm-linux-ar)
    set(CMAKE_OBJCOPY ${TOOLCHAIN_BIN}/arm-linux-objcopy)
    set(CMAKE_OBJDUMP ${TOOLCHAIN_BIN}/arm-linux-objdump)
    set(SIZE ${TOOLCHAIN_BIN}/arm-linux-size)

    # 设置相关文件夹查找主路径
    set(CMAKE_FIND_ROOT_PATH ${TOOLCHAIN_DIR}/arm-none-linux-gnueabi)
    include_directories(${TOOLCHAIN_INCLUDE})
    set(CMAKE_INCLUDE_PATH ${TOOLCHAIN_INCLUDE})
    set(CMAKE_LIBRARY_PATH ${TOOLCHAIN_LIB})
else ()
    # specify cross compilers and tools
    set(CMAKE_C_COMPILER_WORKS 1)
    set(CMAKE_CXX_COMPILER_WORKS 1)
    set(CMAKE_C_COMPILER arm-linux-gcc)
    set(CMAKE_CXX_COMPILER arm-linux-g++)
    set(CMAKE_ASM_COMPILER arm-linux-gcc)
    set(CMAKE_AR arm-linux-ar)
    set(CMAKE_OBJCOPY arm-linux-objcopy)
    set(CMAKE_OBJDUMP arm-linux-objdump)
    set(SIZE arm-linux-size)
endif ()

# 不在指定目录下查找依赖包 NEVER,ONLY,BOTH
set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
# 只在指定目录下查找库文件
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
# 只在指定目录下查找头文件
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)