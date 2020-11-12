# requires sysbench
# sudo apt install sysbench

sysbench memory --memory-block-size=1M --memory-total-size=50G run
