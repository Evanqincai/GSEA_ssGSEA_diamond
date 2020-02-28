#java -Xmx512m xtools.gsea.Gsea -res \\Krypton\GSEATest\DataSets\P53_hgu95av2.gct -cls \\Krypton\GSEATest\DataSets\P53.cls#MUT_versus_WT -gmx ftp.broadinstitute.org://pub/gsea/gene_sets/c1.v2.symbols.gmt -chip ftp.broadinstitute.org://pub/gsea/annotations/HG_U95Av2.chip -collapse true -mode Max_probe -norm meandiv -nperm 1000 -permute phenotype -rnd_type no_balance -scoring_scheme weighted -rpt_label my_analysis -metric Signal2Noise -sort real -order descending -include_only_symbols true -make_sets true -median false -num 100 -plot_top_x 20 -rnd_seed timestamp -save_rnd_lists false -set_max 500 -set_min 15 -zip_report false -out C:\Program Files\gsea_home\dec18 -gui false

java – Xmx1024m -cp /xchip/projects/xtools/gsea2.jar xtools.gsea.Gsea -res test.gct -cls test.cls -gmx test.gmx -collapse false

java -Xmx1024m -cp /xchip/projects/xtools/gsea2.jar xtools.gsea.Gsea -res foo.gct -cls foo.cls -gmx foo.gmx  -chip ftp.broadinstitute.org://pub/gsea/annotations/HG_U133A.chip
