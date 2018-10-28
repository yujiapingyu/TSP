# TSP
解决旅行商问题

## 实验数据为ch130.mat，格式如下
| 序号 | x坐标 | y坐标 |
| ------ | ------ | ------ |
| 1 | 100.312 | 140.213 |
| 2 | 122.343 | 124.343 |
| 3 | 563.378 | 123.676 |
| ... | ... | ... |


表示130个点的序号，x坐标和y坐标

### 文件说明：
| 序号 | 文件名 | 说明 |
| ------ | ------ | ------ |
| 1 | main.m | 140.213 |
| 2 | get_distance_matrix.m | 获取距离矩阵 |
| 3 | generate_population.m | 生成初始种群 |
| 4 | circle_modification.m | 改良圈 |
| 5 | normalization.m | 将路径的表示归一化 |
| 6 | cross.m | 交叉 |
| 7 | mutation.m | 变异 |
| 8 | select_next_generation.m | 选择子代 |
| 9 | get_path_length.m | 获取路径长度 |
| 10 | plot_path.m | 绘制路径 |
| 11 | ch130.mat | 130个数据点 |
| 12 | 6110.mat | 目前跑出的最优路径，load后变量名为optimal_path |



### <font color=red>PS:ch130在网站上给出的最优解为6110.8，目前的程序能在较短时间内快速收敛到6110.7</font>
