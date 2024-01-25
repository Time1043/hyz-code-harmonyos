import router from '@ohos.router'
import { BankCard } from '../../components/BankCard'
import TitleComponent from '../../components/TitleComponent'

@Component
export struct Wallet {
  arr = [1, 2, 3, 4, 5, 6, 7, 8, 9]

  build() {
    Column() {
      // 标题
      TitleComponent({ title: '钱包' })
      // 添加按钮
      Flex({ justifyContent: FlexAlign.End }) {
        Image($r('app.media.add_icon')).width(25).height(25).onClick(() => {
          router.pushUrl({url:'pages/Bank/Add'})
        })
      }

      // 银行卡 横向轮播
      Swiper() {
        BankCard()
        BankCard()
        BankCard()
      }.loop(true).indicatorStyle({ size: 30, color: '#07E1E8', selectedColor: '#D7E1E8' }).margin({ top: 30 })

      // 最近联系
      Flex({ justifyContent: FlexAlign.Start, direction: FlexDirection.Column }) {
        Text('最近联系').fontSize(21).fontColor('#011749').fontWeight(500)
        // 各个联系人
        Flex() {
          Scroll() {
            Row() {
              Column() {
                Image($r('app.media.wm')).width(60).height(60).borderRadius(30)
                Text('纳米怂').fontSize(12).fontColor('#011749').margin({ top: 10 })
              }.margin({ left: 10, right: 10 })

              Column() {
                Image($r('app.media.wm')).width(60).height(60).borderRadius(30)
                Text('纳米怂').fontSize(12).fontColor('#011749').margin({ top: 10 })
              }.margin({ left: 10, right: 10 })

              Column() {
                Image($r('app.media.wm')).width(60).height(60).borderRadius(30)
                Text('纳米怂').fontSize(12).fontColor('#011749').margin({ top: 10 })
              }.margin({ left: 10, right: 10 })

              Column() {
                Image($r('app.media.wm')).width(60).height(60).borderRadius(30)
                Text('纳米怂').fontSize(12).fontColor('#011749').margin({ top: 10 })
              }.margin({ left: 10, right: 10 })

              Column() {
                Image($r('app.media.wm')).width(60).height(60).borderRadius(30)
                Text('纳米怂').fontSize(12).fontColor('#011749').margin({ top: 10 })
              }.margin({ left: 10, right: 10 })

              Column() {
                Image($r('app.media.wm')).width(60).height(60).borderRadius(30)
                Text('纳米怂').fontSize(12).fontColor('#011749').margin({ top: 10 })
              }.margin({ left: 10, right: 10 })
            }.padding({ bottom: 15 })
          }.scrollable(ScrollDirection.Horizontal)
        }.margin({ top: 20 })
      }.margin({ top: 35 })

      // 交易信息
      Flex({ justifyContent: FlexAlign.Start, direction: FlexDirection.Column }) {
        Text('交易信息').fontSize(21).fontColor('#011749').fontWeight(500).width('100%')

        ForEach(this.arr, (item) => {
          // 一条交易信息
          Flex() {
            // 头像  用户名和时间
            Flex() {
              Image($r('app.media.wm')).width(44).height(44).borderRadius(22)
              Flex({ direction: FlexDirection.Column }) {
                Text('纳米怂').fontColor('#001749').fontSize(16)
                Text('2024年1月24日 22:30').fontColor('#ddd').fontSize(12).margin({ top: 5 })
              }.padding({ left: 20 })
            }
            // 转账金额
            Text('1,0000')
              .width(120)
              .padding(10)
              .backgroundColor('#f5ecf0')
              .fontSize(14)
              .fontColor('#ff4377')
              .textAlign(TextAlign.Center)
              .borderRadius(20)
          }
          .border({ width: { bottom: 1 }, color: 'rgba(99,95,95,0.05)' })
          .padding({ top: 12, bottom: 12, left: 8, right: 8 }).margin({ top: 20 }).backgroundColor('#fff')
        })

      }.margin({ top: 35 })
    }.padding({ left: 20, right: 20 })
  }
}