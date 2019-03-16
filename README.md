# docker-node-red-armhf

A Linux container to run Node-RED on ARM devices

## About

This container provides a (much easier and faster) way to get [Node-RED][nr] up and running on `armhf` devices like the Raspberry Pi 2/3 and ODROID development boards, using NodeJS 8.x on Ubuntu 18.04.

It contains a number of modules for interacting with cloud services but (for now, at least) relatively little to do with hardware - this has to do with the difficulty to get a lot of the hardware-oriented modules to build properly, and the dumpster fire that is `npm` in general.

## Roadmap

- [ ] move to proper Docker manifest/arch tagging
- [ ] Optional image with LetsEncrypt support via `certbot` modeled on [`docker-letsencrypt`][dle]
- [ ] move to something like `s6init` to allow for pre-flight container setup
- [x] added `node-red-admin` for easier auth setup

[nr]: http://nodered.org
[dle]: https://github.com/linuxserver/docker-letsencrypt

