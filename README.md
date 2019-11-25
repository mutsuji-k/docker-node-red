# docker-node-red-armhf

A Linux container to run Node-RED on ARM devices, currently based on Ubuntu.

# DEPRECATION WARNING:

This image is now deprecated in favor of [`insightful/node-red:build-automation-arm32v7`](https://github.com/insightfulsystems/node-red), where I ended up covering all of the `Roadmap` below and then some (those images are smaller, have more flavors and support multiple architectures).

This repository will be deleted in the fullness of time - I'll be leaving it as it is for a few months in case I need to build an Ubuntu-based image for `arm32v7` alone

## About

This container provides a (much easier and faster) way to get [Node-RED][nr] up and running on `armhf` devices like the Raspberry Pi 2/3 and ODROID development boards, using NodeJS 8.x on Ubuntu 18.04.

It contains a number of modules for interacting with cloud services but (for now, at least) relatively little to do with hardware - this has to do with the difficulty to get a lot of the hardware-oriented modules to build properly, and the dumpster fire that is `npm` in general.

## Roadmap

- [x] move to proper Docker manifest/arch tagging
- [ ] Re-test with Node 10
- [ ] Optional image with LetsEncrypt support via `certbot` modeled on [`docker-letsencrypt`][dle]
- [x] move to something like `s6init` to allow for pre-flight container setup
- [ ] multi-step build to decrease image size
- [x] added `node-red-admin` for easier auth setup

[nr]: http://nodered.org
[dle]: https://github.com/linuxserver/docker-letsencrypt

