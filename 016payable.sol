//SPDX-License-Identifier:MIT
pragma solidity >0.6.0 <0.9.0;

contract paytest{
   // 1ether = 10**18 wei

   //0xD4Fc541236927E2EAf8F27606bD7309C1Fc2cbee
   //payable这个关键字可以让函数具有转账功能，调用这个函数会向合约地址转对应的值
    function pay() payable public {

    }

   //通过address(合约地址).balance的方法可以获取当前合约或账户的余额 
   //余额是以WEI为单位显示的
    function getbalance() public view returns(uint){
        return (address(0xD4Fc541236927E2EAf8F27606bD7309C1Fc2cbee).balance)/(10**18);
    }
//address(this)  代表当前合约地址；
//0xe2899bddFD890e320e643044c6b95B9B0b84157A

    function getthisbalance() public view returns(uint){
        return (address(this).balance)/(10**18);
    }
//通过外部方法查看某个地址的余额 这个地址可以是合约账户也可以是外部账户
    function getbalance(address account) public view returns(uint){
        return account.balance;
    }

//想要对一个地址转账，需要把这个地址前面加上payable()括号里写地址
//msg.value是一个全局变量，就是指的是我调用这个function时所设置的值
//某个地址后面跟tansfer方法，后面调用这个函数的人会给这个地址转帐msg，value
//这个方法只能用于外部账户 不能用于合约账户
    function tansfertoaccount(address account1) payable public{
      //address  account1 = 0x4B20993Bc481177ec7E8f571ceCaE8A9e22C02db;
       payable(account1).transfer(msg.value);
    }
 //给当前合约地址转账是需要后面加一个回滚函数的
    function transfertothis()  payable public{
        payable(address(this)).transfer(msg.value);
    }
//下面这个是个回滚函数
     fallback() external payable{}   

}
