#!/run/current-system/sw/bin/bash
cd ..
nix flake update --extra-experimental-features "nix-command flakes"
git add .
git commit -S -a -m "Update to 25.05."
git push
