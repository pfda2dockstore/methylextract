baseCommand: []
class: CommandLineTool
cwlVersion: v1.0
id: methylextract
inputs:
  FirstIgnor:
    default: 0
    doc: "Number of bases to be ignored at the 5\u2019 end of the reads"
    inputBinding:
      position: 20
      prefix: --FirstIgnor
    type: long
  LastIgnor:
    default: 0
    doc: "Number of bases to be ignored at the 3\u2019 end of the reads"
    inputBinding:
      position: 21
      prefix: --LastIgnor
    type: long
  bedOut:
    default: false
    doc: Extract methylation values in BED format
    inputBinding:
      position: 4
      prefix: --bedOut
    type: boolean
  chromDiv:
    default: 400
    doc: Number of divisions per chromosome to sort the reads
    inputBinding:
      position: 23
      prefix: --chromDiv
    type: long
  context:
    default: CG
    doc: Methylation context(s) used for profiling
    inputBinding:
      position: 6
      prefix: --context
    type: string
  delDup:
    default: false
    doc: Delete duplicated reads (this step is not advised for RRBS methodology)
    inputBinding:
      position: 17
      prefix: --delDup
    type: boolean
  flagC:
    default: 16,83,163
    doc: 'Used flag(s) in the SAM/BAM file for reads mapped on Crick strand (by default:
      16 for single-end alignments; 83,163 for paired-end alignments)'
    inputBinding:
      position: 8
      prefix: --flagC
    type: string
  flagW:
    default: 0,99,147
    doc: 'Used flag(s) in the SAM/BAM file for reads mapped on Watson strand (by default:
      0 for single-end alignments; 99,147 for paired-end alignments)'
    inputBinding:
      position: 7
      prefix: --flagW
    type: string
  inFile:
    doc: Input alignments in SAM/BAM format ()
    inputBinding:
      position: 2
      prefix: --inFile
    type: File
  maxPval:
    default: 0.05
    doc: "Maximum Fisher\u2019s exact test p-value for SNV profiling"
    inputBinding:
      position: 15
      prefix: --maxPval
    type: double
  maxStrandBias:
    default: 0.7
    doc: Maximum strand bias allowed for SNV profiling
    inputBinding:
      position: 16
      prefix: --maxStrandBias
    type: double
  memNumReads:
    default: 1000000
    doc: Number of reads kept in memory during sorting and profiling steps
    inputBinding:
      position: 24
      prefix: --memNumReads
    type: long
  methNonCpGs:
    default: 0.9
    doc: Maximum fraction of methylated non-CpG (to avoid putative bisulfite failures)
    inputBinding:
      position: 12
      prefix: --methNonCpGs
    type: double
  minDepthMeth:
    default: 1
    doc: Minimum coverage in order to report the methylation value of the position
    inputBinding:
      position: 11
      prefix: --minDepthMeth
    type: long
  minDepthSNV:
    default: 1
    doc: Minimum coverage in order to check a position for variation
    inputBinding:
      position: 13
      prefix: --minDepthSNV
    type: long
  minQ:
    default: 20
    doc: Minimum PHRED quality value required for methylation and SNV profiling
    inputBinding:
      position: 10
      prefix: --minQ
    type: long
  outName:
    default: MethylExtract_outFile
    doc: Basename of output file
    inputBinding:
      position: 3
      prefix: --outName
    type: string
  p:
    default: 32
    doc: Number of threads to parallelize the process
    inputBinding:
      position: 22
      prefix: --p
    type: long
  peOverlap:
    default: false
    doc: Discard the second mate overlapping segment on paired-end alignment reads
    inputBinding:
      position: 19
      prefix: --peOverlap
    type: boolean
  qscore:
    default: phred33-quals
    doc: PHRED score encoding used in the SAM/BAM file
    inputBinding:
      position: 9
      prefix: --qscore
    type: string
  seq:
    doc: Reference genome sequences multiFASTA file
    inputBinding:
      position: 1
      prefix: --seq
    type: File
  simDupPb:
    default: 32
    doc: "Number of equal nucleotides at the 5\u2019 end of the reads, that map to\
      \ the same position, in order to consider them putatively duplicated reads"
    inputBinding:
      position: 18
      prefix: --simDupPb
    type: long
  varFraction:
    default: 0.1
    doc: 'Minimum frequency of a variant to be considered '
    inputBinding:
      position: 14
      prefix: --varFraction
    type: double
  wigOut:
    default: false
    doc: Extract methylation values in WIG format
    inputBinding:
      position: 5
      prefix: --wigOut
    type: boolean
label: MethylExtract
outputs:
  outFile:
    doc: Output compressed folder (tar.gz)
    outputBinding:
      glob: outFile/*
    type: File
requirements:
- class: DockerRequirement
  dockerOutputDirectory: /data/out
  dockerPull: pfda2dockstore/methylextract:1
s:author:
  class: s:Person
  s:name: Ricardo Lebron
