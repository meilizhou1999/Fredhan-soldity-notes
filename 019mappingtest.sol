//SPDX-License-Identifier:MIT
pragma solidity >0.6.0 <0.9.0;

contract maptest{
//mapping是Solidity映射的方法；
//注册一个网站 手机号 =》 id 一一对应
//id => 昵称  也是一个mapping

//
mapping(address => uint)  addtoid;

mapping(uint => string)  idtoname;


//注册人数初始化为0
uint totalnumber;


function register(string memory name) public {
//总注册人数从1开始,每注册一个人就加1；
  totalnumber ++;
//msg.sender是这个函数的调用者，我们将其和ID匹配
  addtoid[msg.sender] = totalnumber;

//将1号注册者的名字与这个id 匹配
  
  idtoname[totalnumber] = name;

}

//根据传入的外部地址获取当前这个地址注册过的ID
function getidbyadd(address add) public view returns(uint){
 
  return addtoid[add];
}

//根据当前地址注册的ID 获取这个地址所设的名字
function getnamebynum(uint num) public view returns(string memory){

return idtoname[num];

}

}
