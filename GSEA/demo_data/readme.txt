命令行：
java -cp /lustre/rdi/user/licq/research/RNA_seq/GSEA/gsea-3.0.jar -Xmx1024m xtools.gsea.Gsea -gmx /lustre/rdi/user/licq/research/RNA_seq/GSEA/demo_data/c2.cp.kegg.v6.2.symbols.gmt -res /lustre/rdi/user/licq/research/RNA_seq/GSEA/RNADATA/s0vss8_DEG_FPKM.txt  -cls /lustre/rdi/user/licq/research/RNA_seq/GSEA/RNADATA/s0vss8.cls -collapse false -out result -rpt_label s0vss8  -set_min  15 -set_max 500
参数说明：
-res
	gct文件：表达矩阵文件
		#第一行：照抄
		#第二行：Gene symbol数目 + 样本数目
		第一行：表头
		第二行至最后：每个基因在每个样本中的表达量值(FPKM)
-cls

	cls文件：分组文件（Phenotype labels）
		第一行：样本数目 + 分组数目 + 1
		第二行：注释说明分组信息
		第三行：每个样品对应的组名(跟表达量样本顺序一一对应)
-gmx
	gmt文件：Gene sets database（kegg/biocarta/reactome/GO）

-collapse
	是否为芯片数据，值为false或者true

-out 
        输出目录

-rpt_label
	输出文件前缀

-set_min  
	过滤基因集包含基因个数的下线
-set_max
	过滤基因集包含基因个数的上线
	如：-set_min 15 -set_max 500 筛选含基因的个数为15到500的基因集进行富集
