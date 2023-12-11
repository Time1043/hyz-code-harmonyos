import router from '@ohos.router'

@Entry
@Component
struct Index {
  // 面向状态：假则暗 真则亮
  @State birdOp1: boolean = false
  @State birdOp2: boolean = false
  @State birdOp3: boolean = false
  @State birdOp4: boolean = false
  @State birdOp5: boolean = false
  @State birdOp6: boolean = false

  build() {
    Column({ space: 30 }) {

      Stack() {
        Image('images/bird/icon_title.png').width('90%')
        Text('早鸟勋章')
      }

      Row({ space: 30 }) {
        Column({ space: 10 }) {
          Image('images/bird/bird1.png').width(80)
          Text('一月早鸟').fontColor(Color.White)
        }.opacity(this.birdOp1 ? 1 : 0.3)
        .onClick(() => {
          /*this.birdOp1 = !this.birdOp1*/
          router.pushUrl({ url: 'pages/Detail', params: { 'bird': 1 } })
        })

        Column({ space: 10 }) {
          Image('images/bird/bird2.png').width(80)
          Text('二月早鸟').fontColor(Color.White)
        }.opacity(this.birdOp2 ? 1 : 0.3)
        .onClick(() => {
          /*this.birdOp2 = !this.birdOp2*/
          router.pushUrl({ url: 'pages/Detail', params: { 'bird': 2 } })
        })

        Column({ space: 10 }) {
          Image('images/bird/bird3.png').width(80)
          Text('三月早鸟').fontColor(Color.White)
        }.opacity(this.birdOp3 ? 1 : 0.3)
        .onClick(() => {
          /*this.birdOp3 = !this.birdOp3*/
          router.pushUrl({ url: 'pages/Detail', params: { 'bird': 3 } })
        })
      }

      Row({ space: 30 }) {
        Column({ space: 10 }) {
          Image('images/bird/bird4.png').width(80)
          Text('四月早鸟').fontColor(Color.White)
        }.opacity(this.birdOp4 ? 1 : 0.3)
        .onClick(() => {
          /*this.birdOp4 = !this.birdOp4*/
          router.pushUrl({ url: 'pages/Detail', params: { 'bird': 4 } })
        })

        Column({ space: 10 }) {
          Image('images/bird/bird5.png').width(80)
          Text('五月早鸟').fontColor(Color.White)
        }.opacity(this.birdOp5 ? 1 : 0.3)
        .onClick(() => {
          this.birdOp5 = !this.birdOp5
        })

        Column({ space: 10 }) {
          Image('images/bird/bird6.png').width(80)
          Text('六月早鸟').fontColor(Color.White)
        }.opacity(this.birdOp6 ? 1 : 0.3)
        .onClick(() => {
          this.birdOp6 = !this.birdOp6
        })
      }

    }.width('100%').height('100%').justifyContent(FlexAlign.Center).backgroundColor(Color.Black)
  }
}