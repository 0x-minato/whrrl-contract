//SPDX-Licence-Identifier: MIT
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";

pragma solidity ^0.8.0;

contract Task is ERC721Enumerable {
    address owner;  
    uint public constant max_supply = 999;
    uint public constant max_minted_amount = 9;
    uint public constant nft_price = 0.001 ether;

    constructor() ERC721("task_token", "tsk"){
        owner = msg.sender;
    }

    modifier onlyOwner {
        require(msg.sender == owner);
        _;
    }

    function mint(uint amount) public payable {
        require(amount>0, "mint anount should be greater than 0");
        require(amount<max_minted_amount, "mint amount should be less than max amount");
        // require(total_supply + amount < )
        require(msg.value >= nft_price * amount);

        for(uint i=0; i<=amount; i++){
            uint mint_index = totalSupply();
            if(totalSupply() < max_supply){
                _safeMint(msg.sender, mint_index);
            }
        }
    } 
    function withdraw() public onlyOwner {
        uint balance = address(this).balance;
        require(balance > 0, "No ether in contract");

        (bool success, ) = msg.sender.call{value:balance}("");
        require(success, "transfer failed");
    }

    fallback() external payable{}
    receive() external payable{}
}