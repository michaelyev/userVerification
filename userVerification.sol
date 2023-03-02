// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract userVerification {

    struct User {
        string name;
        uint256 dob;
        uint256 ssn;
        bool isVerified;
    }

    mapping(address => User) public users;

    event userRegistred(address indexed usersAddress, string name, uint256 dob, uint256 ssn);

    function registration(string memory _name, uint256 _dob, uint256 _ssn) public {
        require(users[msg.sender].ssn == 0, "User has already registred");

        users[msg.sender] = User({name: _name, dob: _dob, ssn: _ssn, isVerified: false});

        emit userRegistred(msg.sender, _name, _dob, _ssn);
    } 

    function verification(address _userAddress, uint256 _dob, uint256 _ssn) public{
        require(users[_userAddress].ssn != 0, "Not registered ");
        require(users[_userAddress].dob == _dob, "Invalid DOB");
        require(users[_userAddress].ssn == _ssn, "Wrong SSN");
        users[_userAddress].isVerified = true;
    }

    function isVerified(address _userAddress) public view returns(bool){
        return users[_userAddress].isVerified;
    }





}
