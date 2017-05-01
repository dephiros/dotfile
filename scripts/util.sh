#!/usr/bin/env bash

function have_command {
    type "$1" &> /dev/null ;
}
