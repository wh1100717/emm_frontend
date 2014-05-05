emm_frontend
============

CoffeeScript + AngularJS + Express + Karma + Mongoose + Passport + KISSY + ACE


---

##Installation

### Under Windows

*   安装[nodeJS](http://nodejs.org/)
*   安装[MongoDB](http://docs.mongodb.org/manual/tutorial/install-mongodb-on-windows/)(注：需要设置dbpath)
*   安装[Github for Windows](https://windows.github.com/)
*   安装[SourceTree](http://www.sourcetreeapp.com/)(optional)
*   安装[goAgent](http://poly.emptystack.net/emm/goagent/)
*   安装`npm install -g bower-cli`
*   将项目fork到本地，并进入项目根目录
*   执行`npm install`安装所需要的工具文件(鉴于国内网络，建议使用代理，具体执行方式为打开goAgent并执行`npm install --proxy http://127.0.0.1:8087`)
*   执行`bower install`安装前端所需库

### Under Mac

*   安装[NodeJS](http://nodejs.org/)
*   安装[MongoDB](http://docs.mongodb.org/manual/tutorial/install-mongodb-on-os-x/)
*   安装[Github for MAC](https://mac.github.com/)
*   安装[SourceTree](http://www.sourcetreeapp.com/)(optional)
*   安装[goAgent](http://poly.emptystack.net/emm/goagent/)
*   将项目fork到本地，并进入项目根目录
*   执行`npm install`安装所需要的工具文件(鉴于国内网络，建议使用代理，具体执行方式为打开goAgent并执行`npm install --proxy http://127.0.0.1:8087`)
*   执行`bower install`安装前端所需库

---

##Run
*   执行`mongod`来启动mongodb
*   进入项目根目录
*   执行`sudo grunt serve`启动项目

