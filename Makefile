OUTPUTDIR := $(CURDIR)/output
ROOTFS:=${OUTPUTDIR}/rootfs.ext4
FULLIMG:=${OUTPUTDIR}/full.img

IMAGES:=$(ROOTFS) $(FULLIMG)

all: extra $(IMAGES)

clean:
	rm -f -- $(IMAGES)

extra:
	mkdir -- extra

$(IMAGES):
	OUTPUTDIR=$(OUTPUTDIR) genimage --config image-one.cfg --output $(OUTPUTDIR)
	ls -l $(ROOTFS) $(FULLIMG)
