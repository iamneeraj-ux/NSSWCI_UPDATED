﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="User_Page.aspx.cs" Inherits="NSSWC.User_Page" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="stylesheet" href="../Styles/bootstrap.min.css"/> 
<link rel="stylesheet" href="../Styles/font-awesome.css"/>
<link rel="stylesheet" href="../Styles/main.css"/>
    <link href="../Content/themes/base/all.css" rel="stylesheet" />
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
                <a href="../index.aspx" class="logo"><img src="../images/logo.png" alt="logo"/></a> 
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

                                    <span class="username-wrap"><strong style="color:#000;">WELCOME </strong> <small  class="username" id="sUser" runat="server"></small> </span>
                                    <i class="fa fa-angle-down"></i>
                                </a> 
                                <ul class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                                    <li><a class="dropdown-item" href="#">Profile</a></li> 
                                    <li>
                                        <asp:LinkButton ID="btnLogout" runat="server" Text="Logout" OnClick="btnLogout_Click" class="dropdown-item"/>
                                    </li>
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
                <h2>National Symposium on Safe Water &amp; Disinfection Chlorination Initiatives</h2>
            </div>
            <div class="col-11 col-md-8 col-lg-6 text-center">  
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
    

    <section class="card-section">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-12  col-md-12 col-lg-12 text-center">  
                    <p>Welcome to the National Symposium on Safe Water and Disinfection Chlorination Initiatives! Join us as we gather experts, officials, and organizations
                        to share insights and strategies for ensuring clean and safe water</p>
                </div>
                <div class="col-12 col-md-6 col-lg-6 "> 
                    <div class="card-wrap card-wrap-home ">
                        <h3 class="text-center">Objectives of the Symposium </h3>
                        <ul>
                            <li>
                                 Knowledge sharing on Safe Water by National JJM, States representatives and Evidence Action.
                            </li>
                            <li>
                               Disseminate Safe Water ILC Pilot project summary, results &amp; findings.
                            </li>
                            <li>
                                Establish a National Working Group on Safe Water &amp; ILC to recommend policies, interventions and other technically appropriate solutions.                            
                            </li>
                            <li>    
                                Develop and sustain a Safe Water Ecosystem (with representations from NJJM, States, Academic Institutions, Private Sector players, WASH Forum partners, and Evidence Action etc.)                            
                            </li>
                        </ul>
                    </div>
                </div> 
                <div class="col-12 col-md-6 col-lg-6"> 
                    <div class="card-wrap card-wrap-2 mb-4">
                        <h3>Participants </h3>
                        <span>National JJM Leadership</span>
                        <p>Senior Officials from state Water and PHED Departments.</p>
                    </div>
                    <div class="row">
                        <div class="col-12 col-md-6 col-lg-6"> 
                            <div class="card-wrap card-wrap-sm card-wrap-guide mb-4">
                                <h4><a href="SubmissionGuide.aspx" target="_blank">Submission Guidelines <i class="fa fa-file" aria-hidden="true"></i></a></h4>
                            </div>
                        </div>
                        <div class="col-12 col-md-6 col-lg-6"> 
                            <div class="card-wrap card-wrap-sm card-wrap-faq mb-4">
                                <h4> <a href="FAQ.aspx" target="_blank">FAQs<i class="fa fa-question-circle" aria-hidden="true"></i></a></h4>
                               

                          </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12 col-md-6 col-lg-6"> 
                            <div class="card-wrap card-wrap-sm">
                                <h4> <a href="../Download/JJM_Template.pptx" target="_blank">Download template for Presentation <i class="fa fa-download" aria-hidden="true"></i></a></h4>
                                
                            </div>
                        </div>
                        <div class="col-12 col-md-6 col-lg-6"> 
                            <div class="card-wrap card-wrap-sm">
                                <h4><a href="#" data-bs-toggle="modal" data-bs-target="#staticBackdrop" >Upload Presentation <i class="fa fa-upload" aria-hidden="true"></i></a></h4>
                            </div>
                        </div>
                    </div>
                </div>
            </div> 
        </div>
    </section>

 
    
    <!-- Modal -->
    <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-lg">
        <div class="modal-content">
            <div class="modal-header">
            <h5 class="modal-title" id="staticBackdropLabel">Update</h5>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
            </button>
            </div>
            <div class="modal-body">
                <form>
                    <!-- <div class="row">
                        <div class="col col-md-12 d-flex justify-content-end">
                            <button type="button" class="btn btn-secondary edit-btn"><i class="fa fa-pencil-square-o" aria-hidden="true"></i>
                            </button>
                        </div>
                    </div> -->
                    <div class="row">
                        <%--<div class="col offset-md-2 col-md-4">
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="radioDefault" id="radioDefault1" checked>
                                <label class="form-check-label" for="radioDefault1">
                                    PARTICIPANTS
                                </label>
                              </div>
                            </div>
                            <div class="col col-md-4">
                              <div class="form-check">
                                <input class="form-check-input" type="radio" name="radioDefault" id="radioDefault2" >
                                <label class="form-check-label" for="radioDefault2">
                                    PRESENTER
                                </label>
                              </div>
                        </div> --%>
                    </div>

                    <div class="row">
                        <div class="col col-md-12">
                            <div class="input-container mb-3"> 
                                <i class="fa fa-compass" aria-hidden="true"></i> 
                                <asp:DropDownList ID="ddlStates" runat="server" CssClass="form-select">
