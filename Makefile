GCC_BIN=`xcrun --sdk iphoneos --find gcc`
SDK=`xcrun --sdk iphoneos --show-sdk-path`
ARCH_FLAGS=-arch armv7 -arch armv7s -arch arm64

LDFLAGS	=\
	-F$(SDK)/System/Library/Frameworks/\
	-framework CoreFoundation\
	-framework Foundation\
	-framework AudioToolbox\
	-lobjc\
	-bind_at_load

GCC_ARM = $(GCC_BIN) -Os -Wimplicit -isysroot $(SDK) $(ARCH_FLAGS)

default: main.o list
	@$(GCC_ARM) $(LDFLAGS) main.o -o vibrate
	ldid -Sentitlements.xml vibrate
	scp vibrate root@192.168.2.20:/

main.o: main.m
	$(GCC_ARM) -c main.m
list:

clean:
	rm -f vibrate *.o
