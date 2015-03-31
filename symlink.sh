#!/bin/sh

for f in .[^.]*; do
  ln -sf $PWD/$f ~;
done;
