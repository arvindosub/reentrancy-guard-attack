// SPDX-License-Identifier: MIT
pragma solidity ^0.5.0;

contract Contract1 {
    address public lastCaller;

    constructor() public {
        // deployer account address will be first value
        lastCaller = msg.sender;
    }

    modifier notContract() {
        uint32 size;
        address sender = msg.sender;
        assembly {
            size := extcodesize(sender)
        }
        // if size > 0, it is a contract address
        // modifier will pass if it is NOT a contract address
        if (!(size > 0)) _;
    }

    function setLastCaller() public notContract {
        // function will set the value of lastCaller if modifier passes
        // lastCaller should always be an account address if our modifier is working
        lastCaller = msg.sender;
    }

}