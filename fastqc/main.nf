/*
Pipeline to run fastqc in fastq files
*/

params.reads = "$baseDir/data/*_{1,2}.{fa,fastq}.gz"
params.outdir = "results"

if (!params.reads) { 
    log.warn('Provide a input vcf file using --reads')
    exit 1
}

log.info """\

        ===============
        FASTQC PIPELINE
        ===============
        reads: ${params.reads}

        """
        .stripIndent()

workflow {
    Date date = new java.util.Date()
    print "Analysis running on " + date + " :\n"
    DateFor = new java.text.SimpleDateFormat("yyyy_MM_dd_hhmmss")
    stringDate = DateFor.format(date)
    fastqFiles = Channel.fromFilePairs( params.reads, checkIfExists:true , glob:true )
    run_fastqc( fastqFiles, stringDate ).view()
}

process run_fastqc {

    publishDir params.outdir, mode:'copy'

    input:
    tuple val(sample_id), path(reads)
    val(date)

    output:
    path("${date}/fastqc_${sample_id}")

    script:
    """
    set -euxo pipefail
    mkdir ${date}
    mkdir ${date}/fastqc_${sample_id}
    fastqc -f fastq -o ${date}/fastqc_${sample_id} ${reads}
    """

}

workflow.onComplete { 
	log.info ( workflow.success ? "\nDone! Open the following report in your browser --> $params.outdir/$stringDate/fastqc_<SAMPLE_ID>\n" : "Oops .. something went wrong" )
}