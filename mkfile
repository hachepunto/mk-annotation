<config.mk

results/%.hg38_multianno.txt:	data/%.decompose.vcf
	set -x
	mkdir -p results
	table_annovar.pl \
		$prereq \
		$DBFOLDER \
		--buildver $VERGENOME \
		-out "results/build_"$stem \
		-remove \
		-protocol refGene,ensGene,avsnp150,clinvar_20221231,gnomad312_genome,cosmic92_coding,dbnsfp33a \
		-operation g,g,f,f,f,f,f \
		-nastring . \
		-otherinfo \
		-thread $THREADS \
	&&  rename s#build_$stem#$stem# results/build*
