//SPDX-License-Identifier:MIT
pragma solidity >0.6.0 <0.9.0;

contract dynamicArray{
//创建一个名为numbers的可变长度数组
    uint[] numbers;
//查看这个数组，这个查看是整体查看
      function getnumbers() public view returns(uint[] memory)
    {
        return numbers;
    }
//使用push方法添加100，200这两个元素到数组里，
    
      function initalnumbers() public 
    {
         numbers.push(100);
         
         numbers.push(200);
    }
//push一个名义整数到这个数组里
          function pushnumbers(uint number) public 
    {
         numbers.push(number);
             
    }
//数组的长度是不能直接被修改的，只能通过pop()方法弹出这个数组
    function pop() public {
        numbers.pop();
    }

    
}
