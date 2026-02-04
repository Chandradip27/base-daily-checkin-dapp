// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract DailyCheckIn {
    mapping(address => uint256) public lastCheckIn;

    function checkIn() external {
        lastCheckIn[msg.sender] = block.timestamp;
    }
}
