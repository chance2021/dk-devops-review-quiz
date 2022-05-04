# 第二期K8s - 第二十八周 参考答案

## 1. 这题考察的主要是如何登入Pod里的Container然后执行命令

**Solution:**
1. 登入Pod test1
```
kubectl exec -it test1 -n mynamespace -- bash
```
2. 运行一下命令查看User
```
whoami
```
