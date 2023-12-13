import { TaskModel } from '../model/TaskModel'

@Component
export struct AddPage {
  @Link displayAddPage: boolean
  @Link taskList: Array<TaskModel>
  @State taskContent: string = ''

  build() {
    Column({ space: 20 }) {
      Stack() {
        Column() {
          Image('images/l3/icon_back.png').width(30).onClick(() => {
            this.displayAddPage = false
          })
        }.width('100%').alignItems(HorizontalAlign.Start)

        Text('新增任务').fontSize(30).fontWeight(FontWeight.Bold)
      }

      TextArea({ text: this.taskContent, placeholder: '请输入任务内容' })
        .backgroundColor(Color.White)
        .width(315)
        .height(201)
        .borderRadius(9)
        .borderColor(0xC2BFBF)
        .onChange((value) => {
          this.taskContent = value
        })

      Button({ stateEffect: true, type: ButtonType.Normal }) {
        Text('确定按钮').fontColor(Color.White)
      }.width(315).height(50).borderRadius(5).onClick(() => {
        let task = new TaskModel({ taskContent: this.taskContent, isComplete: false })
        /*this.taskList.push(task) // 添加到数组的最后*/
        this.taskList.splice(0, 0, task) // 新增元素到指定位置
        this.displayAddPage = false
      })

    }.width('100%').height('100%').padding({ top: 50, left: 20, right: 20, bottom: 20 })
    .backgroundColor(0xBED0DC)
  }
}