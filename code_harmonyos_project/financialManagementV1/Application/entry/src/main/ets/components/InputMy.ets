@Component
export default struct InputMy {
  @State isFocus: boolean = false // 是否聚焦
  title: string // 标题
  icon: Resource // 输入框图标
  placeholder: string // 输入框提示语
  inputType: InputType = InputType.Normal // 输入框类型

  build() {
    Column() {
      // 标题
      Text(this.title)
        .width('100%')
        .textAlign(TextAlign.Start)
        .fontSize(16)
        .fontWeight(500)
        .fontColor($r('app.color.font_color'))
        .margin({ bottom: 14 })

      // 输入框
      Flex({ alignItems: ItemAlign.Center }) {
        if (this.icon) { // 有图标显示 没图标隐藏
          Image(this.icon).width(30).height(30)
        }
        TextInput({ placeholder: this.placeholder })
          .placeholderColor('rgba(0,40,132,0.6)')
          .backgroundColor('#FBFBFD')
          .style(TextInputStyle.Inline)
          .width('100%')
          .type(this.inputType)
          .onFocus(() => {
            this.isFocus = true
          })
          .onBlur(() => {
            this.isFocus = false
          })
      }
      .height(50)
      .width('100%')
      .padding({ left: 10, right: 10 })
      .borderRadius(10)
      .border({ width: this.isFocus ? 2 : 0, color: '#002884' })
    }
  }
}