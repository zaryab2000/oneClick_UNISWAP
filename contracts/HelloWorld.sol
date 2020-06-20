pragma solidity >=0.4.21 <0.7.0;

import "./UniInterface.sol";
import "./ERC20.sol";

//UniswapTest.deployed().then((instance)=>{app = instance;})
contract UniswapTest{

    ERC20 public token;
    address public tokenAddress;
    address public exchangeAddress;

    constructor() public{
            token = new ERC20("Putu","PU",18,4000);
        }

    //function setTokenAddress() public{
    //    tokenAddress = address(token);
   // }
    
     function giveMyAddress() public view returns(address){
        return tokenAddress;
     }

      //Creates a New UNISWAP Exchange for the Newly created ERC20 Token
      function createPool() public{
         tokenAddress = address(token);
         UniswapFactoryInterface uniFactory = UniswapFactoryInterface(0x9c83dCE8CA20E9aAF9D3efc003b2ea62aBC08351);
         uniFactory.createExchange(tokenAddress);
         address result = uniFactory.getExchange(tokenAddress);
         exchangeAddress = result;
     } 

     //Returns the Address for the Uniswap Exchange created w.r.t the ERC20 token.
     //If this function returns an address, it is verified that the New Exchange
     //has been created successfully.
     function getExchangeAddress() public view returns(address) {
         return exchangeAddress;
     }
     
}   
    
//UNISWAP FUNCTIONS
    
