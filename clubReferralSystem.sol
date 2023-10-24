// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract MyContract {

    address[] members;
    uint totalPayments;
    address _referral;

    function join () public payable returns (string memory Success){
         require(msg.value == 1 ether , "Insuffecient amount");
       
        members.push(msg.sender);
        return ("You have been added to the club");
    }

    function join_referrer (address payable referral) public payable returns (string memory Success){
        _referral = referral;

        require(msg.value == 1 ether, "Insuffecient amount");
        require(checkMember() != 5, "Referral is not a member fo this club");

        members.push(msg.sender);

        referral.transfer(msg.value/10);

        return ("You have been added to the club");
    }

    function get_members() view public returns(address[] memory){
        return members;
    }

    function checkMember() view internal returns(uint) {
        for(uint i; i < members.length; i++){
            if(members[i] == _referral) return i;
        } return 5;
    }
}