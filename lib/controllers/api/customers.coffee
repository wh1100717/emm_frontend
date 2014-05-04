'use strict'

exports.roles = (req, res) ->
	roles = [
		{
			role: "管理员"
			create_time: "1987-07-17"
			operation: "123"
		},
		{
			role: "管理员"
			create_time: "1987-07-17"
			operation: "123"
		},
		{
			role: "管理员"
			create_time: "1987-07-17"
			operation: "123"
		}
	]
	res.json roles

exports.partners = (req, res) ->
	console.log 123
	partners = [
		{
			role: "管理员"
			create_time: "1987-07-17"
			operation: "123"
		},
		{
			role: "管理员"
			create_time: "1987-07-17"
			operation: "123"
		},
		{
			role: "管理员"
			create_time: "1987-07-17"
			operation: "123"
		}
	]
	res.json partners
