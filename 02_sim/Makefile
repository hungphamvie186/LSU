filelist=-f ../00_src/flist.f
time_unit=-timescale=1ps/1ps
acc_debug=-debug_access+all

PHONY: sim
sim: 
	vcs -sverilog \
	$(acc_debug) \
	$(time_unit) \
	$(filelist) 
	./simv
PHONY: verdi
verdi: 
	verdi -sverilog \
	$(filelist) \
	design_test.fsdb &
