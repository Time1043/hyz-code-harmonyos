import router from '@ohos.router'
import InputMy from '../components/InputMy'
import TitleComponent from '../components/TitleComponent'

@Entry
@Component
struct Login {
  @State isRegister: boolean = false
  @State countDown: number = 60
  timer: number

  // 发送验证码
  sendCode() {
    this.startCountDown()

    // 使用邮箱验证服务
  }

  // 验证码倒计时
  startCountDown() {
    this.timer = setInterval(() => {
      this.countDown -= 1
      if (this.countDown === 0) {
        // 一轮倒计时结束：countDown、清空
        this.countDown = 60
        clearInterval(this.timer)
      }
    }, 1000)
  }

  build() {
    Flex({ wrap: FlexWrap.Wrap, justifyContent: FlexAlign.Center }) {
      // 标题
      TitleComponent({ title: '登录' })


      Column() {
        // 钱币logo浮在上面的层叠布局
        Stack() {
          Image($r('app.media.Login_icon')).width(88).height(88).offset({ y: -44 })
        }


        // 表单：电子邮箱、密码、验证码
        InputMy({
          title: '电子邮箱',
          icon: $r('app.media.mail_icon'),
          placeholder: '请输入您的邮箱',
          inputType: InputType.Email
        })
        InputMy({
          title: '密码',
          icon: $r('app.media.pwd_icon'),
          placeholder: '请输入您的密码',
          inputType: InputType.Password
        }).margin({ top: 20 })
        // 注册时 验证码
        if (this.isRegister) {
          Column() {
            Text('验证码')
              .width('100%')
              .textAlign(TextAlign.Start)
              .fontSize(16)
              .fontWeight(500)
              .fontColor($r('app.color.font_color'))
              .margin({ bottom: 14 })
              .padding({ left: 10, right: 10 })
            Flex({ alignItems: ItemAlign.Center }) {
              TextInput({ placeholder: '请输入验证码' }).height(50).margin({ right: 10 }).backgroundColor('#FBFBFD')
              Button(this.countDown == 60 ? '发送验证码' : `${this.countDown} s`)
                .onClick(() => {
                  if (this.countDown === 60) { // 倒计时过程中不能再次点击
                    this.sendCode()
                  }
                })
            }
          }.margin({ top: 20 })
        }


        // 按钮：登录、注册
        Flex({ alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {
          Text(this.isRegister ? '注册' : '登录').fontColor(Color.White).fontWeight(500).fontSize(17)
        }
        .width(228)
        .height(50)
        .backgroundColor('#38BFDA')
        .borderRadius(50)
        .margin({ top: 100 })
        .onClick(() => {
          router.replaceUrl({ url: 'pages/MainPage/MainPage' }) // 页面跳转 单向
        })

        Flex({ alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {
          Text(this.isRegister ? '去登陆' : '去注册').fontWeight(500).fontSize(17)
        }
        .width(228)
        .height(50)
        .backgroundColor('#F4F9FF')
        .borderRadius(50)
        .margin({ top: 20 })
        .onClick(() => {
          this.isRegister = !(this.isRegister)
        })
      }
      .width('90%')
      .height('100%')
      .borderRadius(20)
      .backgroundColor(Color.White)
      .margin({ top: 44 })
      .padding({ left: 14, right: 14 })

    }.height('100%').width('100%').backgroundColor($r('app.color.base_background'))
  }
}