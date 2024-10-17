### [H-1] Missing caller check on `checkList` function allows anyone to use it

**Description** The function `checkList` is not utilizing the modifier `onlySanta` to prevent others from calling it.

**Impact** The function `checkList` can be abused as anyone can check himself (or anyone else).

**Proof of Concepts**

The below test shows how anyone can check himself into the fist Santa's check mapping `s_theListCheckedOnce`.

```javascript
function testAnyOneCanCallCheckList() public {
        address addr = makeAddr("sam");
        santasList.checkList(addr, SantasList.Status.EXTRA_NICE);
        assertEq(uint256(SantasList.Status.EXTRA_NICE), uint256(santasList.getNaughtyOrNiceOnce((addr))));
    }
```

**Recommended mitigation** Consider checking that the caller of the function matches `i_santa` by utilizing the modifier `onlySanta`

### [H-2] The order of values used in the enum `Status` is wrong, right now `NICE` status is the default, causing that anyone can call `collectPresent` function

**Description** With the actual design there is no need for Santa's check, because by default the default status for any user is `NICE`. So, the validation for `NICE` status inside `collectPresent` function is always true if Santa hasn't change it with `checkList` function.

**Impact** All users that hasn't been checked by Santa, are able to collect an NFT.

**Proof of Concepts**

```javascript
function testCollectPresentWithDefaultStatus() public {
        vm.warp(santasList.CHRISTMAS_2023_BLOCK_TIME() + 1);
        vm.startPrank(user);
        santasList.collectPresent();
        vm.stopPrank();

        assertEq(santasList.balanceOf(user), 1);
        assertEq(uint256(SantasList.Status.NICE), uint256(santasList.getNaughtyOrNiceOnce(user)));
        assertEq(uint256(SantasList.Status.NICE), uint256(santasList.getNaughtyOrNiceTwice(user)));
    }
```

**Recommended mitigation** Replace `NOT_CHECKED_TWICE` value for `UNKNOWN` in the enum `Status`, and reorder it like the folowing example in order to set `UNKNOWN` as the default value.

```javascript
 enum Status {
        UNKNOWN,
        NICE,
        EXTRA_NICE,
        NAUGHTY
    }
```

### [H-3] Anyone can burn someone else's token and mint an NFT in SantasList contract

**Description** The function `buyPresent` do not check if msg.sender has tokens to burn, and let anyone pass an address with SantaToken as parameter, and spend them to mint an NFT.
Also, according to documentation the `presentReceiver` should be an address with `NAUGHTY` OR `UNKNOWN` status, rigth now, anyone can receive the present

**Impact** Anyone can burn someone else´s tokens to mint themselves an NFT, that action can be done multiple time and impact a lot of users

**Proof of Concepts**

```javascript
function testAnyoneCanBuyPresent() public {
        vm.startPrank(santa);
        santasList.checkList(user, SantasList.Status.EXTRA_NICE);
        santasList.checkTwice(user, SantasList.Status.EXTRA_NICE);
        vm.stopPrank();
        vm.warp(santasList.CHRISTMAS_2023_BLOCK_TIME() + 1);
        vm.startPrank(user);
        santasList.collectPresent();
        vm.stopPrank();

        address attacker = makeAddr("attacker");
        vm.startPrank(attacker);
        santasList.buyPresent(user);
        vm.stopPrank();

        assertEq(santasList.balanceOf(attacker), 1);
    }
```

**Recommended mitigation**
Add the following checks at the top of the `buyPresent` function:

- msg.sender should have santaTokens
- `presentReceiver` address should be registered with `NAUGHTY` or `UNKNOWN` status

```javascript
      function buyPresent(address presentReceiver) external {
        // use custom errors to save gas
        require(i_santaToken.balanceOf(msg.sender) > 0, "not a token holder");
        require(
            (
                s_theListCheckedOnce[presentReceiver] == Status.NAUGHTY
                    && s_theListCheckedTwice[presentReceiver] == Status.NAUGHTY
            )
                || (
                    s_theListCheckedOnce[presentReceiver] == Status.UNKNOWN
                        && s_theListCheckedTwice[presentReceiver] == Status.UNKNOWN
                ),
            "not eligible for a present"
        );
        i_santaToken.burn(msg.sender);
        _mintAndIncrement(presentReceiver);
    }
```

This implementation ensures that:

- only token holders can successfully call the function
- there is a check that `presentReceiver` is indeed `NAUGHTY` or `UNKNOWN`
- the function finally burns the token holder tokens and mints an NFT on `presentReceiver` address

Note that this implementation implies :

- modification of the `Status` enum, replacing ` NOT_CHECKED_TWICE` by `UNKNOWN`, to respect documentation
- modification of `_mintAndIncrement`, allowing this function to take one address input parameter `mintAddress`

```javascript
    function _mintAndIncrement(address mintAddress) private {
        _safeMint(mintAddress, s_tokenCounter++);
    }
```
