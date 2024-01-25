import router from '@ohos.router'
import InputMy from '../../components/InputMy'
import TitleComponent from '../../components/TitleComponent'

@Entry
@Component
struct Main {
  build() {
    Column() {
      // 标题
      TitleComponent({ title: '编辑个人资料', isBack: true })

      // 头像
      Column() {
        Image($r('app.media.wm')).width(100).height(100).borderRadius(50)
      }

      // 个人信息
      Flex({ justifyContent: FlexAlign.Start }) {
        Text('个人信息').fontSize(21).fontWeight(700).textAlign(TextAlign.Start)
      }.margin({ top: 30 })

      // 表单信息
      Column({ space: 20 }) {
        InputMy({ title: '用户名' })
        InputMy({ title: '联系电话', inputType: InputType.PhoneNumber })
        InputMy({ title: '邮箱' })
        InputMy({ title: '出生日期' })
      }.margin({ top: 20 })

      // 按钮：保存、取消
      Flex() {
        Button('取消')
          .backgroundColor('#FBFBFD')
          .fontColor('#ffb7b1b1')
          .width(140)
          .margin({ right: 20 })
          .onClick(() => {
            router.back()
          })
        Button('保存').backgroundColor('#7AE4ED').fontColor(Color.White).width(140).margin({ left: 20 })
      }.margin({ top: 20 })

    }.padding({ left: 20, right: 20 }).backgroundColor($r('app.color.base_background')).height('100%')

  }
}