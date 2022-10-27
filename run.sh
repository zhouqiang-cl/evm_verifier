pwd_dir=`pwd`
test_cases=`find . -name "run_and_check.sh"| awk -F"/" '{print $2}'`
# test_cases="opensea_seaport"
for i in ${test_cases};
do 
    echo "Deploy $i..."
    cd $i
    sh ./run_and_check.sh
    if [ $? -ne 0 ]; then
        echo "Failed to deploy $i"
    fi
    cd $pwd_dir
done