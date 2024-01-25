import router from '@ohos.router'

@Component
export default struct TitleComponent {
  @Prop title: string
  isBack = false // 是否有返回按钮

  // 返回上一页
  back = () => {
    router.back()
  }

  build() {
    Flex({ justifyContent: FlexAlign.SpaceBetween, alignItems: ItemAlign.Center }) {
      Image(this.isBack ? $r('app.media.Button_left') : '').width(25).height(25).objectFit(ImageFit.ScaleDown)
        .onClick(() => {
          this.back()
        })

      Text(this.title).fontColor('rgb(1,23,73)').fontWeight(700).fontSize(20)

      Text('').width(44).height(44) // 占位

    }.padding({  top: 12, bottom: 12 })
  }
}