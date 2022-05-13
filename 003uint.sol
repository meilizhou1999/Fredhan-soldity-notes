//SPDX-License-Identifier:MIT
pragma solidity >0.6.0 <0.9.0;

contract zhengshuyunsuan{
    uint a = 400;
//uint = uint256
    uint b = 177;
    int c = 10;

    function jia() public view returns(uint){
        return a+b;
    }

      function jian() public view returns(uint){
        return a-b;
    }

     function cheng() public view returns(uint){
        return a*b;
    }

       function chu() public view returns(uint){
        return a/b;
    }

    
       function yu() public view returns(uint){
        return a%b;
    }

    
    
       function mi() public view returns(uint){
        return a**2;
    }

    uint8 numa = 3;
    uint8 numb = 13;

    function weiyu() public view returns(uint8){
        return numa & numb;
    }

      function weihuo() public view returns(uint8){
        return numa | numb;
    }

    
      function weifan() public view returns(uint8){
        return ~numa;
    }
//异或是相等为0 不等为1
         function yihuo() public view returns(uint8){
        return numa^numb;
    }

        function zuoyi() public view returns(uint8){
        return numa<<1;
    }

          function youyi() public view returns(uint8){
        return numa>>1;
    }

    function intitest() public view returns(uint8){
        uint8 mm = 100000000000000000000000000000000000000000000000000000000000000000001 - 100000000000000000000000000000000000000000000000000000000000000000000;
       // mm++; // mm = mm+1;
        return mm;
    }
//fredhan  6672656468616e
    bytes1 AA = 0xff;  
    bytes1 BB = 0x66;
    function stringtouint() public view returns(bool){
      return BB>AA;
    }




}
