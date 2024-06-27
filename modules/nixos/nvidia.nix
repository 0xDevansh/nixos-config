 # https://github.com/NixOS/nixos-hardware/blob/master/common/gpu/nvidia/default.nix
{ lib, pkgs, ... }:

{
  imports = [ ./24.05-compat.nix ];
  services.xserver.videoDrivers = lib.mkDefault [ "nvidia" ];
  
}
