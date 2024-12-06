<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>

</head>
<body>
	<h1>
		Hello world!  
		
	</h1>
	<P>  The time on the server is ${serverTime}. </P>
    
    <!-- 케이스 1 html --> 
    <h3> 간단한 ajax 테스트 케이스 1 </h3>
    <button id="b1">테스트케이스 1</button>

    <!-- 케이스 2 html -->
      <h3> 간단한 ajax 테스트 케이스 2 </h3>
      아이디 : <input type="text" id="text2">
    <button id="b2">테스트케이스 2</button>

    <!-- 케이스 3 html -->
      <h3> 간단한 ajax 테스트 케이스 3 </h3>
      아이디 : <input type="text" id="text3">
    <button id="b3">테스트케이스 3</button>



     <!-- 케이스 1 자바스크립트 -->
    <script>
      var btn = document.querySelector("#b1");
      console.log(btn);
      
      var obj ={"name":"kim","age":"30"};
      btn.addEventListener("click",case1);

      function case1(){
          console.log("케이스1실행");
          $.ajax({
             url : "case1",
             type: "post",
             data : JSON.stringify(obj),
             contentType : "application/json",
             success : function(data){
                alert("success");
             },
             error : function(errorThrown){
                alert("fail");
             }
          });         
      }

   </script>

<!-- 케이스 2 자바스크립트 -->
    <script>
     
      var btn2 = document.querySelector("#b2");
     
      console.log(btn);
      btn2.addEventListener("click",case2);

      function case2(){
          console.log("케이스2실행");
    	  var inputdata = document.querySelector("#text2").value;
          console.log(inputdata);
          $.ajax({
             url : "case2",
             type: "post",
             /*data : {id:inputdata},*/
            data : JSON.stringify({id:inputdata}),
             contentType : "application/json",
             success : function(data){
                alert("success");
             },
             error : function(errorThrown){
                alert("fail");
             }
          });         
      }

   </script>

   
<!-- 케이스 3 자바스크립트 -->
    <script>
     
      var btn3 = document.querySelector("#b3");
     
      console.log(btn);
      btn3.addEventListener("click",case3);

      function case3(){
          console.log("케이스3실행");
          var inputdata = document.querySelector("#text3").value;
          console.log(inputdata);
          $.ajax({
             url : "case3",
             type: "post",
            data : JSON.stringify({id:inputdata}),
             contentType : "application/json",
             success : function(data){
                alert(JSON.stringify(data));
                console.log(data.id);
                console.log(data.name);
             },
             error : function(errorThrown){
                alert("fail");
             }
          });         
      }

   </script>


</body>
</html>
