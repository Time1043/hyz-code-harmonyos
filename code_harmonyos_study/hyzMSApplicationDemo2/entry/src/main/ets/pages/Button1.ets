@Preview
@Component
export struct Button1 {
  num: string
  buttonColor: number = 0x333333
  textColor: number = Color.White
  textSize: number = 50

  build() {
    Column() {
      Text(`${this.num}`).fontColor(this.textColor).fontSize(this.textSize).fontWeight(FontWeight.Medium)
    }
    .width(74)
    .height(74)
    .backgroundColor(this.buttonColor)
    .justifyContent(FlexAlign.Center)
    .borderRadius(37)
  }

}