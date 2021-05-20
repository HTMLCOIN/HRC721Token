// Based on https://docs.openzeppelin.com/sdk/2.5/testing

const { TestHelper } = require('@openzeppelin/cli');
const { Contracts, ZWeb3 } = require('@openzeppelin/upgrades');

ZWeb3.initialize(web3.currentProvider);

const HRC721Token = Contracts.getFromLocal('HRC721');

require('chai').should();

contract('HRC721Token', function ([_, minter, other]) {

    const firstTokenId = 1;

    beforeEach(async function () {
        this.project = await TestHelper();
        this.proxy = await this.project.createProxy(HRC721Token);
    })

    it('should have a name', async function () {
        const result = await this.proxy.methods.name().call();
        result.should.eq('HRC721Token');
    })

    it('should mint', async function () {
        await this.proxy.methods.mint(other, firstTokenId).send({ from: minter, gas: 5e6 });
        const result = await this.proxy.methods.ownerOf(firstTokenId).call()
        result.should.eq(other);
    })
})