#!/bin/bash

docker rmi $(docker images -f "dangling=true" -q) 2> /dev/null

NC_PROBLEMS=("bof" "fsb" "overflow" "present_bomb" "rop" "shellcode" "simple_text_editor" "think1" "think2" "very_easy_rev" "wecome_to_1day")
PORT=50000
USER=bubu

for PROBLEM in ${NC_PROBLEMS[@]}
do
    PROBLEM_LOWER=$(echo $PROBLEM | tr '[:upper:]' '[:lower:]')
    docker build --build-arg PROBLEM=${PROBLEM} --build-arg PORT=${PORT} --build-arg USER=${USER} -t ${PROBLEM_LOWER} -f Dockerfile.nc .
    docker run --name $PROBLEM -p $PORT:$PORT -i $PROBLEM_LOWER_LOWER &

    let PORT=${PORT}+1
done

###########################################################

# PYTHON_PROBLEMS=("basic_zkp")
# 
# for PROBLEM in ${PYTHON_PROBLEMS[@]}
# do
#     PROBLEM_LOWER=$(echo $PROBLEM | tr '[:upper:]' '[:lower:]')
#     docker build --build-arg PROBLEM=${PROBLEM} --build-arg PORT=${PORT} --build-arg USER=${USER} -t ${PROBLEM_LOWER} -f Dockerfile.python .
#     docker run --name $PROBLEM -p $PORT:$PORT -i $PROBLEM_LOWER &
# 
#     let PORT=${PORT}+1
# 
# done
# 
# ###########################################################
# 
# FLASK_PROBLEMS=("goback")
# 
# for PROBLEM in ${FLASK_PROBLEMS[@]}
# do
#     PROBLEM_LOWER=$(echo $PROBLEM | tr '[:upper:]' '[:lower:]')
#     docker build --build-arg PROBLEM=${PROBLEM} --build-arg PORT=${PORT} --build-arg USER=${USER} -t ${PROBLEM_LOWER} -f Dockerfile.flask .
#     docker run --name $PROBLEM -p $PORT:$PORT -i $PROBLEM_LOWER &
# 
#     let PORT=${PORT}+1
# 
# done

###########################################################

# PHP_PROBLEMS=("keeper_bird" "obfuscation" "shop" "lord")
# 
# for PROBLEM in ${PHP_PROBLEMS[@]}
# do
#     PROBLEM_LOWER=$(echo $PROBLEM | tr '[:upper:]' '[:lower:]')
#     docker build --build-arg PROBLEM=${PROBLEM} --build-arg PORT=${PORT} --build-arg USER=${USER} -t ${PROBLEM_LOWER} -f Dockerfile.php .
#     docker run --name $PROBLEM -p $PORT:$PORT -i $PROBLEM_LOWER &
# 
#     let PORT=${PORT}+1
# 
# done

###########################################################

# OTHER_PROBLEMS=("xmlparser" "lighttpd")
# 
# for PROBLEM in ${OTHER_PROBLEMS[@]}
# do
#     PROBLEM_LOWER=$(echo $PROBLEM | tr '[:upper:]' '[:lower:]')
#     cd ./problem/$PROBLEM
#     docker build --build-arg PROBLEM=${PROBLEM} --build-arg PORT=${PORT} --build-arg USER=${USER} -t ${PROBLEM_LOWER} -f Dockerfile .
#     docker run --name $PROBLEM -p $PORT:$PORT -i $PROBLEM_LOWER &
# 
#     let PORT=${PORT}+1
#     cd ../..
# 
# done
