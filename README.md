# XGFMDBManagers
 自己封装的FMDB   数据 随便存 随便取
 
 请勿存储模型 其余数据都可以存储  (存储模型会提示需要遵守coding协议)
 
 本数据库支持字段查询 自定义查询  排序
 
  思路:
               
                这个数据库 思路 借鉴了 猿题库开源数据库https://github.com/yuantiku/YTKKeyValueStore Key  Value的思路
   
 遇到的问题:  
     		
     		在使用时遇到查询某一类型的数据时 YTKKeyValueStore 数据表格 只留了 时间 和id 以供查询
            显而易见 这样的数据库结构极不方便条件查询 
            在XGKeyValueStore中进行了 优化
 存储数据种类:
 
                XGKeyValueStore  只要给数据 就能存  任意存任意取
                
  缺点:
              
               XGKeyValueStore 暂时支持  存什么  返回什么  不会对数据进行处理(如果存的是json 数据库不会处理)
 
  如何使用: 
 
 		1 > 支持 pod 
 
 		2 > 
        使用 这个数据库需要依赖FMDB第三方库  并且引入XGDB文件夹 中的 几个类
 
        对外使用 只需用XGFMDBTool 就OK  
        
        查询数据 返回的数据都是XGKeyValueItem 模型 其中的itemResult 就是所存储的数据
