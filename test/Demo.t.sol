// SPDX-License-Identifier: GPL-2.0
pragma solidity 0.8.22;

import {Test} from "forge-std/Test.sol";

import {CallTestAndUndo} from "src/CallTestAndUndo.sol";

contract DemoTest is Test, CallTestAndUndo {
    uint256 counter;

    function callThatMustNotCauseStateChanges(uint256 amt) public returns (bool) {
        require(msg.sender == address(this));
        counter = amt;

        return true;
    }

    function testDemoCal(uint256 amt) public {
        bytes memory encoded = abi.encodeCall(this.callThatMustNotCauseStateChanges, (amt));
        bool asBool = _doTestAndReturnResult(encoded);

        assertTrue(asBool);
        assertEq(counter, 0);
    }
}
