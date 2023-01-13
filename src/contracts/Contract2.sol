// SPDX-License-Identifier: MIT
pragma solidity ^0.5.0;
import "./Contract1.sol";

contract Contract2 {
    Contract1 public contract1;

    constructor(Contract1 _contract1) public {
        contract1 = _contract1;
    }

    function callContract1() public {
        contract1.setLastCaller();
        // call will be unable to penetrate the modifier in contract 1
        // this can be verified by calling lastCaller from contract 1 after trying this from contract 2
        // lastCaller value in contract 1 will be unchanged
    }

}