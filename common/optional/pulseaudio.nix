{
  # https://nixos.wiki/wiki/PulseAudio
  sound.enable = true;
  hardware.pulseaudio.enable = true;
  hardware.pulseaudio.support32Bit = true;
  hardware.pulseaudio.extraConfig = "load-module module-combine-sink";
}