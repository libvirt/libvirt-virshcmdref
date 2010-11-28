#!/bin/bash
set -x

# Generates XHTML 1.0 Transitional from the minimal Virsh Cmd Ref tag set

# Define variables
OUTPUT_DIR=output/xhtml1_trans
XML_SOURCE_DIR=source
XSL_DIR=xsl
XSL_PROCESSOR=xsltproc
XSL_TEMPLATE=xhtml1_trans.xsl

# List of source files
SOURCE_FILES="net-autostart net-uuid"

# Do the generation
mkdir -p $OUTPUT_DIR
for source in $SOURCE_FILES;
do
  $XSL_PROCESSOR $XSL_DIR/$XSL_TEMPLATE $XML_SOURCE_DIR/${source}.xml > $OUTPUT_DIR/${source}.html
done
