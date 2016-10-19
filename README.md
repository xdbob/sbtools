# sbtools

Helpers for generating signed Arch Linux kernels for Secure Boot.
And pacman hook for auto-generation.

## Installation

Use `sb-mkkeys` to generate your own Secure Boot keys in the current directory.

Use `sb-make-boot-img` to combine the kernel intiramfs and boot args into a single
efi binary (see `sb-make-boot-img -h` for help).

Use `sb-sign-binary` to sign a binary using your keys (see `sb-sign-binary -h` for
help).

[See How to install the efi keys.](http://www.rodsbooks.com/efi-bootloaders/controlling-sb.html#secureone)

## Configuration file

The configuration file should be located at `/etc/sbtools.conf` and can be used
to prefill some of the tools arguments (they will be overriten if the command
line args are present).

the options are in the format: `<name>=<path>`

List of the different possible options:
* `cmd`: Kernel command-line file.
* `outdir`: Efi binary output dir (only used by the pacman hook)
* `out`: Efi binary output file (not used by the pacman hook)
* `osrel`: osrel file
* `efistuf`: efistub file
* `keysdir`: Location of the Secure boot keys
* `kernel`: Location of the kernel to use (will break the pacman hook)
* `initrd`: Initramfs to use
* `addinitrd`: Additional initramfs (like microcode).

## Pacman hook

For the pacman hook to work the configuration file /etc/sbtools.conf must be 
updtated accordingly to your setup.

The mandatory options needed to run the pacman hook are:
* `cmd`
* `outdir`
* `keysdir`
* `osrel`
* `efistuf`

For each kernel `/boot/vmlinuz-<NAME>` the pacman-hook will generate
`<OUTDIR>/<NAME>.efi` with <OUTDIR> defined in the previously mentionned
configuration file.
