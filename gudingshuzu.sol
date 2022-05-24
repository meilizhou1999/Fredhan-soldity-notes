//SPDX-License-Identifier:MIT
pragma solidity >0.6.0 <0.9.0;

contract shuzuzibianliang {
  
function gudingshuzu() public pure returns(uint8[3] memory){

    //固定长度数组有一给最小匹配原则
    return [1,2,3];
}

  
function gudingshuzu2() public pure returns(uint16[3] memory){

    //可以通过强制转换第一个参数来修改这个最小数组类型
    return [uint16(1),2,3];
}

function gudingshuzu3() public pure returns(uint16[3] memory){

    //可以通过强制转换第一个参数来修改这个最小数组类型
    return [256,2,3];
}


function add(uint[5] memory numbers) public pure returns(uint){
   
    uint total = 0;
    for(uint i = 0; i < numbers.length;i++){

        total += numbers[i];

    }

    return total;

}


}
