# 准备步骤
1. 通过浏览器(Chrome/Firefox)**登入实验环境** [Kubernetes Playground](https://www.katacoda.com/courses/kubernetes/playground)
2. 点击"**START SCENARIO**"开启实验环境
3. 进入实验环境以后，**点击左侧“Launch Cluster”里的命令"launch.sh"**，Terminial Host1（右边上面的命令框）中就会在controlplane里初始化实验环境里的Kubernetes集群
4. Kubernetes集群初始化完成后，**再点击左边“Health Check”里的命令"kubectl cluster-info"的命令**，确定集群是否初始化成功
5. 回到右边上面的Terminal Host1, 输入以下命令，**检查node01是否加入集群**
```
kubectl get nodes
```
6. **下载**测试环境setup脚本
```
git clone https://github.com/chance2021/dk-devops-review-quiz.git
```
7. **运行**测试环境setup脚本
```
cd dk-devops-review-quiz/week22-20220310-YAMLReplicaset && \
bash setup.sh
```
8. **查看**所有测试Pods是否在Running状态，是的话就可以开始答题
```
kubectl get pods -n mynamespace
```
