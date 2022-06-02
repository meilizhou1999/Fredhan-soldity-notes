//SPDX-License-Identifier:MIT
pragma solidity >0.6.0 <0.9.0;

//function (<parameter types>) {priviate|internal|external|public} [pure|constant|view|payable] [returns(return types)]

contract chongzai{

//函数不能参数和名字完全相同,即使返回类型不同
//如果函数名相同 而传入的名义参数类型不同，可以保存
//如过函数名相同 函数类型不同，调用时传入的参数如果造成了两个函数都可使用
//则会报错，编译器无法知道到底是哪一个具体函数

uint public Num1;

    function test(uint160 add) public{
         Num1 = 100;
    }


     function test(address add) public{
         Num1 = 350;
        
    }

    function test2() public {
        test(uint160(0xdD870fA1b7C4700F2BD7f44238821C26f7392148));
    }

}
