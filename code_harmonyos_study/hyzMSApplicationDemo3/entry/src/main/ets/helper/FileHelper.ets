import fs from '@ohos.file.fs'
import common from '@ohos.app.ability.common'
import { TaskModel } from '../model/TaskModel'

export class FileHelper {

  // 保存json数据
  static saveJsonData(jsonObj: any, fileName: string) {
    // 获取应用文件路径
    let context = getContext(this) as common.UIAbilityContext
    let filesDir = context.filesDir
    let filePath = `${filesDir}/${fileName}`

    // 新建并打开文件
    try {
      let file = fs.openSync(filePath, fs.OpenMode.WRITE_ONLY | fs.OpenMode.TRUNC | fs.OpenMode.CREATE);
      let jsonStr = JSON.stringify(jsonObj)

      console.log(jsonStr)

      fs.writeSync(file.fd, jsonStr)
      fs.closeSync(file)
    } catch (e) {
      console.log(`write file error ${e}`)
    }
  }

  // 读取json数据
  static readJsonData(fileName: string): any {
    // 获取应用文件路径
    let context = getContext(this) as common.UIAbilityContext
    let filesDir = context.filesDir
    let filePath = `${filesDir}/${fileName}`

    var userStr = ""

    try {
      userStr = fs.readTextSync(filePath)
    } catch (e) {
      console.log(`read file error ${e}`)
    }

    if (userStr.length > 0) {
      console.log(userStr)
      return JSON.parse(userStr)
    }

    return {}
  }
}