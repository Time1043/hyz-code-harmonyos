@Entry
@Component
struct Demo1 {
  @State imageWidth: number = 100

  build() {
    Column() {
      Row() {
        Image($r("app.media.icon"))
          .width(this.imageWidth)
          .interpolation(ImageInterpolation.High)
      }
      .width("90%")
      .height("400")
      .justifyContent(FlexAlign.Center)

      Row() {
        Text($r("app.string.width_label"))
          .lineHeight(25)
          .fontSize(20)
          .fontColor("#ff1876f8")
          .fontWeight(FontWeight.Medium)

        TextInput({ text: this.imageWidth.toFixed(0) })
          .width("60%")
          .backgroundColor("#FFF")
          .type(InputType.Number)
          .onChange((value: string) => {
            this.imageWidth = parseInt(value)
          })
      }
      .width("100%")
      .justifyContent(FlexAlign.SpaceBetween)
      .padding({ left: 14, right: 14, top: 4, bottom: 4 })

      Divider()
        .width("90%")

      Row() {
        Button("缩小")
          .width(80)
          .fontSize(20)
          .onClick(() => {
            if (this.imageWidth > 10) {
              this.imageWidth -= 10
            }
          })

        Button("放大")
          .width(80)
          .fontSize(20)
            // .type(ButtonType.Capsule)
          .onClick(() => {
            if (this.imageWidth < 300) {
              this.imageWidth += 10
            }
          })
      }
      .width("100%")
      .justifyContent(FlexAlign.SpaceEvenly)
      .margin(30)

      Slider({
        min: 10,
        max: 300,
        value: this.imageWidth,
        step: 10,
        style: SliderStyle.OutSet,
        direction: Axis.Horizontal,
        reverse: false
      })
        .width("90%")
        .showTips(true)
        .blockColor("#36D")
        .trackThickness(7)
        .onChange((value: number) => {
          this.imageWidth = value
        })
    }
    .width("100%")
    .height("100%")
    .alignItems(HorizontalAlign.Center)
  }
}