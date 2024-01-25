import router from '@ohos.router'
import InputMy from '../../components/InputMy'

@CustomDialog
export struct PayDialog {
  controller: CustomDialogController

  // 支付的银行卡数组
  getCardOptions() {
    return [{ value: '中原银行(xxx)' }, { value: '南越银行(xxx)' }, { value: '北燕银行(xxx)' }]
  }

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center }) {
      // 付款给
      Text('付款给')
        .fontSize(20)
        .fontWeight(500)
        .padding({ top: 20, bottom: 20 })
        .textAlign(TextAlign.Center)
        .width('100%')
        .border({ width: { bottom: 1 }, color: '#ddd' })

      // 付款给那谁
      Column({ space: 10 }) {
        Text('中原银行').fontSize(20).fontWeight(500)
        Text('wangmiao@tb.com').fontSize(14).fontWeight(400).fontColor('#ddd')
      }
      .width(200)
      .height(100)
      .padding(20)
      .shadow({ radius: 40, color: '#ddd' })
      .margin({ top: 20 })

      Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Start }) {
        // 支付账户：选择银行卡
        Text('支付账户').fontSize(20).fontWeight(500).textAlign(TextAlign.Start)
        Flex({ justifyContent: FlexAlign.SpaceBetween, alignItems: ItemAlign.Center }) {
          Image($r('app.media.bank_icon')).width(30).height(20)
          Select(this.getCardOptions())
            .selected(0)
            .value('中原银行(xxx)')
            .font({ size: 16, weight: 500 })
            .selectedOptionFont({ size: 16, weight: 400 })
            .optionFont({ size: 16, weight: 400 })
        }.width('100%').margin({ top: 20, bottom: 20 }).shadow({ radius: 40, color: '#ddd' }).padding(20)

        // 支付金额
        Text('支付金额').textAlign(TextAlign.Start).fontSize(20).fontWeight(500).margin({ bottom: 20 })
        Text('￥ 0.01').fontSize(20).width('100%').textAlign(TextAlign.Center).fontSize(30)

        // 用户订单信息
        Column({ space: 20 }) {
          InputMy({ title: '用户订单姓名', placeholder: '请输入您的姓名' })
          InputMy({ title: '用户订单电话', placeholder: '请输入您的电话' })
        }.margin({ top: 20 }).border({ width: { top: 1 }, color: '#ddd' }).padding({ top: 20 })

        // 按钮：确认支付
        Flex({ justifyContent: FlexAlign.Center }) {
          Button('取消')
            .backgroundColor('#FBFBFD')
            .fontColor('#ffb7b1b1')
            .width(120)
            .margin({ right: 20 })
            .onClick(() => {
              router.back()
            })
          Button('确定支付').backgroundColor('#7AE4ED').width(120).margin({ left: 20 })
        }.margin({ top: 20, bottom: 20 })
      }.margin({ top: 20 }).padding({ left: 20, right: 20 }).width('100%')

    }
    .width('100%')
    .height('100%')
    .backgroundColor(Color.White)
    .margin({ top: 80 })
    .borderRadius({ topLeft: 20, topRight: 20 })
  }
}