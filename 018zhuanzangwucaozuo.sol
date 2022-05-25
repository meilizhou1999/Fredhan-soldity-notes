//SPDX-License-Identifier:MIT
pragma solidity >0.6.0 <0.9.0;

contract paytest{
   // 1ether = 10**18 wei

   //payable这个关键字可以让函数具有转账功能，调用这个函数会向合约地址转对应的值msg,value
    function pay() payable public {

    }

//address(this)  代表当前合约地址；


    function getthisbalance() public view returns(uint){
        return (address(this).balance)/(10**18);
    }
//通过外部方法查看某个地址的余额 这个地址可以是合约账户也可以是外部账户
    function getbalance(address account) public view returns(uint){
        return account.balance;
    }

//想要对一个地址转账，需要把这个地址前面加上payable
//msg.value是一个全局变量，就是指的是我调用这个function时所设置的值
//某个地址后面跟tansfer方法，后面调用这个函数的人会给这个地址转帐msg，value
//这个方法只能用于外部账户 不能用于合约账户
//如果msg.value输入的值超过给定的值，那么多余的会转到合约账户上;
//transefer方法需要输入的值和大于10ether 不然就会报错
    function tansfertoaccount() payable public{
      address  account1 = 0x78731D3Ca6b7E34aC0F824c42a7cC18A495cabaB;
      payable(account1).transfer(10 ether);
    }

//底层SEND方法在小于给定值的时候也不会报错，返回值是一个BOOL值，最好少用
    function sendmoney()  public returns(bool){
       
       return(payable(address(0x5c6B0f7Bf3E7ce046039Bd8FABdfD3f9F5021678)).send(3 ether));
    }
  

}
