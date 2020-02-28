gseapy软件说明： 
1)gsea module:
    command:
	gseapy gsea -d /lustre/rdi/user/licq/research/RNA_seq/ssGSEA/GSEApy/demo_FPKM.del2.txt -c /lustre/rdi/user/licq/research/RNA_seq/ssGSEA/GSEApy/demo.cls -g /lustre/rdi/user/licq/research/RNA_seq/ssGSEA/GSEApy/database/c2.cp.kegg.v6.2.symbols.gmt -o test_gsea -m log2_ratio_of_classes	
    参数说明：
    -d     表达量文件
           注：1) 基因名不能重复出现;
               2) 表达量值为0时，用"NA"替换;
               3) 表头必须存在;
               #4) Descripton列不能存在;
    -c     分组文件
           注：1) 第一行：样本数目 + 分组数目 + 1
               2) 第二行：注释说明分组信息(必须存在)
               3) 第三行：每个样品对应的组名(跟表达量样本顺序一一对应)
    -g     基因集文件,从MSigDB下载(kegg/biocarta/reactome/GO)
    -o     输出目录
    -m     基因排序算法({log2_ratio_of_classes,signal_to_noise,t_test,ratio_of_classes (also referred to as fold change),diff_of_classes,log2_ratio_of_classes)

2)ssgsea module:
    command:
         gseapy ssgsea -d /lustre/rdi/user/licq/research/RNA_seq/ssGSEA/GSEApy/demo_FPKM.del2.txt -g /lustre/rdi/user/licq/research/RNA_seq/ssGSEA/GSEApy/database/c2.cp.kegg.v6.2.symbols.gmt -o test2 -n 1000 -sn rank 
    参数说明：
     -d     表达量文件 
            注：1) 基因名不能重复出现;
                2) 表达量值为0时，用"NA"替换;
                3) 表头必须存在;
               #4) Descripton列不能存在;
     -g     基因集文件,从MSigDB下载(kegg/biocarta/reactome/GO)
     -o     输出目录
     -n     置换次数(计算ES的方法，先随机打乱表达谱中基因的表达顺序，然后再依次计算ES值，如此重复一千次，得到一千个ES值)
     -sn     基因排序方法({‘rank’, ‘log’, ‘log_rank’})

3)prerank module:
     功能：根据预先排序的基因列表数据集相关值进行富集分析
4)replot module:
     功能：根据gsea桌面输出结果的位置，重新输出结果
