import router from '@ohos.router'

@Component
export struct Header {
  private title: ResourceStr
  @State params: any = router.getParams()

  build() {
    // 标题部分
    Row() {
      Image($r('app.media.ic_public_back')).width(30).margin({ right: 10 }).onClick(() => {
        router.showAlertBeforeBackPage({ message: '支付尚未完成，确定要返回吗' }) // 确定要返回吗
        router.back() // 返回上一页
      })
      if (this.params && this.title) {
        Text(this.params.id + this.title).fontSize(30).fontWeight(FontWeight.Bold)
      }
      Blank() // 空白撑满
      Image($r('app.media.ic_public_refresh')).width(30)
    }.width('100%').height(30)
  }
}