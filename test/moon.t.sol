// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {LibString} from "solady/utils/LibString.sol";

import {moon} from "src/moon.sol";
import {fullmoon} from "src/fullmoon.sol";

// full moon: 1754689746
// last quarter: 1755337746
// new moon: 1755971346
// first quarter: 1756601346
contract MoonTest is Test {
    moon public m;
    fullmoon public f;

    function setUp() public {
        m = new moon();
        f = new fullmoon();

        // set the time to the current time by default
        vm.warp(vm.unixTime() / 1000);
    }

    function test_fullmoon_currenttime() public {
        // use this to avoid the extra spaces at the beginning or between args
        console.log("\n%s", string(f.northern()));
    }

    function test_fullmoon_fullmoon() public {
        vm.warp(1754689746);
        console.log("\n%s", string(f.northern()));
    }

    function test_fullmoon_lastquarter() public {
        vm.warp(1755337746);
        console.log("\n%s", string(f.northern()));
    }

    function test_fullmoon_newmoon() public {
        vm.warp(1755971346);
        console.log("\n%s", string(f.northern()));
    }

    function test_fullmoon_firstquarter() public {
        vm.warp(1756601346);
        console.log("\n%s", string(f.northern()));
    }

    function test_moon_equal_to_fullmoon() public view {
        bytes memory mb = m.northern();
        bytes memory fb = f.northern();

        console.log("\n%s", string(mb));

        assertEq(mb, fb);
    }

    function test_moon_northern_gas_snapshot() public view {
        m.northern();
    }
}
