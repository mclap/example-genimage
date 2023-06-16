OUTPUTDIR:=`pwd`/output
ROOTFS=$(OUTPUTDIR)/rootfs.ext4
FULLIMG=$(OUTPUTDIR)/full.img

IMAGES:=$(ROOTFS) $(FULLIMG)

all: extra $(IMAGES)

clean:
	rm -f -- $(IMAGES)

extra:
	mkdir -- extra

$(ROOTFS): extra
	genimage --config image-root.cfg --output $(OUTPUTDIR)
	ls -l $(ROOTFS)

$(FULLIMG): $(ROOTFS)
	OUTPUTDIR=$(OUTPUTDIR) genimage --config image-full.cfg --output $(OUTPUTDIR)
	ls -l $(FULLIMG)
