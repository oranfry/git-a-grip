#!/bin/bash

git log -- "$1" | grep ^commit | sed 's/^commit //'
