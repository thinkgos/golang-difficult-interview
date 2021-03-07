#设置目标系统
set(CMAKE_SYSTEM_NAME Generic)
set(CMAKE_SYSTEM_VERSION 1)
set(CMAKE_SYSTEM_PROCESSOR cortex-m3)

# 设置编译链 可设置工具链路径 -DTOOLCHAIN_DIR=/opt/toolchain/gcc-arm-none-eabi-8-2019q3
if (DEFINED TOOLCHAIN_DIR)
    set(TOOLCHAIN_INCLUDE ${TOOLCHAIN_DIR}/arm-none-eabi/include)
    set(TOOLCHAIN_LIB ${TOOLCHAIN_DIR}/arm-none-eabi/lib)
    set(TOOLCHAIN_BIN ${TOOLCHAIN_DIR}/bin)

    # specify cross compilers and tools
    set(CMAKE_C_COMPILER_WORKS 1)
    set(CMAKE_CXX_COMPILER_WORKS 1)
    set(CMAKE_C_COMPILER ${TOOLCHAIN_BIN}/arm-none-eabi-gcc)
    set(CMAKE_CXX_COMPILER ${TOOLCHAIN_BIN}/arm-none-eabi-g++)
    set(CMAKE_ASM_COMPILER ${TOOLCHAIN_BIN}/arm-none-eabi-gcc)
    set(CMAKE_AR ${TOOLCHAIN_BIN}/arm-none-eabi-ar)
    set(CMAKE_OBJCOPY ${TOOLCHAIN_BIN}/arm-none-eabi-objcopy)
    set(CMAKE_OBJDUMP ${TOOLCHAIN_BIN}/arm-none-eabi-objdump)
    set(SIZE ${TOOLCHAIN_BIN}/arm-none-eabi-size)

    include_directories(${TOOLCHAIN_INCLUDE})
else ()
    # specify cross compilers and tools
    set(CMAKE_C_COMPILER_WORKS 1)
    set(CMAKE_CXX_COMPILER_WORKS 1)
    set(CMAKE_C_COMPILER arm-none-eabi-gcc)
    set(CMAKE_CXX_COMPILER arm-none-eabi-g++)
    set(CMAKE_ASM_COMPILER arm-none-eabi-gcc)
    set(CMAKE_AR arm-none-eabi-ar)
    set(CMAKE_OBJCOPY arm-none-eabi-objcopy)
    set(CMAKE_OBJDUMP arm-none-eabi-objdump)
    set(SIZE arm-none-eabi-size)
endif ()

#Uncomment for hardware floating point
set(FPU_FLAGS "-mfloat-abi=hard -mfpu=fpv4-sp-d16")
add_definitions(-DARM_MATH_CM4 -DARM_MATH_MATRIX_CHECK -DARM_MATH_ROUNDING -D__FPU_PRESENT=1)

# 通用flags
set(COMMON_FLAGS
        "-mcpu=cortex-m3 ${FPU_FLAGS} -mthumb -mthumb-interwork -ffunction-sections -fdata-sections \
    -g -fno-common -fmessage-length=0 -specs=nosys.specs -specs=nano.specs")

set(CMAKE_CXX_FLAGS_INIT "${COMMON_FLAGS} -std=c++11")
set(CMAKE_C_FLAGS_INIT "${COMMON_FLAGS} -std=gnu99")
set(CMAKE_EXE_LINKER_FLAGS_INIT "-Wl,-gc-sections,--print-memory-usage -T")
set(BUILD_SHARED_LIBS OFF)

add_definitions(
        -D__weak=__attribute__\(\(weak\)\)
        -D__packed=__attribute__\(\(__packed__\)\))