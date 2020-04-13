from pyspark.sql import SparkSession


def hello_alice():
    spark = SparkSession.builder.getOrCreate()
    alice = spark.read.text("data/alice_in_wonderland.txt")
    return alice.count()


if __name__ == '__main__':
    print(f"There are {hello_alice()} lines in 'Alice in Wonderland.'")
