COMPILPER = avr-gcc
MACH = atmega328p
COMPILPEROPTION = -mmcu=$(MACH)   -nostdlib -T link.ld  -Os
UPLOADER= "C:\Program Files (x86)\Arduino\hardware\tools\avr\bin\avrdude"
CONFIG = "C:\Program Files (x86)\Arduino\hardware\tools\avr\etc\avrdude.conf"
PORT= COM8
BAUD = 19200


%.elf : %.s
	$(COMPILPER) $(COMPILPEROPTION) $^ -o $@  -Wl,-Map=$@.map
	avr-objdump -h -S $@ > $^.obj

read: read
	$(UPLOADER) -C $(CONFIG) -p$(MACH) -v -b$(BAUD) -P$(PORT) -cstk500v1 -U/-flash:r:$@.bin


erase: 
	$(UPLOADER) -C $(CONFIG) -p$(MACH) -v -b$(BAUD) -P$(PORT) -cstk500v1 -e

%.hex: %.elf
	avr-objcopy -O ihex  $^ $@

%.upload:  %.hex
	$(UPLOADER) -C $(CONFIG) -p$(MACH) -v -b$(BAUD) -P$(PORT) -cstk500v1 -Uflash:w:$^:i
dump:
	avr-objdump  main.elf -h -S


clean:
	rm *.o *.elf *.bin *.exe *.obj *.map *.hex