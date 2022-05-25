//SPDX-License-Identifier:MIT
pragma solidity >0.6.0 <0.9.0;

contract globalvariables{

//msg.sender指的是这个function的调用者的地址  是一个全局变量
//msg.value是指发送的ether值  也是一个全局变量
//block.blockhash(uint blockNumber) returns (bytes32)：指定区块的区块哈希——仅可用于最新的 256 个区块且不包括当前区块；
//b而 blocks 从 0.4.22 版本开始已经不推荐使用，由 blockhash(uint blockNumber) 代替
////block.coinbase (address): 挖出当前区块的矿工地址
//block.difficulty (uint): 当前区块难度
//block.gaslimit (uint): 当前区块 gas 限额
//block.number (uint): 当前区块号
//block.timestamp (uint): 自 unix epoch 起始当前区块以秒计的时间戳
//gasleft() returns (uint256)：剩余的 gas
//msg.data (bytes): 完整的 calldata
//msg.gas (uint): 剩余 gas - 自 0.4.21 版本开始已经不推荐使用，由 gesleft() 代替
//msg.sender (address): 消息发送者（当前调用）
//msg.sig (bytes4): calldata 的前 4 字节（也就是函数标识符）
//msg.value (uint): 随消息发送的 wei 的数量
//now (uint): 目前区块时间戳（block.timestamp）
//tx.gasprice (uint): 交易的 gas 价格
//tx.origin (address): 交易发起者（完全的调用链）
//

function getaddress() public view returns(address){
    return msg.sender;
}
//从1970年到调用合约的时候的时间差，以秒为单位
function gettime() public view returns(uint){
    return block.timestamp;
}
function getblocknumber() public view returns(uint){
    return block.number;
}
    
}
