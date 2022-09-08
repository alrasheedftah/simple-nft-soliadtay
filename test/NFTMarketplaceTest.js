
const NFTMarketplace = artifacts.require("../contracts/NFtMarketPlace.sol");
const { assert, should } = require('chai');

require("chai").use(require("chai-as-promised")).should()


// stages of testing 

// 1 deploy contract 

// 2 =>  mint NFT 

// 3 =>  totoal supply and owner of and all helper function 

// hold all stages in parent group describe then devid entired into samll decsrip group by group 




contract("NFtMarketPlace" , (accounts) => {

    let nftContract;
    before(async() => {
        nftContract = await NFTMarketplace.deployed();
    })


    // Stage 1 for Deploy Contract 
    describe(" Deploy Contract Testing  ",async () => { 

        it("Deplyoed Operation successfully ",async() => {
            const address = nftContract.address;
            assert.notEqual(address,"");
            assert.notEqual(address,0x0); // Means Address Not Address(0)
            assert.notEqual(address,undefined);
            assert.notEqual(address,null);

        })
        // Testing Of Name Contract
        it("Name Of Contract ",async() => {
            // const nftContract = await NFTMarketplace.deployed();
            const name = await nftContract.name();
            assert.equal(name,"MyNftMarketplace");
        })

        // Testing Of Symbol Contract
        it("Symbol Of Contract ",async() => {
            // const nftContract = await NFTMarketplace.deployed();
            const symbol = await nftContract.symbol();
            assert.equal(symbol,"NFTS");
        })

    })

    // stage 2 for Mint NFT 

    describe(" Mint NFT Test ",async () => {

        it("Create New NFT By Call Mint ANd Total Supplay is 1", async () => {
            const mintNFT =await nftContract.mint("https://ana.com/ajnkjdfkjdaj");

            const totoalSupplay = await nftContract.getTotalSupplay();

            const mintResults = mintNFT.logs[0].args;
            
            assert.equal(mintResults.to,accounts[0])

            assert.equal(totoalSupplay,1);

            // To Check If The NFTMetaDta Is Unique And Cannot Duplicated
            await nftContract.mint("https://ana.com/ajnkjdfkjdaj").should.be.rejected;



        })
    })


    // stage 3 Helper Function 
    describe(" Get NFT Store Testing  ", () => {


        it("add List NFTs ", async () => {
            await nftContract.mint("https://ana.com/ajnkjdfkjdaj0")
            await nftContract.mint("https://ana.com/ajnkjdfkjdaj1")
            await nftContract.mint("https://ana.com/ajnkjdfkjdaj2")

            const totalSupplay = await nftContract.getTotalSupplay()

            assert.equal(totalSupplay,4)

            let nftListTests = [
                "https://ana.com/ajnkjdfkjdaj",
                "https://ana.com/ajnkjdfkjdaj0",
                "https://ana.com/ajnkjdfkjdaj1",
                "https://ana.com/ajnkjdfkjdaj2",
            ];

            let nftTokenLists = [];
            for(i=0;i < totalSupplay ; i++){
                nftTokenLists.push(await nftContract.nftLists(i));
            }    


            assert.equal(nftTokenLists.length , 4);

            assert.equal(nftListTests.join(","),nftTokenLists.join(","));

        })
    })

})