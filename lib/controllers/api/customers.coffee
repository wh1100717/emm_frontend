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
			"products": ['MDM','MAM']
			"updateTime": null,
			"email": "",
			"city": null,
			"orderPackages": 7,
			"createTime": 1395822753000,
			"telephone": "13333333333",
			"description": "",
			"identifier": "3333",
			"address": "333",
			"name": "P1",
			"id": 8,
			"country": null
		}
		{
			"products": ['MCM','MAM']
			"updateTime": null,
			"email": "",
			"city": null,
			"orderPackages": 7,
			"createTime": 1395822753000,
			"telephone": "13333333333",
			"description": "",
			"identifier": "3333",
			"address": "333",
			"name": "P2",
			"id": 8,
			"country": null
		}
		{
			"products": ['MCM','MDM']
			"updateTime": null,
			"email": "",
			"city": null,
			"orderPackages": 7,
			"createTime": 1395822753000,
			"telephone": "13333333333",
			"description": "",
			"identifier": "3333",
			"address": "333",
			"name": "P3",
			"id": 8,
			"country": null
		}
	]
	res.json partners
