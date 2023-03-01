#!/bin/bash

bspc query -T -d | grep -q '"userLayout":"monocle"' && echo M || echo ""
