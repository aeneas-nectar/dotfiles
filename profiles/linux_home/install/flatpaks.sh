#!/bin/bash

flatpak_apps=(
  org.gimp.GIMP
  org.videolan.VLC
  org.inkscape.Inkscape
  # com.vscodium.codium
  # org.freecadweb.FreeCAD
  com.ultimaker.cura
  rest.insomnia.Insomnia
  org.jdownloader.JDownloader
  org.gnome.meld
  eu.scarpetta.PDFMixTool
  # com.github.taiko2k.avvie
  org.darktable.Darktable
  # org.filezillaproject.Filezilla
  com.synology.SynologyDrive
  org.kde.kamoso
  tv.plex.PlexDesktop
  com.plexamp.Plexamp
  org.flameshot.Flameshot
  io.typora.Typora
  com.protonvpn.www
  dev.pulsar_edit.Pulsar
  org.raspberrypi.rpi-imager
  com.makemkv.MakeMKV
  com.uploadedlobster.peek
  com.solvespace.SolveSpace
  org.signal.Signal
  im.riot.Riot
  com.brave.Browser
)

for app in ${flatpak_apps[@]}; do
  flatpak install ${app} -y
done
