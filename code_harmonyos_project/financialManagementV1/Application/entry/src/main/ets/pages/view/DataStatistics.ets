import TitleComponent from '../../components/TitleComponent'

@Component
export struct DataStatistics {
  build() {
    Column() {
      TitleComponent({ title: '数据统计' })
      Text('数据分析页面')
    }.height('100%')
  }
}