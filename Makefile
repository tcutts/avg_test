PROGS=create_data stats stats_mmap
DATA=/tmp/data.bin
RDATA=/tmp/data.Rdata

all: $(PROGS)

$(DATA): create_data
	./create_data

$(RDATA): $(DATA) create_data.R
	Rscript create_data.R

create_data: create_data.c
	$(CC) $(CFLAGS) -o $@ $<

stats: stats.c
	$(CC) $(CFLAGS) -o $@ $<

stats_mmap: stats_mmap.c
	$(CC) $(CFLAGS) -o $@ $<

test: $(DATA) $(RDATA)
	/usr/bin/time -p ./stats
	/usr/bin/time -p ./stats_mmap

clean:
	rm -f core *~ $(PROGS)
