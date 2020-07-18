pragma solidity >=0.4.21 <0.7.0;

import "./UniInterface.sol";
import "./ERC20.sol";

//UniswapTest.deployed().then((instance)=>{app = instance;})
contract UniswapTest{

    ERC20 public token;
    bool result;
    address public tokenAddress;
    address public exchangeAddress;
   
 
    
     function giveTokenAddress() public view returns(address){
        return tokenAddress;
     }

     function  getContractBalance() public view returns(uint256){
         return address(this).balance;
     }

     
      //Creates a New UNISWAP Exchange for the Newly created ERC20 Token
      function createPool(string memory _name,string memory _symbol,uint8 _decimal,uint256 _totalAmount) public{
         uint256 totalNewAmount = _totalAmount * 1000000000000000000;
         token = new ERC20(_name,_symbol,_decimal,totalNewAmount);
         tokenAddress = address(token);
         UniswapFactoryInterface uniFactory = UniswapFactoryInterface(0x9c83dCE8CA20E9aAF9D3efc003b2ea62aBC08351);
         uniFactory.createExchange(tokenAddress);
        
 }    

     //Returns the Address for the Uniswap Exchange created w.r.t the ERC20 token.
     //If this function returns an address, it is verified that the New Exchange
     //has been created successfully.
     function getExchangeAddress() public returns(address) {
         UniswapFactoryInterface uniFactory = UniswapFactoryInterface(0x9c83dCE8CA20E9aAF9D3efc003b2ea62aBC08351);
         exchangeAddress = uniFactory.getExchange(tokenAddress);
         return exchangeAddress;
     }


    // function swapToken() external payable{
    //      UniswapExchangeInterface uniExchange = UniswapExchangeInterface(exchangeAddress);
    //      uint totalAmt = uniExchange.getEthToTokenInputPrice(msg.value);
    //      uniExchange.ethToTokenTransferInput.value(msg.value)(totalAmt,now+120,msg.sender);
    //  }
//   function  liquidate() external payable{
//         UniswapExchangeInterface uniExchange = UniswapExchangeInterface(exchangeAddress);
//         uint totalAmt = uniExchange.getEthToTokenOutputPrice(msg.value);
//         token.approve(address(this),totalAmt);
//         token.transferFrom(msg.sender,address(this),totalAmt);
//         token.approve(exchangeAddress,totalAmt);
//         uniExchange.addLiquidity.value(msg.value)(minTokens,maxTokens, now + 600);
//     }


     
}   
    

   

