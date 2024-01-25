@Component
export struct BankCard {
  empty = true // 银行卡是否为空
  bank = '中国银行' // 卡所属银行
  cardNumber = 'XX XXX XXX XXXX XXXX XX' // 卡号
  expiredAt = 'XX/XX' // 卡时间
  amount = '0000,0000' // 卡金额

  build() {
    Column() {
      Flex({ justifyContent: FlexAlign.SpaceBetween, alignItems: ItemAlign.Center }) {
        Text(this.empty ? '' : this.bank).fontColor(Color.White).fontSize(14)
        Image($r('app.media.card_icon')).width(35).height(28)
      }

      if (this.empty) {
        // 银行卡为空
        Text('暂无银行卡，请开通').fontSize(20).fontColor(Color.White).margin({ top: 50 })
      } else {
        Flex({ justifyContent: FlexAlign.Start, alignItems: ItemAlign.Center }) {
          Text('￥').fontSize(11).fontColor(Color.White).fontWeight(700)
          Text(this.amount).fontSize(24).fontWeight(700).fontColor(Color.White)
        }.margin({ top: 30 })

        Flex({ justifyContent: FlexAlign.Start }) {
          Text(this.cardNumber).fontColor(Color.White) // 银行卡号
          Text(this.expiredAt).fontColor(Color.White).margin({ left: 35 }) // 开卡日期
        }.margin({ top: 20 })
      }


    }
    .width('100%')
    .height(178)
    .backgroundColor('#7AE4ED')
    .borderRadius(20)
    .padding(20)
    .margin({ left: 5, right: 5 })
  }
}