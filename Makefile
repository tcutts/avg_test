PROGS=create_data stats stats_mmap

all: $(PROGS)

create_data: create_data.c
	$(CC) $(CFLAGS) -o $@ $<

stats: stats.c
	$(CC) $(CFLAGS) -o $@ $<

stats_mmap: stats_mmap.c
	$(CC) $(CFLAGS) -o $@ $<

test: all
	./create_data
	/usr/bin/time -p R CMD BATCH create_data.R
	/usr/bin/time -p ./stats
	/usr/bin/time -p ./stats_mmap

clean:
	rm -f core *~ $(PROGS)
