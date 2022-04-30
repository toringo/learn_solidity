### W1-1作业

- [x] 安装 Metamask、并创建好账号  
- [x] 执行一次转账
0xc1090d306d63e0f797355d165dff3139496dd1abc1ad5ee8d1bae89884194fe2
- [x] 使用 Remix 创建任意一个合约
- [x] VSCode IDE 开发环境配置

- [x] 使用 Truffle 部署 Counter 合约 到 test 网络（goerli）（提交交易 hash）
0xf45E5009d40422A94390FEF435e02b0Da18217C7
- [x] 编写一个测试用例

### W1-2作业

- [x] hardhat部署合约Greeter合约
[0x8301218081BEE066A19A2C67B84C7612EFD5B20E675F643E2E3D573E7E5382E1](https://www.oklink.com/zh-cn/okc-test/tx/0x8301218081BEE066A19A2C67B84C7612EFD5B20E675F643E2E3D573E7E5382E1)
- [x] 使用Hardhat部署修改后的Counter
[0x849E38FBECA747C91D914E2956A4CC6BCEC49FFC79953A45103F5302CA5E157F](https://www.oklink.com/zh-cn/okc-test/tx/0x849E38FBECA747C91D914E2956A4CC6BCEC49FFC79953A45103F5302CA5E157F)
- [x] 使用Hardhat测试Counter
`test/sample-script.js`
- [x] 写一个脚本调用count()
`scripts/counter.js`

### W2_1作业

- [x] 编写⼀个Bank合约
- [x] 通过 Metamask 向Bank合约转账ETH
- [x] 在Bank合约记录每个地址转账⾦额
- [x] 编写 Bank合约withdraw(), 实现提取出所有的 ETH

### W2_2作业
* 编写合约Score，⽤于记录学⽣（地址）分数：
   * 仅有⽼师（⽤modifier权限控制）可以添加和修改学⽣分数
   * 分数不可以⼤于 100； 
* 编写合约 Teacher 作为⽼师，通过 IScore 接⼝调⽤修改学⽣分数。


### W3_1作业
* 发⾏⼀个 ERC20 Token： 
  * 可动态增发（起始发⾏量是 0） 
  * 通过 ethers.js. 调⽤合约进⾏转账
* 编写⼀个Vault 合约：
  * 编写deposite ⽅法，实现 ERC20 存⼊ Vault，并记录每个⽤户存款⾦额 ， ⽤从前端调⽤（Approve，transferFrom） 
  * 编写 withdraw ⽅法，提取⽤户⾃⼰的存款 （前端调⽤）
  * 前端显示⽤户存款⾦额

### W3_2作业
* 发行一个 ERC721 Token
   * 使用 ether.js 解析 ERC721 转账事件(加分项：记录到数据库中，可方便查询用户持有的所有NFT)
   * (或)使用 TheGraph 解析 ERC721 转账事件

### W4_1作业
* 部署自己的 ERC20 合约 MyToken
* 编写合约 MyTokenMarket 实现：
   * AddLiquidity():函数内部调用 UniswapV2Router 添加 MyToken 与 ETH 的流动性
   * buyToken()：用户可调用该函数实现购买 MyToken

### W4_2作业
* 在上一次作业的基础上：
   * 完成代币兑换后，直接质押 MasterChef
   * withdraw():从 MasterChef 提取 Token 方法

### W5_1作业
* 以太坊测试网上部署两个自己的ERC20合约MyToken，分别在Uniswap V2、V3(网页上)添加流动性
* 作业：编写合约执行闪电贷（参考V2的ExampleFlashSwap）：
   * uniswapV2Call中，用收到的 TokenA 在 Uniswap V3 的 SwapRouter 兑换为 TokenB 还回到 uniswapV2 Pair 中。