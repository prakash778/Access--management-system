
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    
    <title>user-access-system</title>
    <%@include file="components/allcss.jsp" %>
    <style>
        .back-img {
            background: url("Img/useraccess1.jpg") no-repeat center center;
            height: 80vh;
            width: 100%;
            background-size: cover;
        }
        .card_color:hover {
            background-color: #c1d8e8;
        }
        .card img {
            width: 130px;
            height: 200px;
        }
        .btn-custom {
            width: 85px;
            height: 40px;
        }
    </style>
</head>
<body style="background-color: #f7f7f7;">

<%@include file="components/dashnav.jsp" %>

<div class="container-fluid back-img d-flex align-items-center justify-content-center">
    
</div>


<div id="aboutus" style="background-color: white;">
    <br>
    <h1 style="text-align: center;font-weight: bolder;">About us</h1>
    <br>
    <div class="row featurette">
        <div class="col-md-7 order-md-2">
            <h5 class="featurette-heading m-2">ZuKKO is India's Fastest growing sofware industry . </h5>
            <br>
            <p class="leads text-justify textalign"><span><i class="fa-solid fa-arrow-right-long p-b- text-danger"></i></span>ZuKKO is on the mission of providing the complete range of  IT Solutions at affordable prices. </p>
           
            <P class="leads textalign"><SPan><i class="fa-solid fa-arrow-right-long p-b- text-danger"></i></SPan>we take pride in delivering exceptional customer service. Our knowledgeable team is available to assist you in providing IT solution </P>
            <p class="leads textalign"><span><i class="fa-solid fa-arrow-right-long p-b- text-danger"></i></span>Whether you're working on large-scale industry or small-scale industry our solution will truely inspire you</p>
             <p class="leads textalign"><span><i class="fa-solid fa-arrow-right-long p-b- text-danger"></i></span>OUR Team of experts will work with you fullfill your needs.</p>
        </div>
        <div class="col-md-5 order-md-1">
            <img src="Img/useraccess.jpg" alt="Product Image" class="featurette-image img-fluid mx-3" width="500" height="500" style="border-radius: 10px;" >
        </div>
    </div>
    <br>
    <br>
</div>
    



<%@include file="components/footer.jsp" %>
</body>
</html>
