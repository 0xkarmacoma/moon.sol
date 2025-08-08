# moon.sol

![Moon Phase Animation](static/moon.svg)

## context

The [2024/kurdyukov1](https://www.ioccc.org/2024/kurdyukov1/index.html) IOCCC entry is a compact C program that reads the current time and prints the current phase of the moon from the Northern hemisphere:

```
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

```
# ./prog

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

Since it only uses the current timestamp and integer arithmetic, it is actually fairly straightforward to convert to Solidity (see [src/moon.sol](https://github.com/0xkarmacoma/moon.sol/blob/main/src/moon.sol)).



## Development

```
# deploy to anvil (--from one of the default unlocked addresses)
forge create fullmoon --unlocked --from 0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266 --rpc-url 127.0.0.1:8545 --broadcast
...
Deployed to: <addr>

# call the deployed contract
cast call --rpc-url 127.0.0.1:8545 <addr> | cast to-ascii

# invoke with an explicit timestamp
cast call <addr> $(echo 0x123456 | cast to-int256) | cast to-ascii

# run the animation
./bin/animate.sh <addr>
```

### credits

https://www.ioccc.org/2024/kurdyukov1/index.html
