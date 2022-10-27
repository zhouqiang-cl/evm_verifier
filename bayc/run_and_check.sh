contract_address=`npx hardhat run scripts/deploy.js --network deploy_test`
echo "bayc contract address is ${contract_address}"

echo "check bayc contract address on ${DEPLOY_TEST_URL}"
