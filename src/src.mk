OUT_DIR += /src

OBJS += \
$(OBJSDIR)/src/sum.o 

$(OBJSDIR)/src/%.o: src/%.c
	@echo 'Building file: $<'
	$(CC) -c $< -o $@
	@echo ' '

