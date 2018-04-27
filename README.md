# netMHC-spark
Command line tool for running netMHC with Apache Spark


#### Install
```bash
git clone https://github.com/nmdp-bioinformatics/netMHC-spark
cd netMHC-spark
mvn package
```

#### Useage
```bash
netmhc-spark 1.0
Usage: spark-submit netmhc-spark-1.0-SNAPSHOT.jar [options]

  -i, --input <value>    input is the input path
  -o, --output <value>   output is the output path
  -a, --alleles <value>  alleles is the list of HLA alleles to use
  -f, --format <value>   format is the output format (default = parquet)
```

#### Example
```bash
spark-submit --master yarn --deploy-mode client \
    target/netmhc-spark-1.0-SNAPSHOT.jar \
    --input src/test/resources/test_peptides.pep \
    --alleles src/test/resources/allele_list.txt \
    --output peptide_binding
```

### Required Software

 * [JDK 1.8](http://openjdk.java.net)
 * [Apache Maven 3.2.5 or later](http://maven.apache.org)
 * [Scala](https://hub.docker.com/r/nmdpbioinformatics/service-gfe-submission)
 * [Apache Spark 2.1.0](https://service-gfe-submission.readthedocs.io/en/latest/index.html)
 * [NetMHC](https://github.com/nmdp-bioinformatics/service-feature)



### NetMHC Reference
Massimo Andreatta, Morten Nielsen; Gapped sequence alignment using artificial neural networks: application to the MHC class I system, Bioinformatics, Volume 32, Issue 4, 15 February 2016, Pages 511–517, https://doi.org/10.1093/bioinformatics/btv639

<p align="center">
  <img src="https://bethematch.org/content/site/images/btm_logo.png">
</p>


