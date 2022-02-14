#!/usr/bin/env python3
# encoding: utf-8
from svglib.svglib import svg2rlg
from reportlab.graphics import renderPDF, renderPM
import sys
import os

args = sys.argv
filename = args[1]
filename_without_ext = os.path.splitext(os.path.basename(filename))[0]

drawing = svg2rlg(filename)
renderPDF.drawToFile(drawing, filename_without_ext + ".pdf")
drawing = svg2rlg(filename)
renderPM.drawToFile(drawing, filename_without_ext + ".png",
                    fmt="PNG",
                    configPIL={'transparent': None})
