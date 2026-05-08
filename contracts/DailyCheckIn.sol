// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract DailyCheckIn {
    error AlreadyCheckedInToday(uint256 nextAllowedTimestamp);

    event CheckedIn(address indexed user, uint256 timestamp);

    mapping(address => uint256) public lastCheckIn;

    uint256 private constant CHECK_IN_COOLDOWN = 1 days;

    function checkIn() external {
        uint256 lastTimestamp = lastCheckIn[msg.sender];

        if (lastTimestamp != 0 && block.timestamp < lastTimestamp + CHECK_IN_COOLDOWN) {
            revert AlreadyCheckedInToday(lastTimestamp + CHECK_IN_COOLDOWN);
        }

        lastCheckIn[msg.sender] = block.timestamp;
        emit CheckedIn(msg.sender, block.timestamp);
    }

    function canCheckIn(address user) external view returns (bool) {
        uint256 lastTimestamp = lastCheckIn[user];
        return lastTimestamp == 0 || block.timestamp >= lastTimestamp + CHECK_IN_COOLDOWN;
    }
}
