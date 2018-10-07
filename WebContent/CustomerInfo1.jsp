<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ page import="java.util.*, com.outfitterspk.jdbc.*,com.outfitterspk.models.*, com.outfitterspk.servlets.*" %>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html class="no-js" lang="en">

<head>
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
     <link rel="shortcut icon" href="http://cdn.shopify.com/s/files/1/2290/7887/t/16/assets/favicon.png?3022115847986725518" type="image/x-icon" />
	<link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet"/>
    <link rel="stylesheet" href="resources/css/font-awesome.min.css">
    <link rel="stylesheet" href="resources/css/bootstrap.min.css">
    <link rel="stylesheet" href="resources/css/style.css">

    <title>outfitterspk - Customer Information</title>
  </head>
  <body>
       <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container-fluid">
            <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbar02" aria-controls="navbarTogglerDemo02"
                aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div id="logo">
                <a  class="navbar-brand" href="/outfitterspk">
                    <img src="resources/img/logo.png"  width="200" class="img-fluid" alt="">
                </a>
            </div>
            <div class="collapse navbar-collapse text-uppercase" id="navbar02">
                <ul class="navbar-nav mr-auto mt-2 mt-md-0">
               		<li class="nav-item">
                        <a class="nav-link" href="/outfitterspk">Home
                            
                        </a>
                    </li>
                  
                    <li class="nav-item">
                        <a class="nav-link" href="women.jsp">Men</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="WomenProductsServlet">Women</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="WomenProductsServlet">Juniors</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Accessories</a>
                    </li>
                </ul>
                <a class="btn btn-info mx-3" href="CartServlet?command=LIST"><i class="fa fa-shopping-cart"></i><span class="sr-only">(current)</span></a>
                <form class="form-inline my-2 my-lg-0">
                    <input class="form-control mr-sm-2" type="text" placeholder="Search">
                    <button class="btn btn-shop my-2 my-sm-0" type="submit">Search</button>
                </form>
            </div>
        </div>

    </nav>
    
    <!-- end of header -->
    
    <!-- start of page body -->
    
    <div class="container-fluid">
            <div class="row">

                	
  <div class="container-fluid">
        <div class="row  justify-content-center my-5">
            <div class="col-12 col-md-10 pr-5">

                    <section id="customer" class="my-2 collection">
                        <div class="container-fluid">
                            <div class="row ">
    
                                <!-- Customer Information -->
                                <div class="col-lg-9 col-md-9 pr-5">	

                                    <!-- title -->
                                    <div class="row d-flex flex-row">
                                      <div  class="col justify-content-start">
                                            <h5>Customer Information</h5>
                                      </div>
                                      <div class="col justify-content-end">
                                          <div class="d-flex justify-content-end">
                                                <p>Already have an account? <a href="/login.html" class="text-danger">Login</a></p>
                                          </div>
                                          
                                            <div class="row d-flex flex-row">
                                                <div class="col">
                                                    <i class="fa fa-user"></i>
                                                </div> 
                                                <div class="col">
                                                    <div class="row">
                                                        <p class="m-0 p-0">FirstName LastName (email)</p> 
                                                        <a href="#" class="text-danger m-0 p-0"> Log out </a>
                                                    </div>
                                                   
                                                </div>
                                            </div>
                                      </div>
                                       
                                    </div>
                                    <h5 class="my-3">Shipping Address</h5>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">   
                                                <input id="firstName" name="firstName" type="text" class="form-control" placeholder="First Name *" required/>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <input id="lastName" name="lastName" type="text" class="form-control" placeholder="Last Name *" required/>
                                            </div>
                                        </div>
                                           
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <input id="address" name="address" type="text" class="form-control"placeholder="Address" required/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <input id="apartment" name="apartment" type="text" class="form-control"placeholder="Apartment, suite, etc.(optional) "/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                
                                                <input id="city" name="city" type="text" class="form-control" placeholder="City " required/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                           
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                
                                                <input id="country" name="country" type="text" class="form-control" placeholder="Country " required/>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                
                                                <input id="postalcode" name="postalcode" type="text" class="form-control" placeholder="Postal Code " required/>
                                            </div>
                                        </div>
                                            
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                
                                                <input id="phone" name="phone" type="text" class="form-control" placeholder="Phone " required/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row my-2">
                                        <div class="col-md-12">

                                            <div class="form-check">
                                                    <label class="form-check-label">
                                                <input id="saveInfo" name="saveInfo" type="checkbox" class="form-check-input"/> Save this information for next time
                                            </label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row d-flex flex-row my-4">
                                        
                                        <div class="col-md-12 d-flex justify-content-between">
                                            <div>
                                                    <a href="#" class="text-danger"> < Return to Cart </a>
                                            </div>
                                            <div>
                                                    <button type="submit" class="btn btn-info text-white p-2">Continue to Shipping Method</button>
                                            </div>
                                        </div>
                                                
                                        </div>    
                                        
                                </div>
                       
                                <!--Cart Information -->
                                <div id="w-carts" class="col-lg-3 col-md-3 hide-sm my-2 border-left">
                                    <div>
                                        <table>
                                            <!--foreach loop-->
                                            <c:forEach var="cartItem" items="${ CartServlet.listCartItems(request, response)}")
                                            <tr class="border-bottom">
                                                <td>
                                                    <img src="#" width="30" height="30"/>
                                                </td>
                                                <td>
                                                    Size / Color
                                                </td>
                                                <td>
                                                    Price
                                                </td>
                                            </tr>
                                            <!--end of foreach loop-->
                                            <tr>
                                                <td></td>
                                            </tr>
                                            <tr>
                                                
                                                <td> SubTotal: </td>
                                                <td></td>
                                                <td class="float-right">#####</td>
                                            </tr>
                                            <tr>
                                                <td> Shipping: </td>
                                                <td></td>
                                                <td class="float-right"> - </td>
                                            </tr>
                                            <tr>
                                                <td></td>
                                            </tr>
                                            <tr class="border-top">
                                              
                                                <td>Total</td>
                                                <td></td>
                                                <td class="float-right"><strong>######</strong></td>
                                            </tr>
                                        </table>
                                    </div>
                                </div>
                                <!--end of cart information-->
                            </div>
                        </div>
                    </section>
                </div>

        </div>
    </div>

</div>
</div>

   
  <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
 <script src="text/javascript">
 
 </script>
 
  </body>
</html>