<asp:ListItem Text="Select State" Value="" />
</asp:DropDownList>
 
                                <%--<select class="form-select" >
                                    <option selected>Select State Name</option>
                                    <option value="1">Lorem1</option>
                                    <option value="2">Lorem2</option>
                                    <option value="3">Lorem3</option>
                                </select>--%>
                            </div>
                        </div>
                    </div>


                    <div class="row">
                        <div class="col col-md-6">
                            <div class="input-container"> 
                                <i class="fa fa-user" aria-hidden="true"></i>
                                        <asp:TextBox ID="txtName" runat="server" class="form-control"></asp:TextBox>
        <asp:RequiredFieldValidator ControlToValidate="txtName" runat="server" Text="Please enter Name" class="form-text"></asp:RequiredFieldValidator>
                                <%--<input type="text" class="form-control" placeholder="Enter Full Name">
                                <div id="nameHelp" class="form-text"></div>--%>
                            </div>
                        </div>
                        <div class="col col-md-6">
                            <div class="input-container"> 
                                <i class="fa fa-envelope" aria-hidden="true"></i>
<asp:TextBox ID="txtemail" runat="server" class="form-control"></asp:TextBox>
<asp:RequiredFieldValidator ControlToValidate ="txtemail" runat="server" Text="Please enter Email" class="form-text"></asp:RequiredFieldValidator>
                                <%--<input type="email" class="form-control" placeholder="Email Id">
                                <div id="emailHelp" class="form-text"></div>--%>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                       <%-- <div class="col col-md-6">
                            <div class="input-container"> 
                                <i class="fa fa-key" aria-hidden="true"></i>

                                <input type="password" class="form-control" placeholder="Enter Password"> 
                            </div>
                        </div>--%>
                        <div class="col col-md-6">
                            <div class="input-container"> 
                                <i class="fa fa-briefcase" aria-hidden="true"></i>
<asp:DropDownList ID="ddlDesignation" runat="server" class="form-select">
    <asp:ListItem Text="Select Designation" Value="" />
</asp:DropDownList>
                                <%--<select class="form-select" >
                                    <option selected>Select Designation</option>
                                    <option value="1">Lorem1</option>
                                    <option value="2">Lorem2</option>
                                    <option value="3">Lorem3</option>
                                  </select>
                                --%>  
                            </div>
                        </div>
                                                <div class="col col-md-6">
                            <div class="input-container"> 
                                <i class="fa fa-mobile" aria-hidden="true"></i>
                                <asp:TextBox ID="txtMobile" TextMode="Number" runat="server" class="form-control"></asp:TextBox>
<asp:RequiredFieldValidator ControlToValidate ="txtMobile" runat="server" Text="Please enter Mobile Number"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="revMobile" runat="server" ErrorMessage="Mobile No should 10 digit" ControlToValidate="txtMobile" ValidationExpression="[0-9]{10}"></asp:RegularExpressionValidator>
                                <%--<input type="text" class="form-control" placeholder="Enter Mobile"> --%>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        
                        <div class="col col-md-6">
                            <div class="input-container"> 
                                <i class="fa fa-sitemap" aria-hidden="true"></i>
                                <asp:DropDownList ID="ddlOrganization" runat="server" CssClass="form-select">
    <asp:ListItem Text="Select Organization" Value="" />
</asp:DropDownList>
                                <%--<select class="form-select" >
                                    <option selected>Select Organisation</option>
                                    <option value="1">Lorem1</option>
                                    <option value="2">Lorem2</option>
                                    <option value="3">Lorem3</option>
                                  </select>--%> 
                            </div>
                        </div>

                        <div class="col col-md-6">
    <div class="mb-3 file-upload-wrap"> 
        <asp:FileUpload ID="fuUpload" runat="server" class="form-control"/>
     <%--   <asp:RequiredFieldValidator ControlToValidate ="fuUpload" runat="server" Text="Please Upload a File" ></asp:RequiredFieldValidator>--%>
                                
        <%--<input class="form-control" type="file" id="formFile">--%>
        <div id="dViewFile" runat="server"></div>
         <%--<asp:Literal ID="fileLink" runat="server"></asp:Literal>
           <asp:HyperLink ID="hypDownload" runat="server" Text="View File" NavigateUrl="" Target="_blank" Visible="false" />
                        <br />
                        <iframe id="I1" runat="server"  frameborder="0" height="500px" name="I1" width="100%"></iframe>--%>
      </div> 
</div>
                    </div>
                    <div class="row">
                        
                    </div>
                   
                </form>
            </div>
            <div class="modal-footer ">
               <%-- <button type="submit" class="btn btn-primary">Update</button>--%>
                <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" class="btn btn-primary" />
            </div>
        </div>
        </div>
    </div>
 
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
                       <a href="ContactUs.aspx"> Contact us  </a>
                   </li>
                </ul>
            </div>
       </div>
   </div>
</footer>
    </form>
    <script src="../Scripts/bootstrap.bundle.min.js"></script> 
</body>
</html>
