CC := gcc
TARGET := hello

OBJSDIR = ./build

CSRCS:= hello.c
OBJS := $(patsubst %.c, $(OBJSDIR)/%.o, $(CSRCS))

all: pre-build main-build
main-build: ${TARGET}

${TARGET}: $(OBJS)
	@echo " [CC]  $<"
	$(CC) -o $@ $<

$(OBJSDIR)/%.o: %.c
	@echo " [CC]  $@"
	$(CC) -c $< -o $@

pre-build: 
	@mkdir -p $(OBJSDIR)  

clean:
	rm -rf ${OBJS} ${TARGET} $(OBJSDIR)
.PHONY: all, clean