# moon.sol

![Moon Phase Animation](static/moon.svg)

## Context

The [2024/kurdyukov1](https://www.ioccc.org/2024/kurdyukov1/index.html) IOCCC entry is a compact C program that reads the current time and prints the current phase of the moon from the Northern hemisphere:

```c
# prog.c

#include <time.h>
#include <stdio.h>

        a,b=44,x,
     y,z;main()  {!a
   ?a=2551443,x=    -b
  ,y=2-b,z=((time     (
 0)-592531)%a<<9)/     a
 :putchar(++x>=a?x     =
 -b,y+=4,10:x<0?x=     x
 *x+y*y<b*b?a=1-x,     -
  1:x+1,32:"#."[(     x
   <a*(~z&255)>>    8)
     ^z>>8]),y>  b?0
        :main();}
```

Since it only uses the current timestamp and integer arithmetic, it is actually fairly straightforward to convert to Solidity (see [src/moon.sol](https://github.com/0xkarmacoma/moon.sol/blob/main/src/moon.sol))

The contract is deployed on mainnet at address XYZ and can be invoked by anyone. It will read the current timestamp from the blockchain and render the current moon phase:

```sh
cast call XYZ | cast to-ascii

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
```

## Development

```sh
# run anvil in the background
anvil

# set anvil as the target
export ETH_RPC_URL=127.0.0.1:8545

# deploy to anvil (--from one of the default unlocked addresses)
forge create moon --unlocked --from 0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266  --broadcast
...
Deployed to: <addr>

# call the deployed contract
cast call <addr> | cast to-ascii

# invoke with an explicit timestamp
cast call <addr> $(echo 0x123456 | cast to-int256) | cast to-ascii

# run the animation
./bin/animate.sh <addr>
```

## Acknowledgements

Credit goes to Ilya Kurdyukov for the original C implementation as submitted to the IOCCC. All bugs and mistakes in the Solidity port are my own.

## Disclaimer

_This code is being provided as is. No guarantee, representation or warranty is being made, express or implied, as to the safety or correctness of the code. It has not been audited and as such there can be no assurance it will work as intended, and users may experience delays, failures, errors, omissions or loss of transmitted information. Nothing in this repo should be construed as investment advice or legal advice for any particular facts or circumstances and is not meant to replace competent counsel. It is strongly advised for you to contact a reputable attorney in your jurisdiction for any questions or concerns with respect thereto. a16z is not liable for any use of the foregoing, and users should proceed with caution and use at their own risk. See a16z.com/disclosures for more info._
