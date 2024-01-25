import { NavItem } from '../type'
import { NarBarImage } from './NarBarImage'

@Component
export struct NavBar {
  @Link currentIndex: number
  nav: NavItem[] = [
    new NavItem($r('app.media.home_icon_select'), $r('app.media.home_icon_normal'), 0),
    new NavItem($r('app.media.data_icon_select'), $r('app.media.data_icon_normal'), -12),
    new NavItem($r('app.media.qrcode_icon'), $r('app.media.qrcode_icon'), 0, true), // 特殊
    new NavItem($r('app.media.wallet_icon_select'), $r('app.media.wallet_icon_normal'), 12),
    new NavItem($r('app.media.user_icon_select'), $r('app.media.user_icon_normal'), 0),
  ]

  build() {
    Flex() {
      ForEach(this.nav, (item: NavItem, index: number) => {
        NarBarImage({ narBarItem: item, isSelect: this.currentIndex === index })
          .offset({ x: item.x, y: item.qrCode ? -30 : 0 })
          .onClick(() => {
            this.currentIndex = index
            // console.log(index + ' ' + this.currentIndex) // 断点排错
          })
      })
    }.height(60).width('100%').backgroundImage($r('app.media.subtract')).backgroundImageSize(ImageSize.Cover)
  }
}