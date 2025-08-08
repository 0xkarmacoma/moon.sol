// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract fullmoon {
    int private constant b = 44;

    fallback(bytes calldata data) external returns (bytes memory) {
        int timestamp = int(block.timestamp);
        if (data.length != 0) {
            timestamp = abi.decode(data, (int));
        }
        return northern(timestamp);
    }

    function northern(int ts) public pure returns (bytes memory o) {
        int a = 2551443;
        int x = -b;
        int y = 2 - b;
        int z = (((ts - 592531) % a) << 9) / a;

        // output buffer, index and character to push
        o = new bytes(1024);
        uint i = 0;
        bytes1 c;

        // pixels
        bytes memory p = "#.";

        while (y <= b) {
            if (++x >= a) {
                x = -b;
                y += 4;
                c = '\n';
            } else {
                if (x < 0) {
                    if (x * x + y * y < b*b) {
                        a = 1 - x;
                        x = -1;
                    } else {
                        x++;
                    }
                    c = ' ';
                } else {
                    c = p[(x < a * (~z & 255) >> 8 ? 1 : 0) ^ uint(z >> 8)];
                }
            }
            o[i++] = c;
        }
    }
}
