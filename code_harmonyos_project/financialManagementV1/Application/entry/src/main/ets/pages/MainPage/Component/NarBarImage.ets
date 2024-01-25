import { NavItem } from '../type'

@Component
export struct NarBarImage {
  @ObjectLink narBarItem: NavItem
  @Prop isSelect: boolean

  build() {
    Column() {
      Image(this.isSelect ? this.narBarItem.selectImg : this.narBarItem.normalImg)
        .size({ width: this.narBarItem.qrCode ? 54 : 25, height: this.narBarItem.qrCode ? 54 : 25 })
    }.width('100%').height(60).justifyContent(FlexAlign.Center)
  }
}