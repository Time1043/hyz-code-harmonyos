import { Header } from '../components/CommonComponents'

class Item {
  name: string
  image: ResourceStr
  price: number
  discount: number // 折扣

  constructor(name: string, image: ResourceStr, price: number, discount: number = 0) {
    this.name = name
    this.image = image
    this.price = price
    this.discount = discount
  }
}

/*// 全局的自定义构建函数
@Builder function ItemCard(item: Item) {
  Row({ space: 10 }) {
    Image(item.image).width(100)
    Column({ space: 4 }) {
      Text(item.name).fontSize(20).fontWeight(FontWeight.Bold)

      // 价格 判断
      if (!item.discount) {
        Text("￥ " + item.price).fontColor("#F36").fontSize(18)
      } else {
        Text("原价：￥" + item.price)
          .fontColor("#CCC")
          .fontSize(14)
          .decoration({ type: TextDecorationType.LineThrough })
        Text("折扣价：￥" + (item.price - item.discount)).fontColor("#F36").fontSize(18)
        Text("补贴：￥" + item.discount).fontColor("#F36").fontSize(18)
      }

    }.height("100%").alignItems(HorizontalAlign.Start)
  }
  .width("100%")
  .backgroundColor("#FFF")
  .borderRadius(20)
  .height(120)
  .padding(10)
}*/

/*// 全局自定义公共样式
@Styles function fillScreen() {
  .width("100%").height("100%").backgroundColor('#EFEFEF').padding(20)
}*/

// 全局自定义公共样式：组件特有的 不能写局部
@Extend(Text) function priceText() {
  .fontColor("#F36").fontSize(18)
}

@Entry
@Component
struct ItemPage {
  // 内局自定义公共样式
  @Styles fillScreen() {
    .width("100%").height("100%").backgroundColor('#EFEFEF').padding(20)
  }

  // 商品列表数据
  private items: Array<Item> = [
    new Item('华为Mate60', $r('app.media.mate60'), 6999, 500),
    new Item('MateBookProX', $r('app.media.mateBookProX'), 13999),
    new Item('WatchGT4', $r('app.media.watchGT4'), 1438, 100),
    new Item('FreeBuds Pro3', $r('app.media.freeBudsPro3'), 1499),
    new Item('Mate X5', $r('app.media.mateX5'), 12999, 500),
    new Item('华为Mate60', $r('app.media.mate60'), 6999, 500),
    new Item('MateBookProX', $r('app.media.mateBookProX'), 13999),
    new Item('WatchGT4', $r('app.media.watchGT4'), 1438, 100),
    new Item('FreeBuds Pro3', $r('app.media.freeBudsPro3'), 1499),
    new Item('Mate X5', $r('app.media.mateX5'), 12999, 500)
  ]

  build() {
    Column({ space: 8 }) {
      // 标题
      Header({ title: '商品列表' }).margin({ bottom: 20 })

      // 列表布局：数据多了可以滚动  List ListItem
      List({ space: 10 }) {
        // foreach
        ForEach(this.items, (item: Item, index) => {
          ListItem() {
            // 一个列表项：适应循环、不能写死数据
            // ItemCard(item)  // 全局 调用
            this.ItemCard(item) // 局部 调用
          }
        })
      }.width('100%').listDirection(Axis.Vertical).layoutWeight(1) // 剩余高度

    }.fillScreen()
  }

  // 内部的自定义构建函数 不加关键字function
  @Builder ItemCard(item: Item) {
    Row({ space: 10 }) {
      Image(item.image).width(100)
      Column({ space: 4 }) {
        Text(item.name).fontSize(20).fontWeight(FontWeight.Bold)

        // 价格 判断
        if (!item.discount) {
          Text("￥ " + item.price).priceText()
        } else {
          Text("原价：￥" + item.price)
            .fontColor("#CCC")
            .fontSize(14)
            .decoration({ type: TextDecorationType.LineThrough })
          Text("折扣价：￥" + (item.price - item.discount)).priceText()
          Text("补贴：￥" + item.discount).priceText()
        }

      }.height("100%").alignItems(HorizontalAlign.Start)
    }
    .width("100%")
    .backgroundColor("#FFF")
    .borderRadius(20)
    .height(120)
  }
}