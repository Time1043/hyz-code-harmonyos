import router from '@ohos.router'

class RouterInfo {
  url: string // 路由路径
  title: string // 页面标题

  constructor(url: string, title: string) {
    this.url = url
    this.title = title
  }
}


@Entry
@Component
struct Index {
  @State message: string = '页面列表'
  private routers: RouterInfo[] = [
    new RouterInfo('pages/ImagePage', '图片查看案例'),
    new RouterInfo('pages/ItemPage', '商品列表案例'),
    new RouterInfo('pages/StatePage', '朋友列表案例'),
    new RouterInfo('pages/PropPage', '任务列表案例'),
    new RouterInfo('pages/AnimationPage', '小鱼动画案例'),
  ]

  build() {
    Row() {
      Column() {
        Text(this.message).fontSize(50).fontWeight(FontWeight.Bold).height(80)
        List({ space: 15 }) {
          ForEach(this.routers, (routerInfo: RouterInfo, index) => {
            ListItem() {
              this.RouterItem(routerInfo, index + 1)
            }
          })
        }.layoutWeight(1).alignListItem(ListItemAlign.Center).width('100%')
      }.width('100%')
    }.height('100%')
  }

  @Builder RouterItem(routerInfo: RouterInfo, index: number) {
    Row() {
      Text(index + '.').fontSize(20).fontColor(Color.White)
      Blank()
      Text(routerInfo.title).fontSize(20).fontColor(Color.White)
    }
    .width('90%')
    .padding(12)
    .backgroundColor('#38f')
    .borderRadius(20)
    .shadow({ radius: 6, color: '#4F000000', offsetX: 2, offsetY: 2 })
    .onClick(() => {
      router.pushUrl(
        { url: routerInfo.url, params: { id: index }, },
        router.RouterMode.Single,
        err => {
          if (err) {
            console.log(`路由失败，errCode：${err.code}，errMsg：${err.message}`)
          }
        }
      )
    })
  }
}