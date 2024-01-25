@Observed
export class NavItem {
  selectImg: Resource // 选中时的图片
  normalImg: Resource // 未选中的图片
  x: number // 样式小调
  qrCode: boolean // 特殊 是否是二维码
  isSelect: boolean // 当前是否选中

  constructor(selectImg: Resource, normalImg: Resource, x: number, qrCode = false, isSelect = false) {
    this.selectImg = selectImg
    this.normalImg = normalImg
    this.x = x
    this.qrCode = qrCode
    this.isSelect = isSelect
  }

}
