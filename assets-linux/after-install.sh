#!/bin/bash

# Link to the binary
ln -sf /opt/printsepeti/printsepeti /usr/local/bin/printsepeti

# Launcher icon
desktop-file-install /opt/printsepeti/printsepeti.desktop
