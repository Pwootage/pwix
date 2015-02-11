PREFIX=arm-none-eabi-
CC=${PREFIX}gcc
CXX=${PREFIX}g++
OBJCOPY=${PREFIX}objcopy
AS=${PREFIX}as
ld=${PREFIX}ld
CCFLAGS=-ffreestanding -O2 -nostdlib -Iinclude
LIBS=-lgcc
BIN=bin
SRC=src

SRC_S_FILES=$(wildcard src/*.s)
SRC_C_FILES=$(wildcard src/*.c)
SRC_O_FILES=$(patsubst %.s,%.o,$(SRC_S_FILES)) $(patsubst %.c,%.o,$(SRC_C_FILES))
BIN_O_FILES=$(patsubst src/%,bin/%,$(SRC_O_FILES))

all: ${BIN} ${BIN}/raspi.bin

${BIN}:
	mkdir $@

${BIN}/%.o: ${SRC}/%.c
	${CC} ${CCFLAGS} -c -o $@ $<

${BIN}/%.o: ${SRC}/%.s
	${CC} ${CCFLAGS} -c -o $@ $<

${BIN}/raspi.elf: ${BIN_O_FILES}
	${CC} ${CCFLAGS} ${LIBS} -T src/raspi.ld -o $@ ${BIN_O_FILES}

${BIN}/raspi.bin: ${BIN}/raspi.elf
	${OBJCOPY} ${BIN}/raspi.elf -O binary ${BIN}/raspi.bin

.PHONY: clean

clean:
	rm -rf ${BIN}