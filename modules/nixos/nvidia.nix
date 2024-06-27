{ config, pkgs, ... }:

{
  # https://github.com/NixOS/nixos-hardware/blob/master/common/gpu/24.05-compat.nix
  # Backward-compat for 24.05, can be removed after we drop 24.05 support
  imports = lib.optionals (lib.versionOlder lib.version "24.11pre") [
    (lib.mkAliasOptionModule [ "hardware" "graphics" "enable" ] [ "hardware" "opengl" "enable" ])
    (lib.mkAliasOptionModule [ "hardware" "graphics" "extraPackages" ] [ "hardware" "opengl" "extraPackages" ])
    (lib.mkAliasOptionModule [ "hardware" "graphics" "extraPackages32" ] [ "hardware" "opengl" "extraPackages32" ])
    (lib.mkAliasOptionModule [ "hardware" "graphics" "enable32Bit" ] [ "hardware" "opengl" "driSupport32Bit" ])
  ];

  # https://github.com/NixOS/nixos-hardware/blob/master/common/gpu/nvidia/default.nix
  services.xserver.videoDrivers = lib.mkDefault [ "nvidia" ];
  hardware.graphics.extraPackages = with pkgs; [
    vaapiVdpau
  ];
}
