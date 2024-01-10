<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ContactUs.aspx.cs" Inherits="NationalSymposium.ns.ContactUs" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../Styles/bootstrap.min.css">
    <link rel="stylesheet" href="../Styles/font-awesome.css">
    <link rel="stylesheet" href="../Styles/main.css">
    <script src="../Scripts/jquery-3.6.0.min.js"></script>
<script src="../Content/AdminLte310/plugins/toastr/toastr.min.js"></script>
<link href="../Content/AdminLte310/plugins/toastr/toastr.min.css" rel="stylesheet" />
    <title>Jal Jeevan Mission</title>
</head>

<body>
    <form id="form1" runat="server">
    <header class="header">
        <div class="container">
            <div class="row justify-content-center align-items-lg-center mobile--bg py-2 py-md-3">
                <div class="col-8 col-md-6 col-lg-5"> 
                    <a href="../index.aspx" class="logo"> 
                        <img src="../images/logo.png" alt="logo"></a>
                </div>
                <div class="col-4 col-md-6 col-lg-7 text-end">
                    <div class="top-sidebar">
                    <<span><img src="../images/swachBharatlogo.png" alt="swachBharatlogo" class="swachBharatlogo"></span>
                        <%--<ul class="dropdown-wrap">
                            <li>
                                <div class="dropdown">
                                    <a class="" href="#" role="button" id="dropdownMenuLink" data-bs-toggle="dropdown"
                                        aria-expanded="false">
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
                        </ul>--%>
                    </div>
                </div>
            </div>
        </div>
    </header>

    <div class="main-content">

        <section class="banner">
            <div class="row justify-content-center">
                <div class="col-12 col-md-12 col-lg-12 text-center">
                    <h2>National Symposium on Safe Water &amp; Disinfection Chlorination Initiatives</h2>
                </div>
                <div class="col-12 col-md-8 col-lg-6 text-center">
                    <ul>
                        <li>
                            <span>Date: </span> <small>12/12/2023</small>
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

        <section class="card-section">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-12 text-center">
                        <h2>Contact us </h2>
                    </div>
                    <div class="col-12 col-md-6 col-lg-6">
                        <div class="card-wrap card-wrap-home">
                            <form>  


                                <div class="row">
                                    <div class="col col-md-6">
                                        <div class="input-container mb-3">
                                            <i class="fa fa-user" aria-hidden="true"></i>

                                            <input type="text" id="txtName" runat="server" class="form-control" placeholder="Name">
                                            <div id="nameHelp" class="form-text"></div>
                                        </div>
                                    </div>
                                    <div class="col col-md-6">
                                        <div class="input-container mb-3">
                                            <i class="fa fa-envelope" aria-hidden="true"></i>

                                            <input type="email" id="txtEmail" runat="server" class="form-control" placeholder="Email">
                                            <div id="emailHelp" class="form-text"></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col col-md-6">
                                        <div class="input-container mb-3">
                                            <i class="fa fa-phone-square" aria-hidden="true"></i>


                                            <input type="text" id="txtPhone" runat="server" class="form-control" placeholder="Enter Mobile">
                                        </div>
                                    </div>
                                    <div class="col col-md-6">
                                        <div class="input-container mb-3">
                                            <i class="fa fa-envelope" aria-hidden="true"></i>

                                             <input type="text" id="txtSubject" runat="server" class="form-control" placeholder="Enter Subject">

                                            <%--<select class="form-select">
                                                <option selected>Subject</option>
                                                <option value="1">Lorem1</option>
                                                <option value="2">Lorem2</option>
                                                <option value="3">Lorem3</option>
                                            </select>--%>

                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    
                                    <div class="col col-md-12">
                                        <div class="input-container mb-3">
                                            <i class="fa fa-comments" aria-hidden="true"></i>


                                            <textarea class="form-control message-txt" rows="3" placeholder="Message" id="txtMessage" runat="server"></textarea>

                                        </div>
                                    </div>
                                </div> 
                                <asp:Button ID="btnSubmit" runat="server" CssClass="btn btn-primary common-btn" Text="Submit" OnClick="btnSubmit_Click" />
                                <%--<button type="submit" class="btn btn-primary common-btn" onclick="Submit_Click">Submit</button>--%>
                            </form>
                        </div>
                    </div>
                    <div class="col-12 col-md-6 col-lg-6">
                        <div class="card-wrap card-wrap-home contact-address">
                            <ul>
                                <li>
                                    <div class="single-address">
                                        <div class="icon">
                                            <i class="fa fa-home"></i>
                                        </div>
                                        <div class="cont">
                                            <p>
                                                Department of Drinking Water &amp; Sanitation,
                                                <br />
                                                4th Floor,Pandit Deendayal Antyodaya Bhawan,
                                                <br />
                                                CGO Complex, Lodhi Road,
                                                <br />
                                                New Delhi-110003
                                            </p>
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <div class="single-address">
                                        <div class="icon">
                                            <i class="fa fa-phone"></i>
                                        </div>
                                        <div class="cont">
                                            <p><a href="tel:+01124361011">011-24361011</a></p>
                                            <p><a href="tel:+01124361011">011-24361011</a></p>
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <div class="single-address">
                                        <div class="icon">
                                            <i class="fa fa-envelope-o"></i>
                                        </div>
                                        <div class="cont">
                                            <p><a href="mailto:secydws.nic.in">secydws.nic.in</a></p>
                                            <p><a href="mailto:secydws.nic.in">secydws.nic.in</a></p>
                                        </div>
                                    </div>
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
        </form>
</body>

<script src="js/bootstrap.bundle.min.js"></script>

</html>
