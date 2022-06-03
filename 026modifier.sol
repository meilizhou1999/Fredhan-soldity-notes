//SPDX-License-Identifier:MIT
pragma solidity >0.6.0 <0.9.0;

contract modifiertest{

uint public num;

address public Contract_deployer;

constructor() {
    Contract_deployer = msg.sender;
}


 modifier OnlyDeloyer() {
//require是solidity里的一个固定语句，他表示需要满足括号里的条件才能执行，不然就报错，后面跟逗号加报错内容
      require(msg.sender == Contract_deployer,"only the contract deployer can call this function!");
        //_;这个下括号代表了后面接函数主题
        _;
    }

function setvalue(uint _num) public OnlyDeloyer{
    num = _num;
}

}
