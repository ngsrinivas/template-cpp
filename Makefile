APPS = main
CC=g++
CFLAGS= -O2 -g -Wall

# Set verbose flag `make V=1` to print each command
# that `make` executes.
ifeq ($(V),1)
	Q =
	msg =

else
	Q = @
	msg = @printf '  %-8s %s\n' \
	      "$(1)"                \
              "$(if $(2), $(2))";
endif

.PHONY: all
all: $(APPS)

.PHONY: clean
clean:
	$(call msg,CLEAN)
	$(Q)rm -rf $(APPS) $(APPS).out $(APPS).out.dSYM/

$(APPS): %: %.cc
	$(call msg,BINARY,$@)
	$(Q)$(CC) $(CFLAGS) $^ -o $@.out
