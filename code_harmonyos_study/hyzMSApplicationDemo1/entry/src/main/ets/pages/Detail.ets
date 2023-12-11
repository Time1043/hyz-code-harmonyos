import router from '@ohos.router'

@Entry
@Component
struct Detail {
  @State bird: number = router.getParams()['bird']
  months: Array<string> = ['一月', '二月', '三月', '四月', '五月', '六月', '七月', '八月', '九月', '十月', '十一月', '十二月']

  build() {
    Column() {

      Column() {
        Image('images/l2/icon_back.png').width('30')
      }.width('90%').alignItems(HorizontalAlign.Start).margin({ top: 30 })
      .onClick(() => {
        router.back()
      })

      Stack() {
        Image('images/l2/hb_bg.png').width(299).margin({ top: 50 }).borderRadius(10)

        Column() {
          Column({ space: 7 }) {
            Text(`${this.months[this.bird-1]}早鸟`).fontSize(22).fontWeight(FontWeight.Bolder).fontColor(0xFF2F57)
            Text('授予朝气蓬勃的你').fontSize(11).fontColor(0xFF513E)
            Image(`images/bird/bird${this.bird}.png`).width(80)
            Text('获奖者').fontSize(11).fontWeight(FontWeight.Bold).fontColor(0xFF513E)
            Text('周坚深').fontSize(18).fontWeight(FontWeight.Bolder).fontColor(0xFF4468)
            Text('2023年12月11日').fontSize(10).fontWeight(FontWeight.Medium).fontColor(0xFF4468)
          }.margin({ top: 130 })

          Row({ space: 5 }) {
            Image('images/bird/bird1.png').width(50).opacity(0.5)
            Image('images/bird/bird2.png').width(50).opacity(0.5)
            Image('images/bird/bird3.png').width(50).opacity(0.5)
            Image('images/bird/bird4.png').width(50).opacity(0.5)
            Image('images/bird/bird5.png').width(50).opacity(0.5)
          }.margin({ top: 150 })
        }

      }.alignContent(Alignment.Top)

    }.width('100%').height('100%').backgroundColor(Color.Black)
  }
}