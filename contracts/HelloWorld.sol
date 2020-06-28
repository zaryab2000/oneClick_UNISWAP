pragma solidity >=0.4.21 <0.7.0;

import "./UniInterface.sol";
import "./ERC20.sol";

//UniswapTest.deployed().then((instance)=>{app = instance;})
contract UniswapTest{

    ERC20 public token;
    bool result;
    address public tokenAddress;
    address public exchangeAddress;
    uint256 public maxTokens = 600*10**18;
    uint public minTokens = 1;
    uint256 public deadline = 1742680400;
    
    constructor() public{
            token = new ERC20("Putu","PU",18,5000000000000000000000);
        }

   //  function setTokenAddress() public{
   //     tokenAddress = address(token);
   // }
    
     function giveTokenAddress() public view returns(address){
        return tokenAddress;
     }

    

     function  getContractBalance() public view returns(uint256){
         return address(this).balance;
     }
     
     function approve(uint256 _value) public returns(bool res){
         res = token.approve(address(this),_value);
     }
     

     function sendMoney() public payable{
         token.transferFrom(msg.sender, address(this),msg.value);
     }
     

     

      //Creates a New UNISWAP Exchange for the Newly created ERC20 Token
      function createPool() public{
         tokenAddress = address(token);
         UniswapFactoryInterface uniFactory = UniswapFactoryInterface(0x9c83dCE8CA20E9aAF9D3efc003b2ea62aBC08351);
         uniFactory.createExchange(tokenAddress);
         address resultex = uniFactory.getExchange(tokenAddress);
         exchangeAddress = resultex;
        
 }    

     //Returns the Address for the Uniswap Exchange created w.r.t the ERC20 token.
     //If this function returns an address, it is verified that the New Exchange
     //has been created successfully.
     function getExchangeAddress() public view returns(address) {
         return exchangeAddress;
     }


    function  liquidate() external payable{
        UniswapExchangeInterface uniExchange = UniswapExchangeInterface(exchangeAddress);
        uint totalAmt = uniExchange.getEthToTokenOutputPrice(msg.value);
        token.approve(exchangeAddress,totalAmt);
        token.transferFrom(msg.sender,address(this),totalAmt);
        uniExchange.addLiquidity.value(msg.value)(minTokens,maxTokens, now + 600);

    }


     
}   
    
