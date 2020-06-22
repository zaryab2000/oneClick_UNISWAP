pragma solidity >=0.4.21 <0.7.0;

import "./UniInterface.sol";
import "./ERC20.sol";

//UniswapTest.deployed().then((instance)=>{app = instance;})
contract UniswapTest{

    ERC20 public token;
    bool result;
    // bool liquidation;
    address public tokenAddress;
    address public exchangeAddress;
    uint256 public maxTokens = 600*10**18;
    uint public minTokens = 1;
    uint256 public deadline = 1742680400;
    constructor() public{
            token = new ERC20("Putu","PU",18,4000);
        }

    //function setTokenAddress() public{
    //    tokenAddress = address(token);
   // }
    
     function giveTokenAddress() public view returns(address){
        return tokenAddress;
     }

      //Creates a New UNISWAP Exchange for the Newly created ERC20 Token
      function createPool() public{
         tokenAddress = address(token);
         UniswapFactoryInterface uniFactory = UniswapFactoryInterface(0x9c83dCE8CA20E9aAF9D3efc003b2ea62aBC08351);
         uniFactory.createExchange(tokenAddress);
         address resultex = uniFactory.getExchange(tokenAddress);
         exchangeAddress = resultex;
         UniswapExchangeInterface uniExchange = UniswapExchangeInterface(exchangeAddress);
         uniExchange.approve(exchangeAddress,maxTokens);
         result =true;
 }    

     //Returns the Address for the Uniswap Exchange created w.r.t the ERC20 token.
     //If this function returns an address, it is verified that the New Exchange
     //has been created successfully.
     function getExchangeAddress() public view returns(address) {
         return exchangeAddress;
     }

     function isApproved() public view returns(bool){
        return result;
     }
     // function isLiquid() public view returns(bool){
     //    return liquidation;
     // }
     function liquidate() public payable{
        UniswapExchangeInterface uniExchange = UniswapExchangeInterface(exchangeAddress);
        uint totalAmt = uniExchange.getEthToTokenInputPrice(msg.value);
        token.transfer(address(this), totalAmt);
        uniExchange.addLiquidity(minTokens,maxTokens,deadline);
        uniExchange.addLiquidity.value(msg.value)(1, totalAmt, 60);
    } 
}   
    
    
// function addLiquidity() public payable {
//        uniswapexchange = UniswapExchangeInterface(uniswapfactory.getExchange(ERC20TokenAddress));
//        uint totalAmount = uniswapexchange.getEthToTokenInputPrice(msg.value);
//        tokenInterface.transfer(address(this), totalAmount);
//        payable(uniswapexchange.addLiquidity(totalAmount, totalAmount, 60)).transfer(msg.value);
//     }
