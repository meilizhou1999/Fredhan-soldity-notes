//SPDX-License-Identifier:MIT
pragma solidity >0.6.0 <0.9.0;

contract dynamicArray{
    uint[] public numbers;

//下面这个函数用于在numbers这个动态数组末尾里插入一个整数num
    function pushnumbers(uint num) public{
        numbers.push(num);
    }

//返回查看整个数组的值
    function getArray() public view returns(uint[] memory){
        return numbers;
    }

//下面这个功能通过delete方法来使得整个数组归零,删除所有元素
   
   function deleteArray() public{
       delete numbers;
   }

//通过delete功能删除某个具体元素时，并不是把这个元素从数组里弹出，而是把他的值归零。
    function deleteSingleElement(uint index) public{
       delete numbers[index];
   }

//pop方法就是把数组末位的元素给弹出，但整个ARRAY的顺序会改变，
   function popsingleElement(uint index) public{
       numbers[index] = numbers[numbers.length-1];
       numbers.pop();
   }

//如果想要删除某个元素而整个数列的顺序不变，需要引入循环
//引入循环在函数进行的运算会多很多，所以呢GAS要消耗多很多
   function popsingleElementandkeeporder(uint index)public{
       for(uint i = index;i<(numbers.length-1);i++){
           numbers[i] = numbers[i+1];
       }
       //numbers.pop();
   }
  


}
