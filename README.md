## moon.sol

```
forge test --mt test_fullmoon_currenttime -vvv
[⠊] Compiling...
No files changed, compilation skipped

Ran 1 test for test/moon.t.sol:MoonTest
[PASS] test_fullmoon_currenttime() (gas: 886167)
Logs:

                ..############
            ...###################
         ....########################
       ....############################
     .....###############################
    .....#################################
   .....###################################
  ......####################################
  ......####################################
 ......######################################
 ......######################################
 ......######################################
 ......######################################
  ......####################################
  ......####################################
   .....###################################
    .....#################################
     .....###############################
       ....############################
         ....########################
            ...###################
                ..############


Suite result: ok. 1 passed; 0 failed; 0 skipped; finished in 4.51ms (4.04ms CPU time)

Ran 1 test suite in 205.06ms (4.51ms CPU time): 1 tests passed, 0 failed, 0 skipped (1 total tests)
```

### Development

```
#

# deploy to anvil (--from one of the default unlocked addresses)
forge create fullmoon --unlocked --from 0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266 --rpc-url 127.0.0.1:8545 --broadcast
...
Deployed to: 0x5FbDB2315678afecb367f032d93F642f64180aa3

# call the deployed contract
cast call --rpc-url 127.0.0.1:8545 0x5FbDB2315678afecb367f032d93F642f64180aa3 | cast to-ascii

# invoke with an explicit timestamp
cast call 0x9fE46736679d2D9a65F0992F2272dE9f3c7fa6e0 $(echo 0x123456 | cast to-int256) | cast to-ascii

# do a cool animation
for ts in $(seq -f "%.0f" 123456789 36000 223456789) ; do clear ; cast call 0x9fE46736679d2D9a65F0992F2272dE9f3c7fa6e0 $(cast to-int256 $ts) | cast to-ascii ; sleep 0.1 ; done

```

### credits

https://www.ioccc.org/2024/kurdyukov1/index.html
