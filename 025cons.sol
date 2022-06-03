//SPDX-License-Identifier:MIT
pragma solidity >0.6.0 <0.9.0;

contract constest{
    uint public numa = 100;
//constant说明这个整数位常量不可被修改，string int uint bytes前面可以加 

    function changevalue() public{
        numa = 99;
    }
}


contract gouzaohanshu{
//constructor是构造函数的关键字，他指的是在合约部署时候就自动执行的函数

address public owner; 
//下面这个构造函数让合约部署者的地址和owner相等
constructor()  {
         owner = msg.sender;
   }


}
