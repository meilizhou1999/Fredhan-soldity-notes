//SPDX-License-Identifier:MIT
pragma solidity >0.6.0 <0.9.0;

contract bytesstring{
//string本身是没有length属性的，可以通过bytes()这个方法将字符串转换为动态长度元组，
    string public name = "Fredhan";

    function getlength() public view returns(uint){
        return bytes(name).length;
    }

    function stringtobytes() public view returns(bytes memory){
        return  bytes(name);
    }
//可以直接通过bytes方法修改某个字符串的某个字母
    function changeletters() public {
        bytes(name)[0] = "Z";
    }
//可以弹出
   function popletters() public {
        bytes(name).pop();
    }
//可以push单个字母
   function pushZletters() public {
       bytes(name).push("Z");
   }

//弹出某个字符 同时不改整个顺序
   function popsingleletters(uint index) public{
       for(uint i = index;i< (bytes(name).length - 1);i++){
           bytes(name)[i] = bytes(name)[i+1];
       }
       bytes(name).pop(); 
   }

//  通过将string强转为bytes后 可以用delete方法删除掉对应位置的字符串，就是每个元素为bytes1的元组   
   function delete3() public{
       delete bytes(name)[3];
   }
//固定长度字节转换  直接通过bytes1()方法强转
//字节之间的转换,如何将固定长度字节转换为动态长度字节

   bytes7 public name17 = 0x4672656468616e;
//获取的是bytes7的第一位0x46
   function bytes7tobytes1() public view returns(bytes1){
      return bytes1(name17);
   }

//获取的是bytes7的第一位0x4672   
   function bytes7tobytes2() public view returns(bytes2){
      return bytes2(name17);
   }

    function bytes7tobytes4() public view returns(bytes4){
      return bytes4(name17);
   }
//通过for循环将固定长度字节数组转为动态长度字节数组，然后就可以对其直接String了
   function bytes7tobytes()  public view returns(bytes memory){
       bytes memory newbytes17 = new bytes(7);
       
       for(uint i = 0; i<(name17.length);i++){
           newbytes17[i] = name17[i];
       }

       return newbytes17;


   }




}
