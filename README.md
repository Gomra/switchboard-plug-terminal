# Switchboard Terminal Plug

An unofficial plug to customize elementary Terminal.

## Building and Installation

You'll need the following dependencies:

* meson
* libswitchboard-2.0-dev
* libgtk-3-dev
* valac

It's recommended to create a clean build environment

    meson build --prefix /usr
    cd build

Run `ninja` to build

    ninja

To install, use `ninja install`, then execute with `switchboard`

    sudo ninja install
    switchboard --debug
