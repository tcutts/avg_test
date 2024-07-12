PROGS=create_data stats stats_mmap
DATA=/tmp/data.bin
RDATA=/tmp/data.Rdata

all: .venv $(PROGS)

.venv: requirements.txt
	rm -rf .venv
	python3 -m venv .venv
	pip3 install -r requirements.txt

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

test: .venv $(DATA) $(RDATA)
	./runtests.sh

clean:
	rm -f core *~ $(PROGS)
