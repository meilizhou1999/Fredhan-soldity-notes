//SPDX-License-Identifier:MIT
pragma solidity >0.6.0 <0.9.0;

contract addresstest{
//0x后面40个零 代表这个是BYTES20 相当于UINT160
//账户地址0x5B38Da6a701c568545dCfcB03FcB875f56beddC4
//合约地址0xD7ACd2a9FD159E69Bb102A1ca21C9a3e3A5F771B
//520786028573371803640530888255888666801131675076
address public fredaccount;

function addresstouint() public pure returns(uint160){
    return uint160(0x5B38Da6a701c568545dCfcB03FcB875f56beddC4);
}


function uinttoaddress() public pure returns(address){
    return address(520786028573371803640530888255888666801131675076);
}

function compare() public pure returns(bool)
{

//合约地址大于部署这个合约的账户地址
 
  return(address(0x5B38Da6a701c568545dCfcB03FcB875f56beddC4)>address(0xD7ACd2a9FD159E69Bb102A1ca21C9a3e3A5F771B));
}
  
uint public numa = 160;
function setnumber() public {
    numa ++;
}


}
