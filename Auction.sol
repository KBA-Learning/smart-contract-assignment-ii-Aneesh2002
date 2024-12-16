// SPDX-License-Identifier: MIT
pragma solidity 0.8.28;

contract Auction {
    
    address admin;
    address public owner;
    string Team;
    uint256 BasePrice;

    constructor() {
        admin = msg.sender;
    }

    modifier verify(){
        require(msg.sender == admin,"unautherized");
        _;
    }

    function setAuction(string memory _Team,uint256 _BasePrice) public verify{
            Team = _Team;
            BasePrice = _BasePrice;
            owner = msg.sender;
    }
    function ShowAuction() public view returns(string memory,uint256){
        return (Team,BasePrice);
    }
    function buy(uint256 amount) public payable  {
        if(amount >=BasePrice){
            BasePrice = amount;
            owner = msg.sender;
        }else{
            payable (msg.sender).transfer(amount);
        }
    }




}