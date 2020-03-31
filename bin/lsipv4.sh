#!/usr/bin/env bash

ifconfig | grep inet| grep -v "inet6"
