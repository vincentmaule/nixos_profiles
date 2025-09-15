#!/run/current-system/sw/bin/bash
cd ..
nix flake update --extra-experimental-features "nix-command flakes"
git add .
git commit -S -a -m "Add enableRedistributableFirmware, Network Manager, and wireless networking P2."
git push
