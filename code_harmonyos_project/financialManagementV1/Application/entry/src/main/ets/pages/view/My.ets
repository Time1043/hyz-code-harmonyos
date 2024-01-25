import router from '@ohos.router'
import TitleComponent from '../../components/TitleComponent'

@Component
export struct My {
  // 退出登录
  logout = () => {
    router.pushUrl({ url: 'pages/Login' })
  }

  build() {
    Column() {
      // 标题
      TitleComponent({ title: '个人资料' })

      // 上下布局：图像 用户名
      Column() {
        Column() {
          Image($r('app.media.wm')).width(100).height(100).borderRadius(50).position({ y: -65, x: 77 })
          Text('纳米怂').fontSize(19).margin({ top: 50 })
          Text('wangmiao@threebody.com').fontSize(13).fontColor('#002884')
        }
        .margin({ top: 80 })
        .width(254)
        .height(110)
        .backgroundColor(Color.White)
        .borderRadius(20)

        // 编辑个人资料
        Flex({ alignItems: ItemAlign.Center, justifyContent: FlexAlign.SpaceBetween }) {
          Image($r('app.media.edit_icon')).width(24).height(24)
          Text('编辑个人信息').fontColor('#002884')
          Image($r('app.media.Button_right')).width(24).height(24)
        }
        .margin({ top: 32 })
        .padding(15)
        .borderRadius(10)
        .backgroundColor(Color.White)
        .onClick(() => {
          router.pushUrl({ url: 'pages/Info/Main' })
        })

        // 个人二维码
        Flex({ alignItems: ItemAlign.Center, justifyContent: FlexAlign.SpaceBetween }) {
          Image($r('app.media.qrcode_my')).width(24).height(24)
          Text('个人二维码').fontColor('#002884')
          Image($r('app.media.Button_right')).width(24).height(24)
        }
        .margin({ top: 32 })
        .padding(15)
        .borderRadius(10)
        .backgroundColor(Color.White)
        .onClick(() => {
          router.pushUrl({ url: 'pages/Info/QrcodePage' })
        })
      }

      // 按钮：退出登录
      Button('退出登录').margin({ top: 120 }).width(120).backgroundColor('#7AE4ED').onClick(() => {
        this.logout()
      })

    }.padding({ left: 20, right: 20 }).height('100%')
  }
}