This directory includes data files that are used to populate the database
during deployment.

1. **Pseudomonas_aeruginosa_PAO1.gene_info**: PAO1 genes of `Pseudomonas` organism.
This file is decompressed from raw//Pseudomonas_aeruginosa_PAO1.gene_info.gz,
which is downloaded from:
ftp://ftp.ncbi.nih.gov/gene/DATA/GENE_INFO/Archaea_Bacteria/Pseudomonas_aeruginosa_PAO1.gene_info.gz

2. **gene_history_208964**: gene history file of organism whose taxonomy ID is 208964.
This file is generated based on the following procedure:
```shell
wget ftp://ftp.ncbi.nih.gov/gene/DATA/gene_history.gz
gunzip -k gene_history.gz
(head -1 gene_history; grep "^208964\t" gene_history) > gene_history_208964
```
The downloaded `gene_history.gz` is saved in `raw` subdirectory as a referenece.
