//SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.8.1;

contract Token {
    string public tokenName = "Ring token";
    string public symbol = "RT";
    uint256 public totalSupply = 100000;

    address public owner;

    mapping(address=>uint) public recipents;

    constructor() {
        owner = msg.sender;
        recipents[msg.sender] = totalSupply;
    }

    function giveToken(address _reciever, uint256 _amount) external {
        require(recipents[owner] > _amount, "totalSupply is less than the amount");

        // totalSupply -= _amount;
        recipents[_reciever] += _amount;
        recipents[owner] -= _amount;

        
    }

    function getBalance(address _to) external view returns (uint256) {
        return recipents[_to];
    }
}
