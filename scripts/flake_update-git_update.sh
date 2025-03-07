#!/run/current-system/sw/bin/bash
cd ..
nix flake update --extra-experimental-features "nix-command flakes"
git add .
git commit -S -a -m "Remove Home-Manager Configuration."
git push
