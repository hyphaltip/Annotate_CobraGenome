#!/usr/bin/bash -l

GENOMEDIR=genomes
mkdir -p $GENOMEDIR
# usually I make this a file with Accessions and loop through but this is presumably a 1-off project
URL=https://ftp.ncbi.nlm.nih.gov/genomes/all/GCA/009/733/165/GCA_009733165.1_Nana_v5/GCA_009733165.1_Nana_v5_genomic.fna.gz
FILE=$(basename $URL .gz)
if [ ! -f $GENOMEDIR/$FILE ]; then
	curl $URL | pigz -dc | perl -p -e 's/>(\S+).+/>$1/' > $GENOMEDIR/$FILE
	ln -s $FILE $GENOMEDIR/Naja_naja_NN01.masked.fasta
fi
