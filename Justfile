# just is a command runner, Justfile is very similar to Makefile, but simpler.
# Reference: https://nixos-and-flakes.thiscute.world/best-practices/simplify-nixos-related-commands

############################################################################
#
#  Nix commands related to the local machine
#
############################################################################

rebuild:
  sudo nixos-rebuild switch --flake .#desktop

debug:
  sudo nixos-rebuild switch --flake .#desktop --show-trace --verbose

up:
  nix flake update

history:
  nix profile history --profile /nix/var/nix/profiles/system

clean:
  # remove all generations older than 7 days
  sudo nix profile wipe-history --profile /nix/var/nix/profiles/system  --older-than 7d

gc:
  # garbage collect all unused nix store entries
  sudo nix-collect-garbage --delete-old

