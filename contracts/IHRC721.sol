// SPDX-License-Identifier: MIT
pragma solidity >=0.5.0;

import "../node_modules/openzeppelin-solidity/contracts/token/ERC721/IERC721.sol";
import "../node_modules/openzeppelin-solidity/contracts/token/ERC721/extensions/IERC721Enumerable.sol";
import "../node_modules/openzeppelin-solidity/contracts/token/ERC721/extensions/IERC721Metadata.sol";

interface IHRC721 is IERC721, IERC721Enumerable, IERC721Metadata {
    //  Basically, default functions are inherited from ERC721
    function isMinter(address account) external view returns (bool);

    function addMinter(address account) external;

    function renounceMinter() external;

    function mintWithTokenURI(
        address to,
        uint256 tokenId,
        string memory tokenURI
    ) external returns (bool);
}
