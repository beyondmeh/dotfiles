<span style="float: right">
    [![Codacy Badge](https://api.codacy.com/project/badge/Grade/a2be672889a848609315c6173ebd7766)](https://www.codacy.com/app/timothykeith/bin)
</span>

# bin

> Useful shell scripts in my $PATH

These are various shell scripts I use on a regular basis. You may find some of
them useful

## Shell scripts:

* `backup.sh` - Automatically backup using [borg](https://borgbackup.readthedocs.io/en/stable/),
  which encrypts, uses differentials, and deduplicates stored data.
* `clean.sh` - Erases files, directories, browser cache, junk files, history files,
   and slack space
* `cryptfox.sh` - Create and launch an encrypted browser profiles
* `digests.sh` - List the various hashsums for a file and create or verify a
  SHA256SUMS for a directory.
* `disco.sh` - Randomly colored lights in the terminal. For a more wholesome
   experience, [play this](https://www.youtube.com/watch?v=A_sY2rjxq6M)
   simultaneously.
* `dropbox.sh` - Nuke dropbox's buggy auto-update mechanism and run it in a
  firejail sandbox.
* `encrypt.sh` - Wrapper for GPG symmetric encryption using AES256
* `extract.sh` - Wrapper to extract from many archives
* `fehquote.sh` - Sets a random quote on the current background. Reads `feh`'s
  config and uses a quote from `fortune -s`, while leaving your `.fehbg` is
  untouched
* `firefox.sh` - Run Firefox in a firejail sandbox.
* `headset.sh` - Connect/disconnect a bluetooth headset. Bluetooth in Linux is
  still crap, so the script repetitively tries to connect before giving up
* **install/**
    * `get-packer.sh` - Install [packer](https://aur.archlinux.org/packages/packer/),
      an [Arch Linux](https://www.archlinux.org/) [AUR helper](https://wiki.archlinux.org/index.php/AUR_helpers)
* `letsencrypt.sh` - Renew SSL certs for my domains using certbot
* `mirror.sh` - Mirror a website sanely with wget
* `mount-cache.sh` - Create folders and files expected to be in ~/.cache normally,
   useful if mounted as tmpfs
* `mount-cd.sh` - Mounts an .iso CD/DVD image to /mnt/cdrom
* `net-status.sh` - Show the network status as well as the Gateway and local/public
  IP addresses
* `net-wait.sh` - Wait for the network to come up, then start the given app
* `nullcrypt.sh` - Creates and opens encrypted LUKS containers with sane settings
* `optimize-images.sh` - Optimize images for the web by reduces image size and fixing
   file names
* `pdf-extract.sh` - Extract pages from a PDF; useful for removing superfluous and
  unofficial cover sheets added by many online repositories. Compare to
  [pdftk](https://linux.die.net/man/1/pdftk).
* `quotes.sh` - Random curated quotes in a easy to understand all-in-one format (compared to [fortune](https://en.wikipedia.org/wiki/Fortune_%28Unix%29)).
* `rangen.sh` - Create random passwords, MAC addresses, letters, or numbers using
  /dev/urandom
* `respawn.sh` - Indefinitely restart a program after it exits
* `say.sh` - Use Pico TTS to speak the given text
* `steam-preload.sh` - Quirks fixes for Steam under bspwm with an Intel graphics card
* `test-colors.sh` - Show the current terminal color scheme
* `weather.py` - Plaintext weather forecast from NOAA. Generally more timely and
  accurate compared to commercial websites and APIs
* **wm/**
    * `battmon.sh` - Will warn about battery levels with increasing severity and
      then safely shut the system down if the battery gets too low.
    * `lemonade.sh` - Start a [lemonbar](https://github.com/LemonBoy/bar) panel
      with useful system info, similar to conky
    * `lockscreen.sh` - Blurs and locks the screen with *Barney Fife
      Protection&trade;*
      that will make evildoers think twice!
    * `greeting.sh` - Sets the volume to an appropriate level given the time and
      says a greeting
      altogether mutes it depending on if it is too late at night
* `xkcd-pass.sh` - [xkcd's "correct horse battery staple"](https://xkcd.com/936/)
  password scheme generator. Uses the kernel's CSPRNG, unlike most
  implementations
* `zeronet.sh` - Script to run [ZeroNet](https://zeronet.io/), a decentralized
  censorship resistant network, using [Tor](https://www.torproject.org/) for
  anonymity, with [Firefox](https://www.mozilla.org/en-US/firefox/new/) [private browsing](https://support.mozilla.org/t5/Protect-your-privacy/Private-Browsing-Use-Firefox-without-saving-history/ta-p/4473).


## Usage
All shell scripts include a help command that can be invoked by passing the `-h`
flag to them. This will print a brief explanation of what the script does as well
as the usage and any flags or options that can be set.


## Credits

* `disco.sh` - [Aaron Toponce](https://pthree.org/2016/01/21/using-your-monitors-as-a-cryptographically-secure-pseudorandom-number-generator/)  
  License: *public domain*
* `extract.sh` - Based on the [ArchWiki](https://wiki.archlinux.org/index.php/Bash/Functions#Extract)
  and Vitalii Tereshchuk's [Extract](https://github.com/xvoland/Extract).  
  License: [GNU FDL](https://www.gnu.org/copyleft/fdl.html) & [MIT](https://opensource.org/licenses/MIT)
* `lemonade.sh` - Naming convention stolen from Nathan Isom's [dotfiles](https://github.com/neeasade/dotfiles)
* `lockscreen.sh` - Idea based on Jessie Frazelle's [i3lock-fancy](https://github.com/jessfraz/dotfiles/blob/master/bin/fancy-i3lock),
which in turn is based on Dolores Portalatin's [i3lock-fancy](https://github.com/meskarune/i3lock-fancy).  
License: [MIT](https://opensource.org/licenses/MIT)
* `test-colors.sh` - Daniel Crisman's submission to the [TLDP's Bash Prompt HOWTO](http://tldp.org/HOWTO/Bash-Prompt-HOWTO/x329.html)  
  License: [GNU FDL](https://www.gnu.org/copyleft/fdl.html)


## Feedback
I would love your feedback! If you found any of these scripts useful, please
drop me [an email](mailto:timothykeith@gmail.com). For the privacy conscious,
feel free to encrypt any messages using my [PGP key](http://pgp.mit.edu/pks/lookup?op=vindex&fingerprint=on&search=0xF4F4A135C022EE12):

> 4135 C593 1D89 368E 7F32 C8ED F4F4 A135 C022 EE12

To import it into your keyring:
```console
$  gpg --keyserver pgp.mit.edu --recv-key 4135C5931D89368E7F32C8EDF4F4A135C022EE12
```

Submit bug reports via GitHub's [Issue Tracker](https://github.com/keithieopia/bin/issues)


## Author
Copyright &copy; 2016 - 2017 Timothy Keith, except where otherwise noted.

Licensed under the [MIT license](https://github.com/keithieopia/bin/blob/master/LICENSE).

*This is free software: you are free to change and redistribute it. There is NO
WARRANTY, to the extent permitted by law.*
