//SPDX-License-Identifier:MIT
pragma solidity >0.6.0 <0.9.0;

contract returntest{
    function returntest1() public view returns(uint){
        uint a = 100;
        return a;
    }
//函数返回值可以定义一个变量名
     function returntest2() public view returns(uint num){
        uint a = 200;
        return a;
    }
//函数里可以没有Return 可以给定返回变量的值
    function returntest3() public pure returns(uint num){
        num = 356; 
    }
//如果又有返回参数的值  又有return某个值 且这两个值不同
//以RETRUN返回的值为优先
     function returntest4() public pure returns(uint num){
        uint a = 788;
        num = 356; 
        return a;
    }
//可以返回常数
      function returntest5() public pure returns(uint num){
        uint a = 788;
        num = 356; 
        return 77;
    }

//可以返回多个值
    function returntest6(uint a, uint b) public pure returns(uint add,uint mul){
      add = a + b;

      mul = a * b;
      //return(a+b,a*b);
    }
//可以通过这个直接返回对参数进行取反
function returntest7(uint a, uint b) public pure returns(uint,uint){

      return(b,a);
    }


}
