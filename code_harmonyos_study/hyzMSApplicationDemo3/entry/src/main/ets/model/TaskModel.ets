export class TaskModel {
  taskContent: string = ''
  isComplete: boolean = false

  constructor({taskContent:taskContent, isComplete:isComplete}) {
    this.taskContent = taskContent
    this.isComplete = isComplete
  }
}