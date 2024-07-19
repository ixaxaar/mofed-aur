all:
	makepkg -s

install:
	makepkg -si

srcinfo:
	makepkg --printsrcinfo > .SRCINFO

uninstall:
	sudo pacman -Rd mlnx-xpmem

clean:
	rm -rf *.zst xpmem-* src pkg
