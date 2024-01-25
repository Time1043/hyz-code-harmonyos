@Entry
@Component
struct Index {
  @State message: string = 'Hello World' // 状态变量 视图交互

  build() {
    Row() {
      Column() {
        Text(this.message).fontSize(50).fontWeight(FontWeight.Bold).onClick(() => {
          this.message = 'Hello ArkTS'
        })
      }.width('100%')
    }.height('100%')
  }
}