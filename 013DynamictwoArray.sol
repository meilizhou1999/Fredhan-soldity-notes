//SPDX-License-Identifier:MIT
pragma solidity >0.6.0 <0.9.0;

contract dynamictwoArray{

    uint[][] public grade = [[1,2],[3,4],[5,6]];

    function getlength() public view returns(uint) {
        return grade.length;

    }

    function getcontent() public view returns(uint[][] memory){
        return grade;
    }

    function pushgrade() public{
        grade.push([88,99]);
    }

    function pushgrade2() public{
        grade[2].push(1505);
    }


}
