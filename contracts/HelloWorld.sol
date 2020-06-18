pragma solidity >=0.4.21 <0.7.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract UniswapTest{

    ERC20 public token;

    constructor() public{
            token = new 
            ERC20();
        }
     function giveMyAddress() public view returns(address){
        return address(token);
     }
}   
    
//UNISWAP FUNCTIONS
     // function createPool(address _token) public returns(address){
     //     UniswapFactoryInterface uniFactory = uniFactory = UniswapFactoryInterface(_uniFactoryAddress);
     //     uniFactory.createExchange(_token);
     //     address result = uniFactory.getExchange(_token);
     //     return result;
     // } 
