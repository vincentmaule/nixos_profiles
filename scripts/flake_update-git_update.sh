#!/run/current-system/sw/bin/bash
cd ..
nix flake update --extra-experimental-features "nix-command flakes"
git add .
git commit -S -a -m "Provide updates to Users, Hosts, and other small changes."
git push
