import { BankCard } from '../../components/BankCard'
import InputMy from '../../components/InputMy'
import TitleComponent from '../../components/TitleComponent'

@Entry
@Component
struct Add {
  build() {
    Scroll() {
      Flex({ wrap: FlexWrap.Wrap, justifyContent: FlexAlign.Center }) {
        // 标题
        TitleComponent({ title: '添加新的银行卡', isBack: true })

        // 银行卡
        BankCard()

        // 卡片信息
        Flex({ justifyContent: FlexAlign.Start, direction: FlexDirection.Column }) {
          Text('卡片信息').fontColor('#001749').fontSize(21).fontWeight(500)
          // 表单
          Column({ space: 20 }) {
            InputMy({ title: '所属银行', placeholder: '请输入所属银行', inputType: InputType.Normal })
            InputMy({ title: '银行卡号', placeholder: 'XX XXX XXX XXXX XXXX XX', inputType: InputType.Normal })
            InputMy({ title: '持卡人姓名', placeholder: '输入您的姓名', inputType: InputType.Normal })
            Flex() {
              InputMy({ title: 'CCV', placeholder: '2544', inputType: InputType.Number })
              InputMy({ title: '到期时间', placeholder: '2024-01-24', inputType: InputType.Number })
            }

          }.margin({ top: 20 })

          // 添加银行卡按钮
          Flex({ alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {
            Text('添加银行卡')
              .fontColor(Color.White)
              .fontWeight(500)
              .fontSize(17)
              .width(228)
              .height(50)
              .backgroundColor('#38BFDA')
              .borderRadius(50)
              .textAlign(TextAlign.Center)
          }.margin({ top: 40, bottom: 30 })
        }.margin({ top: 30 })

      }.padding({ left: 20, right: 20 }).backgroundColor($r('app.color.base_background'))
    }
  }
}