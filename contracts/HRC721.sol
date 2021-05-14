// SPDX-License-Identifier: MIT
pragma solidity >=0.5.0;

import "./IHRC721.sol";
import "../node_modules/openzeppelin-solidity/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "./MinterRole.sol";

contract HRC721 is ERC721URIStorage, MinterRole {
    constructor(string memory name, string memory symbol)
        public
        ERC721(name, symbol)
    {}

    function mintWithTokenURI(
        address to,
        uint256 tokenId,
        string memory tokenURI
    ) external returns (bool) {
        _mint(to, tokenId);
        _setTokenURI(tokenId, tokenURI);
        return true;
    }
    //TODO:Kevin Can be able to add custom functions
}
