CFLAGS=-Wall -Wextra -O2 -g
OBJS=common.o binsort.o patch-forward.o patch-backward.o \
	identify.o tardiff.o tarpatch.o tardiffmerge.o tardiffinfo.o main.o
LDLIBS=-lcrypto -lz

BINDIR = $(DESTDIR)$(PREFIX)/bin
NAME = tardiff

all: tardiff

tardiff: $(OBJS)
	$(CC) $(LDFLAGS) -o $(NAME) $(OBJS) $(LDLIBS)

install: all
	install -s $(NAME) $(BINDIR)/
	ln -sf $(NAME) $(BINDIR)/tarpatch
	ln -sf $(NAME) $(BINDIR)/tardiffmerge
	ln -sf $(NAME) $(BINDIR)/tardiffinfo

uninstall:
	rm -f $(BINDIR)/tardiff
	rm -f $(BINDIR)/tarpatch
	rm -f $(BINDIR)/tardiffmerge
	rm -f $(BINDIR)/tardiffinfo

clean:
	rm -f *.o

distclean: clean
	rm -f $(NAME)

.PHONY: all clean distclean install uninstall
