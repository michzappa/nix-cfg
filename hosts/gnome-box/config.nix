
{ config, pkgs, ... }:

{
	imports = 
		[
			../hosts/common.nix
		];

	networking.hostName = "gnomebox-nixos";
	networking.interfaces.enp1s0.useDHCP = true;
}
