PKDIR=/common/tex/fonts/pk/CanonCX/bmg/bmgrer
TFMDIR=/common/tex/fonts/tfm/bmg/bmgrer
SRCDIR=/common/tex/fonts/source/bmg/bmgrer
MACRODIR=/common/tex/tex/latex/bmg/

TEXSRCS= bmgrer.sty bmgrer.fd
MFSRCS= bmgrer5.mf bmgrer6.mf bmgrer7.mf bmgrer8.mf bmgrer9.mf bmgrer10.mf\
	bmgrer12.mf bmgsetsym.mf
SRCS=$(MFSRCS) $(TEXSRCS)
SIZES= 5 6 7 8 9 10 12

fonts:
	for i in $(SIZES); do\
		virmf "\mode=CanonCX; mag=1; input bmgrer$$i";\
		gftopk bmgrer$$i.300gf;\
	done

tar:
	tar zcvf bmgrer.tar.gz $(SRCS) Makefile

install:
	cp bmgrer*.300pk $(PKDIR)
	cp bmgrer*.tfm $(TFMDIR)
	cp $(MFSRCS) $(SRCDIR)
	cp $(TEXSRCS) $(MACRODIR)

clean:
	/bin/rm -f *.log *.*pk *.*gf *.tfm *.ps *.dvi
