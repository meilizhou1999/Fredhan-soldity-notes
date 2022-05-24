pragma solidity >0.6.0 <0.9.0;

//fredhan这个字符串对应的16进制码是0x4672656468616e

contract bytestostring{

    bytes names = new bytes(2);

   // bytes7 name1 = 0x4672656468616e; 0x0000000000000046
   //                0x00000000000046;


    function initalbytes() public {
        names[0] = 0x46;
        names[1] = 0x72;
    }
//动态长度字节转换为字符串可以直接转
    function bytestostring1(bytes memory _newname) public pure returns(string memory){
        return string(_newname);
    }

      function fixbytestostring1(bytes32 name1) public pure returns(string memory){
        bytes memory _newname = new bytes(32);
//需要将固定长度字节转换为动态长度字节
        for(uint i = 0; i<name1.length;i++){
            _newname[i] = name1[i];
        }

        return string(_newname);

    }
}
