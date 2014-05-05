'use strict'

app.controller 'RoleCtrl', ($scope, DTOptionsBuilder, DTColumnBuilder) ->
	$scope.dtOptions = DTOptionsBuilder.fromSource('/api/customers/roles')
		.withBootstrap()
	$scope.dtColumns = [
		DTColumnBuilder.newColumn('role').withTitle('角色'),
		DTColumnBuilder.newColumn('create_time').withTitle('创建时间'),
		DTColumnBuilder.newColumn('operation').withTitle('操作')
	]
	return

app.controller 'PartnerCtrl', ($scope, DTOptionsBuilder, DTColumnBuilder) ->
	$scope.dtOptions = DTOptionsBuilder.fromSource('/api/customers/partners')
		.withBootstrap()
	$scope.dtColumns = [
		DTColumnBuilder.newColumn('name').withTitle('合作商名').renderWith((data)-> "<a href='www.baidu.com'>#{data}</a>"),
		DTColumnBuilder.newColumn('email').withTitle('邮箱'),
		DTColumnBuilder.newColumn('telephone').withTitle('联系电话'),
		DTColumnBuilder.newColumn('address').withTitle('地址'),
		DTColumnBuilder.newColumn('identifier').withTitle('标识'),
		DTColumnBuilder.newColumn('products').withTitle('订购产品').renderWith((data) -> data.join(' ')),
		DTColumnBuilder.newColumn('createTime').withTitle('创建时间'),
		DTColumnBuilder.newColumn('id')
					   .withTitle('操作')
					   .renderWith((data, type, full) ->
					   		console.log data
					   		return data + '11111'
					   )
	]
	return
