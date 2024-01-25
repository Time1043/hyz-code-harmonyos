class Person {
  name: string
  age: number
  friend: Person // 有的没有朋友 ?

  constructor(name: string, age: number, friend?: Person) {
    this.name = name
    this.age = age
    this.friend = friend
  }
}

@Entry
@Component
struct StatePage2 {
  idx: number = 1
  @State p: Person = new Person('shen', 21, new Person('chen', 20))
  @State friends: Person[] = [
    new Person('plk', 24),
    new Person('ktl', 30)
  ]

  build() {
    Row() {
      Column() {
        // 复杂的数据类型
        Text(`${this.p.name} : ${this.p.age}`).fontSize(40).fontWeight(FontWeight.Bold).onClick(() => {
          this.p.name = 'zhou'
          this.p.age++
        })

        // 嵌套数据类型 不可更改
        Text(`${this.p.friend.name} : ${this.p.friend.age}`).fontSize(40).fontWeight(FontWeight.Bold).onClick(() => {
          this.p.friend.name = 'yang'
          this.p.friend.age++
        })

        // 数组 foreach
        Text('===朋友列表===').fontSize(40).fontWeight(FontWeight.Bold)
        ForEach(this.friends, (p: Person, index) => {
          Row() {
            Text(`${p.name} : ${p.age}`).fontSize(30).onClick(() => {
              // p.age++  // 【等】
              this.friends[index] = new Person(p.name, p.age + 1) // 【修改】 不好！！
            })
            Button('删除').onClick(() => { // 【删除】
              this.friends.splice(index, 1)
            })
          }.width('100%').justifyContent(FlexAlign.SpaceAround)
        })
        // 只有在操作数组对象时才会渲染改变
        Button('添加').onClick(() => { // 【新增】
          this.friends.push(new Person('新朋友' + this.idx++, 30))
        })

      }.width('100%')
    }.height('100%')
  }
}


@Component
struct StatePage {
  @State name: string = 'zhou'
  @State age: number = 23

  build() {
    Row() {
      Column() {
        Text(this.name).fontSize(50).fontWeight(FontWeight.Bold).onClick(() => {
          this.name = 'shen'
        })
        Text(`${this.age}`).fontSize(40).fontWeight(FontWeight.Bold).onClick(() => {
          this.age++
        })
      }.width('100%')
    }.height('100%')
  }
}