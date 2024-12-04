async function main() {
    const [deployer] = await ethers.getSigners();

    console.log("Deploying contracts with the account:", deployer.address);

    const NumberGuessingGame = await ethers.getContractFactory("NumberGuessingGame");
    const game = await NumberGuessingGame.deploy();

    console.log("NumberGuessingGame contract deployed to:", game.address);
}

main()
    .then(() => process.exit(0))
    .catch((error) => {
        console.error(error);
        process.exit(1);
    });
