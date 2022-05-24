//SPDX-License-Identifier:MIT
pragma solidity >0.6.0 <0.9.0;

contract bytesshuzu{
  //这个是动态长度数组，初始化长度为5
   bytes public names = new bytes(5);

  //将字节初始化
   function inital() public{
       names[0] = 0x7a;   //7*16 +1 =103

       names[1] = 0x6c;   //9*16+2 = 146
   }


   function getlength() public view returns(uint){
     return names.length;
   }

   function pushtest()  public {
       bytes1  b = 0x05;
       names.push(b);
   
   }


    
}
