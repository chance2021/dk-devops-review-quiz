# 第二期K8s - 第二十八周 参考答案

## 1. What is the user used to execute the sleep process within the test1 pod in mynamespace? 
> 注： 这题考察的主要是如何登入Pod里的Container查询user 
**Solution**
1. 登入Pod test1
```
kubectl exec -it test1 -n mynamespace -- bash
```
2. 运行一下命令查看User
```
whoami
```
