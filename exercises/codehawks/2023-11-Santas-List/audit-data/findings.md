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
