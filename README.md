# sbtools

Helpers for generating signed Arch Linux kernels for Secure Boot.
And pacman hook for auto-generation.

## Installation

Use `mkkeys` to generate your own Secure Boot keys in the current directory.
Use `make-boot-img` to combine the kernel intiramfs and boot args into a single
efi binary (see `make-boot-img -h` for help).
Use `sign-binary` to sign a binary using your keys (see `sign-binary -h` for
help).

[See How to install the efi keys.](http://www.rodsbooks.com/efi-bootloaders/controlling-sb.html#secureone)

## Configuration

For the pacman hook to work the Secure Boot keys should be stored in /etc/efi-keys
and the configuration file /etc/boot-img.conf should be updtated accordingly to
your setup.
For each kernel `/boot/vmlinuz-<NAME>` the pacman-hook will generate
`<OUTDIR>/<NAME>.efi` with <OUTDIR> defined in the previously mentionned
configuration file.
