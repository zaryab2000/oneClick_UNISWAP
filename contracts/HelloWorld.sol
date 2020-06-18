pragma solidity >=0.4.21 <0.7.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20Detailed.sol";


    


contract UniswapTest{

    address public tokenAddress;

    constructor() public{
            tokenAddress = address(new 
            ERC20Detailed("SAPIENS","SAP",18));
        }

      

     function giveMyAddress() public view returns(address){
        return tokenAddress;
     }
        
     
}   
    
//UNISWAP FUNCTIONS
     // function createPool(address _token) public returns(address){
     //     UniswapFactoryInterface uniFactory = uniFactory = UniswapFactoryInterface(_uniFactoryAddress);
     //     uniFactory.createExchange(_token);
     //     address result = uniFactory.getExchange(_token);
     //     return result;
     // } 