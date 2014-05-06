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

app.controller 'PartnerCtrl', ($scope, $compile, DTOptionsBuilder, DTColumnBuilder) ->

	$scope.partner = {
		name: ''
		telephone: ''
		email: ''
		address: ''
		identifier: ''
		products: ''
	}

	$scope.dtOptions = DTOptionsBuilder.fromSource('/api/customers/partners')
		.withOption('fnDrawCallback', ->
			$compile($('.blue'))($scope)
		)
		.withBootstrap()


	$scope.partner_form_init = (partner) ->
		$scope.partner = partner
		$("input[name='partner.products.mdm']").attr('checked',partner.products.mdm)
		$("input[name='partner.products.mam']").attr('checked',partner.products.mam)
		$("input[name='partner.products.mcm']").attr('checked',partner.products.mcm)
		return

	$scope.dtColumns = [
		DTColumnBuilder.newColumn('name').withTitle('合作商名').renderWith( (data,type,full)-> 
			"""
			<a href='' role='button' class='blue' data-toggle='modal' 
				data-target='#partner-form' 
				ng-click='partner_form_init(#{JSON.stringify(full)})'>
			 #{data} 
			</a>
			"""
		),
		DTColumnBuilder.newColumn('email').withTitle('邮箱'),
		DTColumnBuilder.newColumn('telephone').withTitle('联系电话'),
		DTColumnBuilder.newColumn('address').withTitle('地址'),
		DTColumnBuilder.newColumn('identifier').withTitle('标识'),
		DTColumnBuilder.newColumn('products').withTitle('订购产品').renderWith((data) -> 
			html = ""
			html += " MDM" if data.mdm
			html += " MCM" if data.mcm
			html += " MAM" if data.mam
			return html
		),
		DTColumnBuilder.newColumn('createTime').withTitle('创建时间'),
		DTColumnBuilder.newColumn('id').withTitle('操作').renderWith((data, type, full) ->
	 		"""
	 		<div class='visible-md visible-lg hidden-sm hidden-xs action-buttons'>
				<a class='blue' href=''><i class='icon-zoom-in bigger-130'></i></a>
				<a class='green' href=''><i class='icon-pencil bigger-130'></i></a>
				<a class='red' href=''><i class='icon-trash bigger-130'></i></a>
			</div>
			"""
		)
	]
	
	return
