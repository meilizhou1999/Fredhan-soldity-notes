//SPDX-License-Identifier:MIT
pragma solidity >0.6.0 <0.9.0;

contract valuecopy{
   uint public a  = 100;

   uint b = 200;
//如果外部有参数和函数体内部的参数名相同
//优先返回函数体内部的
   function valuetest1() public returns(uint){

      uint a = 198;

       a = 999;

       return(a);
   }

      function valuetest2(uint a) public pure returns(uint){

       return(a);
   }
}
