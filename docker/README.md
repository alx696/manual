# 安装Docker

[下载离线安装包](docker.tar.gz)，使用scp将其传到服务器中。

使用ssh连接服务器，执行下面命令：
```
tar zxvf docker.tar.gz
cd docker
sh install.sh
```
> 提示`[sudo] password for u:`时输入密码`u`，按enter键。

执行下面命令：
```
sudo reboot
```

再次使用ssh连接服务器，执行下面命令：
```
docker version
```

输入如下内容说明安装成功：
```
Client: Docker Engine - Community
 Version:           20.10.7
 API version:       1.41
 Go version:        go1.13.15
 Git commit:        f0df350
 Built:             Wed Jun  2 11:56:38 2021
 OS/Arch:           linux/amd64
 Context:           default
 Experimental:      true

Server: Docker Engine - Community
 Engine:
  Version:          20.10.7
  API version:      1.41 (minimum version 1.12)
  Go version:       go1.13.15
  Git commit:       b0f5bc3
  Built:            Wed Jun  2 11:54:50 2021
  OS/Arch:          linux/amd64
  Experimental:     false
 containerd:
  Version:          1.4.6
  GitCommit:        d71fcd7d8303cbf684402823e425e9dd2e99285d
 runc:
  Version:          1.0.0-rc95
  GitCommit:        b9ee9c6314599f1b4a7f497e1f1f856fe433d3b7
 docker-init:
  Version:          0.19.0
  GitCommit:        de40ad0
```

执行下面命令，清理临时文件：
```
rm -rf docker docker.tar.gz
```