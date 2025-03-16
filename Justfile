# just is a command runner, Justfile is very similar to Makefile, but simpler.
# Reference: https://nixos-and-flakes.thiscute.world/best-practices/simplify-nixos-related-commands

############################################################################
#
#  Nix commands related to the local machine
#
############################################################################

default:
  just --list --unsorted


rebuild host='desktop':
  @echo 'Rebuilding based on {{host}} configuration'
  sudo nixos-rebuild switch --flake .#{{host}}

debug host='desktop':
  sudo nixos-rebuild switch --flake .#{{host}} --show-trace --verbose

[doc('flake update')]
up:
  nix flake update

history:
  nix profile history --profile /nix/var/nix/profiles/system

[doc('Removed profiles older than 7d')]
clean:
  # remove all generations older than 7 days
  sudo nix profile wipe-history --profile /nix/var/nix/profiles/system  --older-than 7d

gc:
  # garbage collect all unused nix store entries
  sudo nix-collect-garbage --delete-old

