pragma solidity >0.6.0 <0.9.0;

contract bianliang{
    //solidity里常用的变量  bool  int string
    uint  num1 = 100;

    string Text1 = "Fredhan";

    function setnum(uint _newnum) public{
        num1 = _newnum;
    }

    function getnum() public view returns(uint){
        return num1;
    }

    function getstring() public view returns(string memory){
        return Text1;
    }

    function setText(string memory _newText) public{
        Text1  = _newText;
    }

    function  jisuan() public pure returns(uint){
        return 50*10-30;
    }
}
