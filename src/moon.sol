// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;



contract moon {
    int private constant b = 44;
    bytes private constant p = "#.";
    bytes1 private constant d = bytes1(' ');
    bytes1 private constant n = bytes1('\n');

    fallback(bytes calldata) external returns (bytes memory) {
        return bytes(northern());
    }

    function northern() public view returns (bytes memory o) {
        o = new bytes(1024);
        int a = 2551443;
        int x = -b;
        int y = 2 - b;
        int z = (((int(block.timestamp) - 592531) % a) << 9) / a;
        uint i;

        while (y <= b) {
            (a, x, y, o[i++]) = ++x >= a
                ? (a, -b, y + 4, n)
                : (x < 0
                    ? (x * x + y * y < b*b) ? (1 - x, -1, y, d) : (a, x + 1, y, d)
                    : (a, x, y, p[(x < a * (~z & 255) >> 8 ? 1 : 0) ^ uint(z >> 8)]));
        }
    }
}
