import { DataStatistics } from '../view/DataStatistics'
import { Home } from '../view/Home'
import { My } from '../view/My'
import { Wallet } from '../view/Wallet'
import { NavBar } from './Component/NavBar'

// 临时测试 滚动不要遮住其他
const arr = []
for (let i = 0;i < 50; i++) {
  arr.push(i)
}


@Entry
@Component
struct MainPage {
  @State currentIndex: number = 0

  build() {
    Column() {
      // 各个页面的内容：首页、数据分析页面、钱包页面  【滚动】
      /*Scroll() {
        Column() {
          ForEach(arr, (item) => {
            Text(item + ' ').height(20).width('100%').backgroundColor(Color.White)
          })
        }
      }.padding({ bottom: 100 })*/
      Scroll() {
        if (this.currentIndex === 0) {
          Home() // 首页
        }

        if (this.currentIndex === 1) {
          DataStatistics() // 数据分析页
        }

        if (this.currentIndex === 3) {
          Wallet() // 钱包页面
        }

        if (this.currentIndex === 4) {
          My() // 用户中心
        }

      }.padding({ bottom: 100 })

      // 底部导航栏
      NavBar({ currentIndex: $currentIndex }).offset({ y: -60 })

    }.height('100%').justifyContent(FlexAlign.SpaceBetween).backgroundColor($r('app.color.base_background'))

  }
}