{ config, lib, pkgs, ... }:

# configuration.nix merely imports the configuration from the symlinked host 
# directory
{
  imports = [
    ./host/config.nix
  ]; 
}
