# requires sysbench
# sudo apt install sysbench

# takes number of threads as argument

echo -e "\n\nusage: ./cpubench <num-threads>\n\n"


sysbench --test=cpu --cpu-max-prime=20000 --num-threads=$1 run
