//SPDX-License-Identifier:MIT
pragma solidity >0.6.0 <0.9.0;

contract fixbytestostring2{
//0x686f6c6100000000000000000000000000000000000000000000000000000000  如何将后面的0去掉
    function fixbytes32tostringbetter(bytes32 _name) public pure returns(string memory){
        uint Count = 0;

        //找出字节里的非零字节数有多少
        for(uint i = 0; i < _name.length;i++){
            bytes1 char = _name[i];
            if(char != 0){
                Count++;
            }
        }

        bytes memory newname = new bytes(Count);

        for(uint j = 0 ; j < Count ; j++){
            newname[j] = _name[j];
        }

        return string(newname);
    }

    function bytestostring(bytes memory _name2) public pure returns(string memory){
        return string(_name2);
    }
}
