import TitleComponent from '../../components/TitleComponent'
import { PayDialog } from './PayDialog'

@Entry
@Component
struct PayMain {
  // 弹框
  dialogController: CustomDialogController = new CustomDialogController({
    builder: PayDialog(),
    alignment: DialogAlignment.Bottom,
    customStyle: true
  })

  // 在页面刚开始打开弹框
  onPageShow() {
    this.dialogController.open()
  }

  build() {
    Flex({ wrap: FlexWrap.Wrap, justifyContent: FlexAlign.Center }) {
      // 标题
      TitleComponent({ title: '支付' })
    }.width('100%').height('100%').backgroundColor($r('app.color.base_background'))
  }
}