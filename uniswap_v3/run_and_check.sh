rm -rf deploy-v3

git clone https://github.com/Uniswap/deploy-v3.git > /dev/null 2>&1
cd deploy-v3
yarn > /dev/null 2>&1
if [ $? -ne 0 ]; then
    echo "yarn install failed"
    exit 1
fi
yarn build > /dev/null 2>&1
if [ $? -ne 0 ]; then
    echo "yarn build failed"
    exit 1
fi

node dist/index.js -pk ${DEPLOY_ACCOUNT_PRIVATE_KEY} --json-rpc ${DEPLOY_TEST_URL} -w9 0xc02aaa39b223fe8d0a0e5c4f27ead9083c756cc2 -ncl "ETH" -o 0x7a226Ce301865Da7E6D55F1C0d09d7e66009C446 > output.txt 2>&1
if [ $? -ne 0 ]; then
    echo "Failed to deploy uniswap_v3"
    exit 1
fi


factoryAddress=`grep v3CoreFactoryAddress output.txt | jq -r .v3CoreFactoryAddress`
echo "Deploy uniswap_v3 on ${DEPLOY_TEST_URL} success, factoryAddress is ${factoryAddress}"
