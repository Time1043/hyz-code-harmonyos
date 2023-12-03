// 导入页面路由模块
import router from '@ohos.router';

@Entry
@Component
struct Index {
  @State message: string = 'Hello World'

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)

        // 添加按钮
        Button() {
          Text('Next')
            .fontSize(30)
            .fontWeight(FontWeight.Bold)
        }
        .type(ButtonType.Capsule)
        .margin({
          top: 20
        })
        .backgroundColor('#0D9FFB')
        .width('40%')
        .height('5%')
        .onClick(() => {
          console.info('succeeded in clicking the next button.')
          router.pushUrl({ url: 'pages/Second' }).then(() => {
            console.info('succeeded in jumping to the second page.')
          }).catch((err) => {
            console.error('failed to jump to the second page.Code is ${err.code}, message is ${err.message}')
          })
        })

      }
      .width('100%')
    }
    .height('100%')
  }
}