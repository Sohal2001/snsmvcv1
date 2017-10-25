	<html>
	
	<div class="container">
			<div class="row">
				<h1>This is Contact Us Page</h1>
			</div>
	
	</div>
	
	<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.6/angular.min.js"></script>
    
	<script type="text/javascript">
	var app = angular.module('postserviceApp', []);
    app.controller('postserviceCtrl', function ($scope, $http) {
    $scope.name = null;
    $scope.email = null;
    $scope.message = null;
    $scope.postdata = function (name, email, message) {
    var data = {
    name: name,
    email: email,
    message: message
    };

    //Call the services
    $http.post('contactus/userMessage', JSON.stringify(data)).then(function (response) {
    if (response.data)
    $scope.msg = "Post Data Submitted Successfully!";
    }, function (response) {
      $scope.msg = "Service not Exists";
     $scope.statusval = response.status;
     $scope.statustext = response.statusText;
    $scope.headers = response.headers();
   });
   };
   });
</script>
</head>
<body>
<div ng-app="postserviceApp" ng-controller="postserviceCtrl">
<table>
<tr>
<td>Name:</td>
<td><input ng-model="name" /></td>
</tr>
<tr>
<td>Email:</td>
<td><input ng-model="email" /></td>
</tr>
<tr>
<td>Message:</td>
<td><textarea ng-model="message" rows="6" cols="50"></textarea></td>
</tr>
<tr>
<td><input type="button" value="Submit" ng-click="postdata(name, email, message)"> </td>
</tr>
</table>
<p>Output Message : {{msg}}</p>

</div>
</body>
</html>           