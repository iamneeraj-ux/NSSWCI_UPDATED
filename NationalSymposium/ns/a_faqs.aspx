﻿<%@ Page Title="" Language="C#" MasterPageFile="~/ns/m.Master" AutoEventWireup="true" CodeBehind="a_faqs.aspx.cs" Inherits="NationalSymposium.ns.a_faqs" %>

<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../Styles/bootstrap.min.css"/>
    <link rel="stylesheet" href="../Styles/font-awesome.css"/>
    <link rel="stylesheet" href="../Styles/main.css"/>
    <title>Jal Jeevan Mission</title>
</head>

<body>
    
    <header class="header">
        <div class="container">
            <div class="row justify-content-center align-items-lg-center mobile--bg py-2 py-md-3">
                <div class="col-8 col-md-6 col-lg-5">
                    <a href="../index.html" class="logo"><img src="../images/logo.png" alt="logo"></a> 
                </div> 
                <div class="col-4 col-md-6 col-lg-7 text-end"> 
                    <div class="top-sidebar">
                        <span><img src="../images/swachBharatlogo.png" alt="swachBharatlogo" class="swachBharatlogo"></span>
                        <ul class="dropdown-wrap">
                            <li>
                                <div class="dropdown">
                                    <a class="" href="#" role="button" id="dropdownMenuLink" data-bs-toggle="dropdown" aria-expanded="false">
                                        <!-- <img alt="" class="img-circle " src="images/user.png"> -->
                                        <i class="fa fa-user-circle" aria-hidden="true"></i>

                                        <span class="username"><strong>WELCOME </strong> Kiran </span>
                                        <i class="fa fa-angle-down"></i>
                                    </a> 
                                    <ul class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                                        <li><a class="dropdown-item" href="#">Profile</a></li> 
                                        <li><a class="dropdown-item" href="#">Signout</a></li>
                                    </ul>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
            </div> 
        </div>
    </header>


    <div class="main-content">

        <section class="banner">
            <div class="row justify-content-center">
                <div class="col-11 col-md-12 col-lg-12 text-center">
                    <h2>National Symposium on Safe Water &amp; Chlorination Initiatives</h2>
                </div>
                <div class="col-11 col-md-8 col-lg-6">  
                    <ul>
                        <li>
                            <span>Date: </span> <small>18/01/2024</small>
                        </li>
                        <li>
                            <span>Venue: </span> <strong>Auditorium, SPM Niwas, Kolkata</strong>
                        </li>
                        <li>
                            <span>Organised by:</span> Jal Jeevan Mission 
                        </li>
                        <li>
                            <span>Technical Partner: </span> Development Innovation Lab (DIL) and Evidence Action 
                        </li>
                    </ul>
                </div>
            </div>
        </section>
         
        <section class=" faq-section">
            <div class="container">
                <div class="row"> 
                    <div class="col-12 text-center mb-3"> 
                        <h2 class="mb-1 "> FAQ Section </h2>
                        <p>Frequently Asked Questions Query </p>
                    </div>
                    <div class="col-12">
                        <div class="accordion" id="accordionExample">
                            <div class="accordion-item">
                              <h2 class="accordion-header" id="heading1">
                                <button class="accordion-button " type="button" data-bs-toggle="collapse" data-bs-target="#collapse1" aria-expanded="true" aria-controls="collapseOne">
                                    <span>Q1. </span> What should the presentation cover?
                                </button>
                              </h2>
                              <div id="collapse1" class="accordion-collapse collapse show" aria-labelledby="heading1" data-bs-parent="#accordionExample">
                                <div class="accordion-body">
                                    <p>Presentations should cover water quality initiatives, challenges faced, solutions implemented, and the learning and insights gained through these initiatives.</p>
                                </div>
                              </div>
                            </div>
                            <div class="accordion-item">
                                <h2 class="accordion-header" id="heading2">
                                  <button class="accordion-button collapsed " type="button" data-bs-toggle="collapse" data-bs-target="#collapse2" aria-expanded="false" aria-controls="collapseOne">
                                      <span>Q2.  </span>Is there a presentation template that can be used?
                                  </button>
                                </h2>
                                <div id="collapse2" class="accordion-collapse collapse" aria-labelledby="heading2" data-bs-parent="#accordionExample">
                                  <div class="accordion-body">
                                      <p>Presentations should cover water quality initiatives, challenges faced, solutions implemented, and the learning and insights gained through these initiatives.</p>
                                  </div>
                                </div>
                            </div>
                            <div class="accordion-item">
                                <h2 class="accordion-header" id="heading3">
                                  <button class="accordion-button collapsed " type="button" data-bs-toggle="collapse" data-bs-target="#collapse3" aria-expanded="false" aria-controls="collapseOne">
                                      <span>Q3.</span> Is there a presentation template that can be used? 
                                  </button>
                                </h2>
                                <div id="collapse3" class="accordion-collapse collapse" aria-labelledby="heading3" data-bs-parent="#accordionExample">
                                  <div class="accordion-body">
                                      <p>Presentations should cover water quality initiatives, challenges faced, solutions implemented, and the learning and insights gained through these initiatives.</p>
                                  </div>
                                </div>
                            </div>
                            <div class="accordion-item">
                                <h2 class="accordion-header" id="heading4">
                                  <button class="accordion-button collapsed " type="button" data-bs-toggle="collapse" data-bs-target="#collapse4" aria-expanded="false" aria-controls="collapseOne">
                                      <span>Q4.</span> Is there a presentation template that can be used? 
                                  </button>
                                </h2>
                                <div id="collapse4" class="accordion-collapse collapse" aria-labelledby="heading4" data-bs-parent="#accordionExample">
                                  <div class="accordion-body">
                                      <p>Presentations should cover water quality initiatives, challenges faced, solutions implemented, and the learning and insights gained through these initiatives.</p>
                                  </div>
                                </div>
                            </div>
                            <div class="accordion-item">
                                <h2 class="accordion-header" id="heading5">
                                  <button class="accordion-button collapsed " type="button" data-bs-toggle="collapse" data-bs-target="#collapse5" aria-expanded="false" aria-controls="collapseOne">
                                      <span>Q5.</span> Is there a presentation template that can be used? 
                                  </button>
                                </h2>
                                <div id="collapse5" class="accordion-collapse collapse" aria-labelledby="heading5" data-bs-parent="#accordionExample">
                                  <div class="accordion-body">
                                      <p>Presentations should cover water quality initiatives, challenges faced, solutions implemented, and the learning and insights gained through these initiatives.</p>
                                  </div>
                                </div>
                            </div>
                            <div class="accordion-item">
                                <h2 class="accordion-header" id="heading6">
                                  <button class="accordion-button collapsed " type="button" data-bs-toggle="collapse" data-bs-target="#collapse6" aria-expanded="false" aria-controls="collapseOne">
                                      <span>Q6.</span> Is there a presentation template that can be used? 
                                  </button>
                                </h2>
                                <div id="collapse6" class="accordion-collapse collapse" aria-labelledby="heading6" data-bs-parent="#accordionExample">
                                  <div class="accordion-body">
                                      <p>Presentations should cover water quality initiatives, challenges faced, solutions implemented, and the learning and insights gained through these initiatives.</p>
                                  </div>
                                </div>
                            </div>
                            <div class="accordion-item">
                                <h2 class="accordion-header" id="heading7">
                                  <button class="accordion-button collapsed " type="button" data-bs-toggle="collapse" data-bs-target="#collapse7" aria-expanded="false" aria-controls="collapseOne">
                                      <span>Q7.</span> Is there a presentation template that can be used? 
                                  </button>
                                </h2>
                                <div id="collapse7" class="accordion-collapse collapse" aria-labelledby="heading7" data-bs-parent="#accordionExample">
                                  <div class="accordion-body">
                                      <p>Presentations should cover water quality initiatives, challenges faced, solutions implemented, and the learning and insights gained through these initiatives.</p>
                                  </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div> 
            </div>
        </section>
     
    </div>


     <footer class="footer text-center">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <p>
                        &copy; Copyrights 2023, Lead. All right are reserved.
                    </p>
                </div> 
            </div>
        </div> 
     </footer>

</body>

<script src="../Scripts/bootstrap.bundle.min.js"></script> 

</html>