import { Level } from '@ohos/hypium'
import { TaskModel } from '../model/TaskModel'

@Component
export struct ListPage {
  @Link displayAddPage: boolean
  @Link taskList: Array<TaskModel>
  @State taskType: string = 'all'

  deleteTask(index: number) {
    // 弹窗
    AlertDialog.show(
      {
        title: '删除提醒',
        message: '请再次确认是否删除此任务',
        autoCancel: true,
        alignment: DialogAlignment.Bottom,
        gridCount: 4,
        offset: { dx: 0, dy: -20 },
        primaryButton: {
          value: '否',
          action: () => {
            /*console.info('Callback when the first button is clicked')*/
          }
        },
        secondaryButton: {
          value: '是',
          action: () => {
            /*console.info('Callback when the second button is clicked')*/
            this.taskList.splice(index, 1)
          }
        },
        cancel: () => {
          /*console.info('Closed callbacks')*/
        }
      }
    )
  }

  getTaskList(): Array<TaskModel> {
    if (this.taskType == 'all') {
      return this.taskList
    } else if (this.taskType == 'todo') {
      return this.taskList.filter((item) => {
        if (!item.isComplete) {
          return true
        }
      })
    } else if (this.taskType == 'finish') {
      return this.taskList.filter((item) => {
        if (item.isComplete) {
          return true
        }
      })
    }
  }

  build() {
    Column({ space: 20 }) {
      Text('我的任务').fontSize(30).fontWeight(FontWeight.Bold)

      Row({ space: 60 }) {
        Column() {
          Text('全部')
          Radio({ value: 'all', group: 'taskType' })
            .onChange((isSelect) => {
              if (isSelect) {
                this.taskType = 'all'
              }
            })
            .checked(this.taskType == 'all' ? true : false)
        }

        Column() {
          Text('代办')
          Radio({ value: 'todo', group: 'taskType' })
            .onChange((isSelect) => {
              if (isSelect) {
                this.taskType = 'todo'
              }
            })
            .checked(this.taskType == 'todo' ? true : false)
        }

        Column() {
          Text('完成')
          Radio({ value: 'finish', group: 'taskType' })
            .onChange((isSelect) => {
              if (isSelect) {
                this.taskType = 'finish'
              }
            })
            .checked(this.taskType == 'finish' ? true : false)
        }
      }.height(30)

      Stack() {
        Image('images/l3/bg.png').width(338).height(500)

        Column({ space: 10 }) {
          List() {
            ForEach(this.getTaskList(), (item: TaskModel, index) => {
              ListItem() {
                Row() {
                  Checkbox().select(item.isComplete).onChange((value) => {
                    /*// 数组中的发生变化
                    this.taskList[index].isComplete = value*/
                    // 马上发生变化
                    let oldTask = this.taskList[index]
                    let newTask = new TaskModel({ taskContent: oldTask.taskContent, isComplete: value })
                    this.taskList[index] = newTask
                  })
                  Text(item.taskContent)
                    .margin({ left: 10 })
                    .width('70%')
                    .maxLines(1)
                    .textOverflow({ overflow: TextOverflow.Ellipsis })
                    .decoration({ type: item.isComplete ? TextDecorationType.LineThrough : TextDecorationType.None })
                  Blank()
                  Image('images/l3/icon_delete.png').width(20).onClick(() => {
                    this.deleteTask(index)
                  })
                }.width('100%')
              }
            })
          }.width('70%').height(350)
        }.margin({ top: 70 })
      }.alignContent(Alignment.Top)

      Column() {
        Button({ type: ButtonType.Circle, stateEffect: true }) {
          Text('+').fontSize(50).fontColor(Color.White)
        }.width(60).height(60).onClick(() => {
          this.displayAddPage = true
        })
      }.width('100%').alignItems(HorizontalAlign.End)

    }.width('100%').height('100%').padding({ top: 50, left: 20, right: 20, bottom: 20 })
    .backgroundColor(0xBED0DC)
  }
}