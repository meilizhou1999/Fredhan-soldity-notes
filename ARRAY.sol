//SPDX-License-Identifier:MIT
pragma solidity >0.6.0 <0.9.0;

contract arrarytest{
    uint[] public numbers;

    function addnumbers(uint data) public {
        //下面这句话在0.6.0之前的版本是可以的 可以重新定义数组的长度，现在无法直接修改 可以用delete 删除所有元素 
        //push在末尾插入一个元素，pop在末尾弹出一个元素来修改
        //numbers.length = 0;
        numbers.push(data);
    }

      function deleteallnumbers() public {
        //下面这句话在0.6.0之前的版本是可以的 可以重新定义数组的长度，现在无法直接修改 可以用delete 删除所有元素 
        //push在末尾插入一个元素，pop在末尾弹出一个元素来修改
        //numbers.length = 0;
        delete numbers;  
    }
  
     function deletesinglenumbers(uint index) public {
        //下面这句话在0.6.0之前的版本是可以的 可以重新定义数组的长度，现在无法直接修改 可以用delete 删除所有元素 
        //delete方法只能讲ARRAY对应的INDEX的值变成0  不能删掉这个元素
        //numbers.length = 0;
         delete numbers[index];  
    }
//下面这段话用于弹出某个ARRAY里的具体元素
//先把这个元素放到ARRAY末尾 然后把这个元素弹出
    function poptheendofarray(uint index) public {
        numbers[index] = numbers[numbers.length - 1];
        numbers.pop();
    }
    function getarray() public view returns(uint[] memory){
        return numbers;
    }

    function getthelengthofarray() public view returns(uint){
        return numbers.length;
    }


}