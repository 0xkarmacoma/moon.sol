// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";

import {moon} from "src/moon.sol";
import {fullmoon} from "./fullmoon.sol";

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
        // vm.warp(vm.unixTime() / 1000);
    }

    function test_fullmoon_currenttime() public view {
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

    /// run with --isolate
    function test_moon_northern_gas_snapshot() public view {
        m.n();
    }

    function _moon_equal_to_fullmoon(uint40 ts) public {
        if (ts < 592531) {
            ts += 592531;
        }
        vm.warp(ts);

        bytes memory mb = m.n();
        bytes memory fb = f.northern();

        assertEq(mb, fb);
    }

    // sanity check at the current timestamp
    function test_moon_equal_to_fullmoon() public {
        _moon_equal_to_fullmoon(uint40(vm.unixTime() / 1000));
    }

    /// forge-config: default.fuzz.runs = 256
    /// forge-config: heavy.fuzz.runs = 1000000
    function test_fuzz_moon_equal_to_fullmoon(uint40 ts) public {
        _moon_equal_to_fullmoon(ts);
    }

    function check_moon_equal_to_fullmoon(uint40 ts) public {
        _moon_equal_to_fullmoon(ts);
    }
}
