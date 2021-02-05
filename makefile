LDFLAGS :=
GCC_FLAGS := 
OUT_DIR :=
OBJS :=
CFLAGS := 

SRC_DIR := ./src
INCLUDE_DIR := -I$(SRC_DIR)
TARGET := test
OBJSDIR = ./build
CSRCS:= test.c
OBJS += $(patsubst %.c, $(OBJSDIR)/%.o, $(CSRCS))

CC := gcc

include $(SRC_DIR)/src.mk

all: pre-build main-build
main-build: ${TARGET}

${TARGET}: $(OBJS)
	@echo "Building target: $@"
	$(CC) -o $@ $(OBJS)
	@echo ' '

$(OBJSDIR)/%.o: %.c
	@echo "Building target: $@" 
	$(CC) -c $< -o $@ $(INCLUDE_DIR)
	@echo ' '

pre-build: 
	# @mkdir -p $(OBJSDIR)  
	@mkdir -p $(foreach s, $(OUT_DIR), $(OBJSDIR)$(s))
	@echo ' '
clean:
	rm -rf ${OBJS} $(OBJSDIR) ${TARGET}

run: $(TARGET)
	./$(TARGET)
	@echo ' '

rebuild:
	+@make clean
	+@make
	+@make run
	
.PHONY: all, clean, run, rebuild
.SECONDARY: main-build