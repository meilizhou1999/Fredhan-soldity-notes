//SPDX-License-Identifier:MIT
pragma solidity >0.6.0 <0.9.0;

contract twoArray{
//二元数组创建的时候需要特别注意，第一个数字代表了每个元素里有几个属性，第二个数字代表这个数组里一共有多少元素
//第一个2代表了这个数组每个元素有2个属性，第二个数字3代表了这个数组有三个元素
    uint[2][3] grade = [[88,60],[70,55],[99,89]];

//查看这个整体数组
    function getcontent() public view returns(uint[2][3] memory){
        return grade;
    }

    function setcontent(uint _newgrade) public {
//和定义数列不同的是，在指定某个元素时，第一个1代表了
//我要修改的是元素在整个数组的位置，第二个数字代表在子元素的位置，
        grade[1][0] = _newgrade;
    }

    function getlengthall() public view returns(uint){
      return grade.length;
    }

     function getlengthson() public view returns(uint){
      return grade[0].length;
    }
//通过两个for函数将里面所有的元素加在一起，对于单个元素来说，第一个元素代表在大数列的位置，第二个元素代表在小的数列的位置
    function addall() public view returns(uint zongfen){
        uint add = 0;

        for(uint i = 0; i<grade.length;i++)
          
          for(uint j = 0; j < grade[i].length ; j++){

              add += grade[i][j];
          }

       zongfen = add;
    }
        
    
}
