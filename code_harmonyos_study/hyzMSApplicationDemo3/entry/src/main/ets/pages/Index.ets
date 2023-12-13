import { TaskHelper } from '../helper/TaskHelper'
import { TaskModel } from '../model/TaskModel'
import { AddPage } from './AddPage'
import { ListPage } from './ListPage'

@Entry
@Component
struct Index {
  @State displayAddPage: boolean = false
  @State @Watch('saveTaskList') taskList: Array<TaskModel> = []

  saveTaskList() {
    TaskHelper.saveTaskList(this.taskList)
  }

  aboutToAppear() {
    this.taskList = TaskHelper.readTaskList()
  }

  build() {
    if (this.displayAddPage) {
      AddPage({ displayAddPage: $displayAddPage, taskList: $taskList })
    } else {
      ListPage({ displayAddPage: $displayAddPage, taskList: $taskList })
    }
  }
}