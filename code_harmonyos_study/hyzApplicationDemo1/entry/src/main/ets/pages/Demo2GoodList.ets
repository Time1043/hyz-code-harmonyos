import { Header } from '../components/CommonComponents'
class Item {
  name: string
  image: ResourceStr
  price: number
  discount: number

  constructor(name: string, image: ResourceStr, price: number, discount: number = 0) {
    this.name = name
    this.image = image
    this.price = price
    this.discount = discount
  }
}

@Entry
@Component
struct Demo2GoodList {
  private items: Array<Item> = [
    new Item("华为mato60", $r("app.media.mate60"), 6999, 500),
    new Item("华为mato50", $r("app.media.mate60"), 5999),
    new Item("华为mato70", $r("app.media.mate60"), 7999),
    new Item("华为mato60", $r("app.media.mate60"), 6999),
    new Item("华为mato60", $r("app.media.mate60"), 6999),
    new Item("华为mato60", $r("app.media.mate60"), 6999, 6000),
    new Item("华为mato60", $r("app.media.mate60"), 6999, 600),
    new Item("华为mato60", $r("app.media.mate60"), 6999),
    new Item("华为mato880", $r("app.media.mate60"), 88999, 900)
  ]

  build() {
    Column({ space: 8 }) {
      Header({ title: '商品列表' }).margin({ bottom: 20 })

      List({ space: 10 }) {
        ForEach(this.items, (item: Item, index) => {
          ListItem() {
            Row({ space: 10 }) {
              Image(item.image).width(100)
              Column({ space: 4 }) {
                Text(item.name).fontSize(20).fontWeight(FontWeight.Bold)
                if (!item.discount) {
                  Text("￥" + item.price).fontColor("#F36").fontSize(18)
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
          }
        })
      }.width('100%').layoutWeight(1)

    }.width("100%").height("100%").backgroundColor('#EFEFEF').padding(20)
  }
}