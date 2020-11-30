# lxmoment

### 安装

在工程 pubspec.yaml 中加入 dependencies

```

dependencies:
  lx_moment:
    git: https://github.com/lix-wood/LxMoment.git
      
```

### 获取时间格式 
***
## 参数说明
```

/**
* @params(dynamic) d        动态类型：可传递时间格式字符串，或 DateTime  
* @params(enum) lang        en:英文格式，zh: 中文格式  
 * @params(bool) isLocal     是否转为本地时间  
*/

LxMoment.format(d, lang: Lang.en, isLocal: true)

```
***

    
