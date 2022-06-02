//SPDX-License-Identifier:MIT
pragma solidity >0.6.0 <0.9.0;

contract setpara{
   
   uint public num;

   string public name;

//修改这两个值,外部调用函数的时候可以单独只传一个storage参数
//比如uint类型
   function setparameter(uint _num,string memory _name) public {
       num = _num;

       name = _name;
   }

//内部调用函数传参数的时候 必须要将两个参数都设置
   function test() public {
       setparameter(788,"Fredhan");
   }
//通过{}中将名义参数和:设定值联系起来，可以不按名义参数的顺序赋值
   function test1() public{
       setparameter({_name:"Zhoujielun",_num:1989});
   }
}
