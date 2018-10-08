/work/05158/yiliao/stampede2/Software/maker/exe/blast/bin/blastn -query all_rnd4.all.maker.transcripts.fasta -db all_rnd4.all.maker.transcripts.fasta -evalue 0.000001 -out  AmiGenSel.blast -outfmt 6 -num_threads 68
perl Gene_cluster_blastnfmt6.pl AmiGenSel.blast
awk '{if ($1 == $2){} else { print $0}}' AmiGenSel.blast.out > AmiGenSel.blast.out.out
perl GetUniqpairs.pl AmiGenSel.blast.out.out > AmiGenSel.blast.out.out.out
