class Task {
  static id: number = 1 // (所有共享)
  name: string = `任务${Task.id++}` // 任务名称
  finished: boolean = false // 任务状态 是否完成
}

// 统一的卡片样式
@Styles function card() {
  .width('95%')
  .padding(20)
  .backgroundColor(Color.White)
  .borderRadius(15)
  .shadow({ radius: 6, color: '#1F000000', offsetX: 2, offsetY: 4 })
}

// 任务完成样式
@Extend(Text) function finishedTask() {
  .decoration({ type: TextDecorationType.LineThrough }).fontColor('#B1V2B1')
}


@Entry
@Component
struct PropPage {
  @State finishTask: number = 0 // 已完成任务数
  @State totalTask: number = 0 // 总任务数

  build() {
    Column({ space: 10 }) {
      // 1 任务进度卡片 任务信息统计
      TaskStatistics({ finishTask: this.finishTask, totalTask: this.totalTask })

      // 2 新增任务按钮  3 任务列表
      TaskList({ finishTask: $finishTask, totalTask: $totalTask })
    }.width('100%').height('100%').backgroundColor('#F1F2F3')
  }
}


// 封装组件  单向传递(传拷贝值)
@Component
struct TaskStatistics {
  @Prop finishTask: number
  @Prop totalTask: number

  build() {
    Row() {
      Text('任务进度').fontSize(30).fontWeight(FontWeight.Bold)

      // 栈布局
      Stack() {
        // 环形进度条
        Progress({ value: this.finishTask, total: this.totalTask, type: ProgressType.Ring }).width(100)
        Row() {
          Text(this.finishTask.toString()).fontSize(24).fontColor('#36D')
          Text(' / ' + this.totalTask.toString()).fontSize(24)
        }
      }
    }.card().margin({ top: 15, bottom: 10 }).justifyContent(FlexAlign.SpaceEvenly)
  }
}


// 封装组件  双向传递(传引用地址)
@Component
struct TaskList {
  @Link finishTask: number
  @Link totalTask: number

  // 父组件不再需要了
  @State tasks: Task[] = [] // 任务数组
  handleTaskChange() { // 更新任务数据 (一旦发生变更)
    this.totalTask = this.tasks.length // 更新任务总数量
    this.finishTask = this.tasks.filter(item => item.finished).length // 更新已完成任务数量
  }

  build() { // build只能有一个根元素
    Column() {

      Button('新增任务').width(200).onClick(() => {
        this.tasks.push(new Task()) // 新增任务数据
        this.handleTaskChange() // 总数量 已完成
      }).margin({ bottom: 15 })

      List({ space: 10 }) {
        ForEach(this.tasks, (task: Task, index) => {
          ListItem() {
            Row() {
              Text(task.name).fontSize(20)
              Checkbox().select(task.finished).onChange(val => {
                task.finished = val
                this.handleTaskChange() // 总数量 已完成
              })
            }.card().justifyContent(FlexAlign.SpaceBetween)
          }.swipeAction({ end: this.DeleteButton(index) }) // ListItem BuilderFunc index
        })
      }.width('100%').alignListItem(ListItemAlign.Center).layoutWeight(1).margin({ bottom: 15 })
    }
  }

  // 父组件不再需要了
  @Builder DeleteButton(index: number) {
    Button() {
      Image($r('app.media.ic_public_delete_filled')).fillColor(Color.White).width(20)
    }
    .width(40)
    .height(40)
    .type(ButtonType.Circle)
    .backgroundColor(Color.Red)
    .margin({ left: 10 })
    .onClick(() => {
      this.tasks.splice(index, 1) // 删除该任务
      this.handleTaskChange() // 总数量 已完成
    })
  }
}
