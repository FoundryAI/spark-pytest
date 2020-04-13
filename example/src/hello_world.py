from pyspark.sql import SparkSession


def hello_alice():
    spark = SparkSession.builder.getOrCreate()
    alice = spark.read.text("../data/alice_in_wonderland.txt")
    return alice.count()
