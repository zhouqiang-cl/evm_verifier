for i in `echo bayc`;
do 
    echo "Deploy $i on ${DEPLOY_TEST_URL}"
    cd $i
    sh ./run_and_check.sh
    cd ..
done