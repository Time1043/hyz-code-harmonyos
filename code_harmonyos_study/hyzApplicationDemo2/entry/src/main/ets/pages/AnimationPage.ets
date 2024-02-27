import router from '@ohos.router'

@Entry
@Component
struct AnimationPage {
  // 小雨的坐标 角度 图片
  @State fishX: number = 200
  @State fishY: number = 180
  @State angle: number = 0
  @State src: Resource = $r('app.media.fish')
  // 是否开始游戏
  @State isBegin: boolean = false

  build() {
    Row() {
      Stack() {
        // 返回按钮
        Button('返回').position({ x: 0, y: 0 }).backgroundColor('#20201010').onClick(() => {
          router.back() // 返回上一页
        })

        if (!this.isBegin) {
          // 开始按钮
          Button('开始游戏').onClick(() => {
            this.isBegin = true // 点击后显示小雨
          })
        } else {
          // 小鱼图片
          Image(this.src)
            .position({ x: this.fishX - 20, y: this.fishY - 20 })
            .rotate({ angle: this.angle, centerX: '50%', centerY: '50%' })
            .width(40).height(40)

          // 操作按钮
          Row() {
            Button('←').backgroundColor('#20101010').onClick(() => {
              this.fishX -= 20
            })
            Column({ space: 40 }) {
              Button('↑').backgroundColor('#20101010').onClick(() => {
                this.fishY -= 20
              })
              Button('↓').backgroundColor('#20101010').onClick(() => {
                this.fishY += 20
              })
            }

            Button('→').backgroundColor('#20101010').onClick(() => {
              this.fishX += 20
            })

          }.height(240).width(240).justifyContent(FlexAlign.Center).position({ x: 0, y: 120 })
        }
      }.height('100%').width('100%')
    }
    .height('100%').width('100%')
    .backgroundImage($r('app.media.sea'))
    .backgroundImageSize({ height: '105%', width: '100%' })
  }
}