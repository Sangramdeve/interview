const String jsonData = '''
 {
	"info": {
		"_postman_id": "722d8076-bd23-4067-ba04-400ea57dec83",
		"name": "Tasks",
		"schema": "https://schema.getpostman.com/json/collection/v2.1.0/collection.json",
		"_exporter_id": "21844301"
	},
	"item": [
		{
			"name": "Registration",
			"request": {
				"method": "POST",
				"header": [
					{
						"key": "Content-Type",
						"value": "application/json",
						"type": "text"
					},
					{
						"key": "",
						"value": "",
						"type": "text",
						"disabled": true
					}
				],
				"body": {
					"mode": "formdata",
					"formdata": [
						{
							"key": "name",
							"value": "Test",
							"description": "Required",
							"type": "text"
						},
						{
							"key": "email",
							"value": "test@gmail.com",
							"description": "Required",
							"type": "text"
						},
						{
							"key": "mobile",
							"value": "9876543210",
							"description": "Required",
							"type": "text"
						},
						{
							"key": "image",
							"description": "Required",
							"type": "file",
							"src": "/C:/xampp/htdocs/sensea_merine_with_common_auth/public/faculty/study_material/6493051b2e4dabird.jpg"
						},
						{
							"key": "password",
							"value": "12345",
							"description": "Required",
							"type": "text"
						},
						{
							"key": "comf_password",
							"value": "12345",
							"description": "Required",
							"type": "text"
						}
					]
				},
				"url": {
					"raw": "https://ncubeoffice.com/api/Registration",
					"protocol": "https",
					"host": [
						"ncubeoffice",
						"com"
					],
					"path": [
						"api",
						"Registration"
					]
				}
			},
			"response": []
		},
		{
			"name": "Login",
			"request": {
				"method": "POST",
				"header": [
					{
						"key": "Content-Type",
						"value": "application/json",
						"type": "text"
					}
				],
				"body": {
					"mode": "formdata",
					"formdata": [
						{
							"key": "user_name",
							"value": "test@gmail.com",
							"description": "Required(email id)",
							"type": "text"
						},
						{
							"key": "password",
							"value": "12345",
							"description": "Required",
							"type": "text"
						}
					]
				},
				"url": {
					"raw": "https://ncubeoffice.com/api/Login",
					"protocol": "https",
					"host": [
						"ncubeoffice",
						"com"
					],
					"path": [
						"api",
						"Login"
					]
				}
			},
			"response": []
		},
		{
			"name": "List",
			"request": {
				"method": "GET",
				"header": [
					{
						"key": "Content-Type",
						"value": "application/json",
						"type": "text"
					}
				],
				"url": {
					"raw": "https://ncubeoffice.com/api/List",
					"protocol": "https",
					"host": [
						"ncubeoffice",
						"com"
					],
					"path": [
						"api",
						"List"
					]
				}
			},
			"response": []
		}
	]
}
  ''';