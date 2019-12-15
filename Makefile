#!/usr/bin/make

SCADC=/usr/bin/openscad
MKDIR=mkdir -p
OUTDIR=stl

all:	stubs skin buttons directories
stubs: \
	stl/stubs/decoration_side.stl \
	stl/stubs/decoration_top_btm.stl \
	stl/stubs/inner_cutout.stl \
	stl/stubs/outer_cutout.stl
buttons: \
	stl/buttons/big_button.stl \
	stl/buttons/small_button.stl
skin: \
	stl/skin.stl


stl/stubs/%.stl: stubs/%.scad 
	$(SCADC) -o $@ $<

stl/buttons/%.stl: buttons/%.scad 
	$(SCADC) -o $@ $<

stl/%.stl: %.scad 
	$(SCADC) -o $@ $<



directories:
	$(MKDIR) $(OUTDIR)/buttons $(OUTDIR)/stubs

clean:
	rm -Rf stl/*

.PHONY : clean directories
.DEFAULT : all
