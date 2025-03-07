#!/usr/bin/env nextflow


process DECOMPRESSFILES {

    input:
    path gz_file

    output:
    path '*gtf'

    
    script:
    """
    #!/usr/bin/env bash
    gzip -df $gz_file
    """
}

process CONVERTOBED12 {

    input:
    path gtf_file

    output:
    path '*.bed12' 

    script:
    """
    #!/usr/bin/env bash
    fbname=\$(basename "$gtf_file" .gtf)
    cat $gtf_file | gff2bed_full.pl - > \$fbname.bed12
    """
}

workflow {
    main:
    files_ch = Channel.fromPath('./Sample_gtf_files/*.gz')
    decompressed_ch = DECOMPRESSFILES(files_ch)
    CONVERTOBED12(decompressed_ch)
}








