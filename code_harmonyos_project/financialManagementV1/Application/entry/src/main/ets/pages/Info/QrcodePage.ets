import TitleComponent from '../../components/TitleComponent'

@Entry
@Component
struct QrcodePage {
  build() {
    Column() {
      // 标题
      TitleComponent({ title: '个人二维码', isBack: true })

      // 生成二维码
      QRCode('1').margin({ top: 40 })

    }.padding({ left: 20, right: 20 }).backgroundColor($r('app.color.base_background')).height('100%')
  }
}