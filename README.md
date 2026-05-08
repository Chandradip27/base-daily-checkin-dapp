# Base Daily Check-in DApp

This project demonstrates a simple daily check-in mechanism using a smart contract on the Base network.

## Features
- One check-in per 24-hour period per wallet
- Timestamp-based validation with an explicit cooldown
- Emits a `CheckedIn` event on successful check-in
- Base-compatible Solidity contract

## Contract Behavior
- `checkIn()` reverts if the caller has already checked in within the last 24 hours.
- `canCheckIn(address user)` returns whether a user can check in right now.
- `lastCheckIn(address)` stores the latest check-in timestamp for each wallet.

## Network
- Base Sepolia
- Base Mainnet

## Future Improvements
- Add frontend UI
- Integrate with Base indexers
