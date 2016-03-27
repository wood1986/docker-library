## Changelog

* Support VirtualBox 5.0
* Separate into VirtualBox and PHPVirtualBox
* Use Makefile

## FAQ

### How can I use your stuff?

* Go to `virtualbox.vboxwebsrv.phpvirtualbox` and then run `make dist`.

### How can I use my own settings?

* You don't have to modify any `Dockerfile`s.

* Take a look the `virtualbox.vboxwebsrv.phpvirtualbox/Makefile`.

* You just need to modify the variables at the top of `Makefile`.

### Why can't I build or run on my machine?

* To build it successfully, you have to check two things.
  * Host's kernel build must be located at `/lib/modules/`.
  * Host's kernel version must be same as `kernel-devel` version which will be installed inside the container.

* To run it successfully, you have to check two things.
  * `--privileged` and  `-v /lib/modules/:/lib/modules/` are required to run `vboxwebsrv`
  * `--link $(VBOXWEBSRV)` is required to run `phpvirtualbox`

* So I recommend host's OS and container's image should be in the same Linux distribution and version.

* Again, please refer to `virtualbox.vboxwebsrv.phpvirtualbox/Makefile`. You will learn a lot from this file.
