@Entry
@Component
struct Index {
  build() {
    Column({ space: 20 }) {
      Text('我的任务').fontSize(30).fontWeight(FontWeight.Bold)

      Stack() {
        Image('images/l3/bg.png').width(338).height(560)

        Column({space:10}) {
          Row() {
            Checkbox()
            Text('推荐算法').margin({ left: 10 })
            Blank()
            Image('images/l3/icon_delete.png').width(20)
          }.width('80%')

          Row() {
            Checkbox()
            Text('白板推导和花书').margin({ left: 10 })
            Blank()
            Image('images/l3/icon_delete.png').width(20)
          }.width('80%')

          Row() {
            Checkbox()
            Text('harmonyos开发').margin({ left: 10 })
            Blank()
            Image('images/l3/icon_delete.png').width(20)
          }.width('80%')

          Row() {
            Checkbox()
            Text('大数据的技术栈').margin({ left: 10 })
            Blank()
            Image('images/l3/icon_delete.png').width(20)
          }.width('80%')

          Row() {
            Checkbox()
            Text('两门必修课').margin({ left: 10 })
            Blank()
            Image('images/l3/icon_delete.png').width(20)
          }.width('80%')

          Row() {
            Checkbox()
            Text('django开发').margin({ left: 10 })
            Blank()
            Image('images/l3/icon_delete.png').width(20)
          }.width('80%')

          Row() {
            Checkbox()
            Text('线性代数').margin({ left: 10 })
            Blank()
            Image('images/l3/icon_delete.png').width(20)
          }.width('80%')

          Row() {
            Checkbox()
            Text('信息论').margin({ left: 10 })
            Blank()
            Image('images/l3/icon_delete.png').width(20)
          }.width('80%')

        }.margin({ top: 70 })

      }.alignContent(Alignment.Top)

      Column() {
        Button({ type: ButtonType.Circle, stateEffect: true }) {
          Text('+').fontSize(50).fontColor(Color.White)
        }.width(60).height(60)
      }.width('100%').alignItems(HorizontalAlign.End)

    }.width('100%').height('100%').padding({ top: 50, left: 20, right: 20, bottom: 20 })
    .backgroundColor(0xBED0DC)
  }
}