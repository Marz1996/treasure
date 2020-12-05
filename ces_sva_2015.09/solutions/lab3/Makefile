# Makefile for SVA Lab3
RTL= ../../rtl/router.v
SVTB = ./router_test_top.sv ./router_io.sv ./assert.sva ./assert_binds.sva ./test.sv
seed = 1
BROWSER = firefox
override options += -suppress=FLWSA

default: test 

test: clean compile run

run:
	./simv -l simv.log +ntb_random_seed=$(seed) -cm assert

compile:
	vcs -l comp.log -sverilog -debug_access+all $(SVTB) $(RTL) -assert dve -assert enable_diag -cm assert $(options)

compile_no_assert:
	vcs -l comp.log -sverilog -debug_access+all $(SVTB) $(RTL) $(options)

copy: 
	cp ../../solutions/lab2/*.sv .
	cp ../../solutions/lab2/*.sva .
	rm assert.sva
	cp ../../solutions/lab3/.original/assert.sva .
	cp ../../solutions/lab3/files .
	

my_copy:
	cp ../lab2/*.sv .
	cp ../lab2/*.sva .
	cp ../../solutions/lab3/files .

urg:
	urg -dir simv.vdb
	urg -dir simv.vdb -format text
	$(BROWSER) $(PWD)/urgReport/asserts.html &

coverage:
	$(BROWSER) $(PWD)/urgReport/asserts.html &

dve:
	dve -vpd vcdplus.vpd &

verdi:
	verdi -sverilog $(SVTB) $(RTL) -ssf novas.fsdb -undockWin -workMode assertionDebug & 

verdi_debug:
	./simv -l simv.log -gui=verdi +ntb_random_seed=$(seed)

debug:
	./simv -l simv.log -gui -tbug +ntb_random_seed=$(seed)

solution: clean
	cp ../../solutions/lab3/*.sv .
	cp ../../solutions/lab3/*.sva .
	cp ../../solutions/lab3/files .

clean:
	rm -rf simv* csrc* *.tmp *.vpd *.key *.log urg* novas.* *Log

nuke: clean
	rm -rf *.v* include *.sv *.sva files .*.lock *.old .*.old DVE* *.tcl urg* *.h novas.* *Log

help:
	@echo ===========================================================================
	@echo  " 								        "
	@echo  " USAGE: make target <seed=xxx>                                          "
	@echo  " 								        "
	@echo  " ------------------------- Test TARGETS --------------------------------"
	@echo  " test       => Compiles TB and GOOD DUT files, runs the simulation.     "
	@echo  " bad        => Compiles TB and BAD DUT files, runs the simulation.      "
	@echo  " compile    => Compiles the TB and DUT.                                 "
	@echo  " run        => Runs the simulation.                                     "
	@echo  " dve        => Runs dve in post-processing mode                         "
	@echo  " debug      => Runs simulation interactively with dve                   "
	@echo  " verdi      => Runs Verdi3 in post-processing mode                      "
	@echo  " verdi_debug => Runs simulation interactively with Verdi3               "
	@echo  " clean      => Removes all intermediate simv and log files.             "
	@echo  "                                                                        "
	@echo  " -------------------- ADMINISTRATIVE TARGETS ---------------------------"
	@echo  " help       => Displays this message.                                   "
	@echo  " solution   => Copies final lab solution files from solutions directory "
	@echo  " nuke       => Erases all user and generated files                      "
	@echo  " copy       => Copy files required to restart lab. Usually after a nuke "
	@echo  "				     			                "
	@echo ===========================================================================

