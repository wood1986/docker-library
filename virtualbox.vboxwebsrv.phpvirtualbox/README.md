## Changlelong

* Support VirtualBox 5.0
* Separate into VirtualBox and PHPVirtualBox
* Use Makefile

## FAQ

### How can I use your stuff?

* Go to `virtualbox.vboxwebsrv.phpvirtualbox` and then run `make dist`.

### How can I use my own settings?

* You don't have to modify any `Dockfile`.
* Take a look the `virtualbox.vboxwebsrv.phpvirtualbox/Makefile`.
* You just need to modify the variables in `Makefile` at the top.

### Why can't I build on my machine?

* To build it successfully, you have to check two things.
  * Host's kernel build must be located at `/lib/modules/`.
  * Host's version must be same as `kernel-devel` version installed in container.

So I recommend the OS of the host and the container should use the same distribution and version.
