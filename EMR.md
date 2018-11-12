# Running on EMR and Athena

1) Set up cluster  & SSH into newly created cluster

2) Create new HDFS directories for output and allele lists
    
    ```
    hadoop fs -mkdir /tmp/netmhc
    ```
    
3) Copy allele list and protein files to HDFS

    ```
    hadoop fs -copyFromLocal allele_list.txt /tmp/netmhc
    hadoop fs -copyFromLocal 56_protein_slice.pep /tmp/netmhc
    ```

4) Execute!
    Make sure you're in the same location as the netmhc jar, otherwise include the path.

    ```
    nohup spark-submit --master yarn --deploy-mode client \
    	netmhc-spark-1.0-SNAPSHOT.jar -a hdfs:///tmp/netmhc/allele_list.txt \
    	-i hdfs:///tmp/netmhc/56_protein_slice.pep \
    	-o s3a://YOUR_S3_BUCKET/OUTPUT_DIRECTORY_THAT_WILL_BE_CREATED &
    ```

5) Import from S3 into Athena

    ```sql
    CREATE EXTERNAL TABLE IF NOT EXISTS peptide_test.peptide_binding (
      `hla` string,
      `peptide` string,
      `core` string,
      `offset` string,
      `i_pos` string,
      `i_len` string,
      `d_pos` string,
      `d_len` string,
      `icore` string,
      `identity` string,
      `log50k` string,
      `affinity` string,
      `rank` string 
    )
    ROW FORMAT SERDE 'org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe'
    WITH SERDEPROPERTIES (
      'serialization.format' = '1'
    ) LOCATION 's3://YOUR_S3_BUCKET/OUTPUT_DIRECTORY_THAT_WILL_BE_CREATED/'
    TBLPROPERTIES ('has_encrypted_data'='false');
    ```

    
