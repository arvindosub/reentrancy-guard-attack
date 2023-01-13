// SPDX-License-Identifier: MIT
pragma solidity ^0.5.0;
import "./Contract1.sol";

contract Contract3 {
    Contract1 public contract1;

    constructor(Contract1 _contract1) public {
        contract1 = _contract1;
        contract1.setLastCaller();
        // this will penetrate the modifier in contract 1
        // this can be verified by calling lastCaller from contract 1 after trying this from contract 3
        // lastCaller value in contract 1 would have changed to contract address of contract 3
        // this should not have been allowed by the modifier!
    }

}