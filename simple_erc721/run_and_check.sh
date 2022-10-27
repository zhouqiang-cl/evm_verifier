contract_address=`npx hardhat run scripts/deploy.js --network deploy_test`
echo "mainnet_contract_demo contract address is ${contract_address}"

echo "check mainnet_contract_demo contract address on ${DEPLOY_TEST_URL}"
