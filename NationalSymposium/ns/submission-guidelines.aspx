﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Submission-guidelines.aspx.cs" Inherits="NationalSymposium.ns.Submission_guidelines" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../Styles/bootstrap.min.css" />
    <link rel="stylesheet" href="../Styles/font-awesome.css" />
    <link rel="stylesheet" href="../Styles/main.css" />
    <title>Jal Jeevan Mission</title>
</head>

<body>
    <header class="header">
        <div class="container">
            <div class="row justify-content-center align-items-lg-center mobile--bg py-2 py-md-3">
                <div class="col-8 col-md-6 col-lg-5"> 
                    <a href="../index.aspx" class="logo">
                    <img src="../images/logo.png" alt="logo"></a> 
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

                                        <span class="username"><strong>WELCOME </strong> <small  class="username" id="sUser" runat="server"></small> </span>
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
        

        <section class="card-section sub-guide-sec">
            <div class="container">
                <div class="row justify-content-center">
                    <!--<div class="col-12 text-center"> 
                        <h4><i class="fa fa-check-circle" aria-hidden="true"></i> </h4>
                        <h2>THANK YOU !</h2>
                    </div>-->
                    <div class="col-12 col-md-12 col-lg-12"> 
                        <div class="card-wrap card-wrap-home text-center">
                            <h3>Submission Guidelines </h3>
                            <ul>
                                <li>
                                    Include a brief overview of your state's water quality initiatives.
                                </li>
                                <li>
                                    Highlight challenges faced in ensuring safe water and the innovative solutions implemented.
                                </li>
                                <li>
                                    Share key learnings and insights gained through these initiatives.
                                </li>
                                <li>
                                    We highly encourage states to include visuals, including photographs, in their presentations to enhance the overall impact and engagement.
                                </li>
                                <li>
                                    Relevant visuals can include photographs showcasing water quality initiatives, challenges faced, and the impact of implemented solutions.
                                </li>
                                <li>
                                    Before-and-after images, infographics, charts, graphs, maps, and symbols can be powerful tools to convey complex information and make it more accessible to the audience.
                                </li>
                                <li>
                                    Ensure that the visual content aligns with the narrative of your presentation and contributes to a clearer understanding of your state's initiatives.
                                </li>
                                <li>
                                    Save your presentation file with the following naming convention: [State Name]_Presentation_JJM Symposium.ppt (Example:Andhra Pradsh _Presentation_JJM Symposium.ppt) and file size should be 5MB.
                                </li>
                                <li>
                                    Once submitted, presentations cannot be edited. Ensure all information is accurate before uploading.
                                </li>
                            </ul>
                        </div>
                    </div>  
                </div>
            </div>
        </section>
    
    </div>

     <footer class="footer">
   <div class="container">
       <div class="row">
           <div class="col-12 col-sm-6 ">
               <p class="copy-right">
                   &copy; Copyrights 2023, Lead. All right are reserved.
               </p>
           </div>
            <div class="col-12 col-sm-6">
                <ul class="footer-nav"> 
                    <li> 
                       <a href="AboutUs.aspx"> About us </a>
                   </li>
                     <li>
                       <a href="ContactUs.aspx"> Contact us </a>
                   </li>
                </ul>
            </div>
       </div>
   </div>
</footer>

</body>

<script src="../Scripts/bootstrap.bundle.min.js"></script> 

</html>