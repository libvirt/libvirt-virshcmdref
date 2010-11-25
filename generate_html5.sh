#!/bin/bash
set -x

# Generates HTML5 from the minimal Virsh Cmd Ref tag set

# Define variables
OUTPUT_DIR=html5
XML_SOURCE_DIR=source
XSL_DIR=xsl
XSL_PROCESSOR=xsltproc
XSL_TEMPLATE=html5.xsl

# List of source files
SOURCE_FILES="net-autostart.xml net-uuid.xml"

# Do the generation
for source in $SOURCE_FILES;
do
  $XSL_PROCESSOR $XSL_DIR/$XSL_TEMPLATE $XML_SOURCE_DIR/$source > $OUTPUT_DIR/$source
done
