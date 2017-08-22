Rsvg-2.0.gir: Rsvg_2_0_gir_list 
	@-echo Generating $@...
	$(PYTHON) $(G_IR_SCANNER)	\
	--verbose -no-libtool	\
	--namespace=Rsvg	\
	--nsversion=2.0	\
	--pkg=pango --pkg=libxml-2.0	\
	--library=rsvg-2.0	\
		\
	--add-include-path=$(G_IR_INCLUDEDIR)	\
	--include=GLib-2.0 --include=GObject-2.0 --include=Gio-2.0 --include=cairo-1.0 --include=GdkPixbuf-2.0	\
	--pkg-export=librsvg-2.0	\
	--cflags-begin	\
	-I../.. -DRSVG_COMPILATION	\
	--cflags-end	\
	--c-include=librsvg/rsvg.h	\
	--filelist=Rsvg_2_0_gir_list	\
	-o $@

Rsvg-2.0.typelib: Rsvg-2.0.gir
	@-echo Compiling $@...
	$(G_IR_COMPILER)	\
	--includedir=. --debug --verbose	\
	Rsvg-2.0.gir	\
	-o $@

