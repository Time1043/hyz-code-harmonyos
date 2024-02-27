import { Header } from '../components/CommonComponents'

@Observed
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
  .decoration({ type: TextDecorationType.LineThrough }).fontColor('#B1B2B1')
}

class StatInfo {
  finishTask: number = 0 // 已完成
  totalTask: number = 0 // 总数
}


@Entry
@Component
struct PropPage {
  @Provide statInfo: StatInfo = new StatInfo()

  build() {
    Column({ space: 10 }) {
      // 标题
      Header({ title: '任务列表' }).padding(20)

      // 1 任务进度卡片 任务信息统计
      TaskStatistics()

      // 2 新增任务按钮  3 任务列表
      TaskList().layoutWeight(1)
    }.width('100%').height('100%').backgroundColor('#F1F2F3')
  }
}


// 封装组件  单向传递(传拷贝值)
@Component
struct TaskStatistics {
  @Consume statInfo: StatInfo

  build() {
    Row() {
      Text('任务进度').fontSize(30).fontWeight(FontWeight.Bold)

      // 栈布局
      Stack() {
        // 环形进度条
        Progress({ value: this.statInfo.finishTask, total: this.statInfo.totalTask, type: ProgressType.Ring })
          .width(100)
        Row() {
          Text(this.statInfo.finishTask.toString()).fontSize(24).fontColor('#36D')
          Text(' / ' + this.statInfo.totalTask.toString()).fontSize(24)
        }
      }
    }.card().margin({ top: 15, bottom: 10 }).justifyContent(FlexAlign.SpaceEvenly)
  }
}


// 封装组件  双向传递(传引用地址)
@Component
struct TaskList {
  // 父组件的对象
  @Consume statInfo: StatInfo

  // 父组件不再需要了
  @State tasks: Task[] = [] // 任务数组
  handleTaskChange() { // 更新任务数据 (一旦发生变更)
    this.statInfo.totalTask = this.tasks.length // 更新任务总数量
    this.statInfo.finishTask = this.tasks.filter(item => item.finished).length // 更新已完成任务数量
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
            TaskItem({ task: task, onTaskChange: this.handleTaskChange.bind(this) }) // 封装
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


@Component
struct TaskItem {
  @ObjectLink task: Task
  onTaskChange: () => void // 函数传递

  build() {
    Row() {
      // 任务完成变灰  数组里面是对象
      if (this.task.finished) {
        Text(this.task.name).fontSize(20).finishedTask()
      } else {
        Text(this.task.name).fontSize(20)
      }

      Checkbox().select(this.task.finished).onChange(val => {
        this.task.finished = val
        // this.handleTaskChange() // 总数量 已完成
        this.onTaskChange()
      })
    }.card().justifyContent(FlexAlign.SpaceBetween)
  }
}
