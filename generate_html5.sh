#!/bin/bash
set -x

# Generates HTML5 from the minimal Virsh Cmd Ref tag set

# Define variables
OUTPUT_DIR=output/html5
XML_SOURCE_DIR=source
XSL_DIR=xsl
XSL_PROCESSOR=xsltproc
XSL_TEMPLATE=html5.xsl

# Get the list of XML files to process
source common.sh

# Do the generation
mkdir -p $OUTPUT_DIR
for source in $ALL_COMMANDS;
do
  $XSL_PROCESSOR $XSL_DIR/$XSL_TEMPLATE $XML_SOURCE_DIR/${source}.xml > $OUTPUT_DIR/${source}.html
done
