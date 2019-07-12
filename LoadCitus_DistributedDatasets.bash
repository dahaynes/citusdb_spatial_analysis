#!/bin/bash
#Script for batch loading data into SciDB

while getopts v: option
do
    case "${option}"
    in
    v) vector=${OPTARG};;
    esac
done


for d in 1,10,50,100; do
	for h in 2,4,6,8; do
		IFS="," read chunk tiles <<< "${i}"
		#echo "${chunk}" and "${tiles}"
		args("--distributed --host localhost -d postgres -p 9700 -u dhaynes" "-o /group/vector_datasets/postgresql_loading_${vector}${d}M_hash_${h}_7_12.csv" "-s 4326 -t random_10_hash_6 -f hash_6 -n 12" "csv" "--txt /group/vector_datasets/geom_csv/randpoints_${d}m_hashed.csv" "--geom geom_text --keyvalue gid=bigint --keyvalue geom_text=text --keyvalue hash_8=text --keyvalue hash_6=text --keyvalue hash_4=text --keyvalue hash_2=text")
		#LoadArray="python3 GDALtoSciDB_multiprocessing.py 
		#python3 citus_parallel_load.py  ${args[@]}
		echo ${args[@]}
	done
done