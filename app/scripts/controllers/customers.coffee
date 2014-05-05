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

test = (full)->
	console.log full
	console.log full.telephone

app.controller 'PartnerCtrl', ($scope, $compile, DTOptionsBuilder, DTColumnBuilder) ->

	$scope.click_test = ->
		alert 'hello world'
		console.log 'hello world'

	$scope.dtOptions = DTOptionsBuilder.fromSource('/api/customers/partners')
		.withOption('fnDrawCallback', ->
			$compile($('.blue'))($scope)
		)
		.withBootstrap()

	$scope.dtColumns = [
		DTColumnBuilder.newColumn('name').withTitle('合作商名').renderWith( (data,type,full)-> 
			"<a href='' role='button' class='blue' data-toggle='modal' data-target='#modal-form' onclick='test(#{JSON.stringify(full)})'> #{data} </a>"),
		DTColumnBuilder.newColumn('email').withTitle('邮箱'),
		DTColumnBuilder.newColumn('telephone').withTitle('联系电话'),
		DTColumnBuilder.newColumn('address').withTitle('地址'),
		DTColumnBuilder.newColumn('identifier').withTitle('标识'),
		DTColumnBuilder.newColumn('products').withTitle('订购产品').renderWith((data) -> data.join(' ')),
		DTColumnBuilder.newColumn('createTime').withTitle('创建时间'),
		DTColumnBuilder.newColumn('id').withTitle('操作').renderWith((data, type, full) ->
				return 	"<div class='visible-md visible-lg hidden-sm hidden-xs action-buttons'>
							<a class='blue' ng-click='click_test()'><i class='icon-zoom-in bigger-130'></i></a>
							<a class='green' href='javascript:void(0)'><i class='icon-pencil bigger-130'></i></a>
							<a class='red' href='javascript:void(0)'><i class='icon-trash bigger-130'></i></a>
						</div>")
	]
	
	return
