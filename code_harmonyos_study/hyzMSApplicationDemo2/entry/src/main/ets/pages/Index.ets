import { ExpressionEvaluator } from '../helper/CalculateHelper'
import { Button1 } from './Button1'
import { Button2 } from './Button2'

@Entry
@Component
struct Index {
  @State cal: string = ''
  @State result: string = '0'
  @State special: boolean = false // 特殊计算模式

  build() {

    Column({ space: 10 }) {
      if (this.result == '5201314') {
        Image('images/love1.gif').width('100%').height(135)
      }

      Blank()

      Column() {
        Text(`${this.result}`).fontColor(Color.White).fontWeight(FontWeight.Medium)
          .fontSize(this.special == true ? 77 : 75)
      }.width('100%').alignItems(HorizontalAlign.End)
      .padding({ right: 34 })

      Column() {
        Text(`${this.cal}`).fontColor(Color.White).fontSize(30)
      }.width('100%').alignItems(HorizontalAlign.End)
      .padding({ right: 44 }).height(35)

      Row({ space: 10 }) {
        Button1({ num: 'AC', buttonColor: 0xA5A5A5, textColor: Color.Black, textSize: 35 }).onClick(() => {
          this.cal = ''
          this.result = '0'
        })
        Button1({ num: '+/-', buttonColor: 0xA5A5A5, textColor: Color.Black, textSize: 35 }).onClick(() => {
          this.special = !this.special
        })
        Button1({ num: '%', buttonColor: 0xA5A5A5, textColor: Color.Black, textSize: 35 })
        Button1({ num: '÷', buttonColor: 0xFF9F0B }).onClick(() => {
          this.cal += '/'
        })
      }

      Row({ space: 10 }) {
        Button1({ num: '7' }).onClick(() => {
          this.cal += '7'
        })
        Button1({ num: '8' }).onClick(() => {
          this.cal += '8'
        })
        Button1({ num: '9' }).onClick(() => {
          this.cal += '9'
        })
        Button1({ num: '×', buttonColor: 0xFF9F0B }).onClick(() => {
          this.cal += '*'
        })
      }

      Row({ space: 10 }) {
        Button1({ num: '4' }).onClick(() => {
          this.cal += '4'
        })
        Button1({ num: '5' }).onClick(() => {
          this.cal += '5'
        })
        Button1({ num: '6' }).onClick(() => {
          this.cal += '6'
        })
        Button1({ num: '-', buttonColor: 0xFF9F0B }).onClick(() => {
          this.cal += '-'
        })
      }

      Row({ space: 10 }) {
        Button1({ num: '1' }).onClick(() => {
          this.cal += '1'
        })
        Button1({ num: '2' }).onClick(() => {
          this.cal += '2'
        })
        Button1({ num: '3' }).onClick(() => {
          this.cal += '3'
        })
        Button1({ num: '+', buttonColor: 0xFF9F0B }).onClick(() => {
          this.cal += '+'
        })
      }

      Row({ space: 10 }) {
        Button2({ num: '0' }).onClick(() => {
          this.cal += '0'
        })
        Button1({ num: '.' }).onClick(() => {
          this.cal += '.'
        })
        Button1({ num: '=', buttonColor: 0xFF9F0B }).onClick(() => {
          let calHelper = new ExpressionEvaluator() // 局部变量let
          let tempResult = `${calHelper.evaluate(this.cal)}`
          this.result = (this.special) && (tempResult.length == 8) ? '5201314' : tempResult
          /*this.result = this.cal == '20030827+20030108' ? '5201314' : tempResult*/
        })
      }.margin({ bottom: 50 })

    }.width('100%').height('100%').backgroundColor(Color.Black)

  }
}