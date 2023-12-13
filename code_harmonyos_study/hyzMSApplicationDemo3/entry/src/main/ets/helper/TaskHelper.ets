import { TaskModel } from '../model/TaskModel';
import { FileHelper } from './FileHelper';

export class TaskHelper {
  static saveTaskList(taskList: Array<TaskModel>) {
    FileHelper.saveJsonData(taskList, 'task.data')
  }

  static readTaskList(): Array<TaskModel> {
    let jsonData = FileHelper.readJsonData('task.data')
    let taskList: Array<TaskModel> = []
    Object.assign(taskList, jsonData)
    return taskList
  }
}