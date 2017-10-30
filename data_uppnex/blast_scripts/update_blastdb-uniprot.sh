#!/bin/bash

# See README.md

module load bioinfo-tools
module load blast/2.6.0+

staging_dir='/sw/data/uppnex/blast_tmp'
script_dir='/sw/data/uppnex/blast_scripts'

uniprot_url='ftp://ftp.ebi.ac.uk/pub/databases/uniprot/current_release/'

printf 'Started: %s\n' "$(date)" >"$staging_dir/timestamp-uniprot"

mkdir -p "$staging_dir/uniprot/blastdb"

echo '## Get release info'
curl -o "$staging_dir/uniprot/RELEASE.metalink" \
    ftp://ftp.ebi.ac.uk/pub/databases/uniprot/current_release/RELEASE.metalink

echo '### Mirror fasta files'
lftp -c mirror --continue --no-empty-dirs \
    --parallel=4 \
    -i "uniref(50|90|100).fasta.gz" \
    -I uniprot_sprot.fasta.gz \
    -I uniprot_trembl.fasta.gz \
    -I uniprot_sprot_varsplic.fasta.gz \
    "$uniprot_url" \
    "$staging_dir/uniprot/"

echo '### Build blast databases'
( cd "$staging_dir/uniprot" &&
  find . -type f -name '*.fasta.gz' -exec ln -sf {} ./ ';'
  make -j 4 -f "$script_dir/uniprot.mk" )

find "$staging_dir/uniprot/blastdb"  -type f -name '*.pal' \
    -execdir sh -c 'ln -sf "$1" "${1%.*}"' sh-ln {} ';'

# Also create symbolic links for "uniprot_all" and "uniprot_all.fasta"
# pointing to "uniprot_sptrembl"

( cd "$staging_dir/uniprot/blastdb" &&
  ln -sf uniprot_sptrembl.pal uniprot_all.pal &&
  ln -sf uniprot_sptrembl.pal uniprot_all.fasta.pal
)

printf 'Finished: %s\n' "$(date)" >>"$staging_dir/timestamp-uniprot"
echo 'Done.'
