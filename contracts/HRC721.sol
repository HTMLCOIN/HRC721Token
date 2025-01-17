pragma solidity ^0.5.0;

import "../node_modules/openzeppelin-solidity/contracts/token/ERC721/ERC721Enumerable.sol";
import "../node_modules/openzeppelin-solidity/contracts/token/ERC721/ERC721MetadataMintable.sol";
import "./IHRC721.sol";

contract HRC721 is IHRC721, ERC721Enumerable, ERC721MetadataMintable {
    constructor(string memory name, string memory symbol) ERC721Metadata(name, symbol) public {
    }
}
