﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="reset_password.aspx.cs" Inherits="NationalSymposium.ns.reset_password" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="../Styles/bootstrap.min.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.css" />
    <link rel="stylesheet" href="../Styles/main.css" />
    <link href="../Content/themes/base/all.css" rel="stylesheet" />
    <script src="../Scripts/jquery-3.6.0.min.js"></script>
    <script src="../Content/AdminLte310/plugins/toastr/toastr.min.js"></script>
    <link href="../Content/AdminLte310/plugins/toastr/toastr.min.css" rel="stylesheet" />
    <title>Jal Jeevan Mission</title>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

   <link rel="stylesheet" href="../Styles/bootstrap.min.css"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.css" />
<link rel="stylesheet" href="../Styles/main.css"/>
<title>Jal Jeevan Mission</title>
</head>
<body>
    <form id="form1" runat="server">
        
        <header class="header">
            <div class="container">
                <div class="row justify-content-center align-items-lg-center mobile--bg py-2 py-md-3">
                    <div class="col-8 col-md-6 col-lg-5">
                        <a href="index.html" class="logo">
                            <img src="../images/logo.png" alt="logo"></a>
                    </div>
                    <div class="col-4 col-md-6 col-lg-7 text-end">
                        <span>
                            <img src="../images/swachBharatlogo.png" alt="swachBharatlogo" class="swachBharatlogo"></span>
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
                        <div class="col-12 text-center">
                            <h4>Login Form </h4>
                            <h2>Reset Password</h2>
                        </div>
                        <div class="col-12 col-md-6 col-lg-6">
                            <div class="card-wrap forgot-wrap">
                                <form>
                                    <div class="mb-3 text-center">
                                        <i class="fa fa-lock" aria-hidden="true"></i>
                                    </div>
                                    <h4>Reset Password</h4>
                                    <h5 class="mb-4">You can reset your password here.</h5>
                                    <div class="input-container">
                                        <i class="fa fa-envelope" aria-hidden="true"></i>
                                        <asp:TextBox ID="txtNewPassword" runat="server" CssClass="form-control" TextMode="Password" placeholder="New Password"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfvtxtNewPassword" runat="server" ErrorMessage="*" ControlToValidate="txtNewPassword" CssClass="form-text" placeholder="New Password"></asp:RequiredFieldValidator>
                                        <%--<input type="email" class="form-control" placeholder="Email Id">
                                <div id="emailHelp" class="form-text"></div>--%>
                                    </div>
                                    <div class="input-container">
                                        <i class="fa fa-envelope" aria-hidden="true"></i>
                                        <asp:TextBox ID="txtCnfrmNewPassword" runat="server" CssClass="form-control" TextMode="Password" placeholder="Confirm Password"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfvtxtCnfrmNewPassword" runat="server" ErrorMessage="*" ControlToValidate="txtCnfrmNewPassword" CssClass="form-text" placeholder="Confirm Password"></asp:RequiredFieldValidator>
                                        <asp:CompareValidator ID="cvCbfrmNewPassword" runat="server" ErrorMessage="Password doesn't match" ControlToValidate="txtCnfrmNewPassword" ControlToCompare="txtNewPassword" CssClass="form-text"></asp:CompareValidator>
                                        <%--<input type="email" class="form-control" placeholder="Email Id">
                                <div id="emailHelp" class="form-text"></div>--%>
                                    </div>
                                    <asp:Button ID="btnReset" runat="server" Text="Reset" OnClick="btnReset_OnClick" CssClass="btn btn-primary common-btn" />
                                    <%--<button type="submit" class="btn btn-primary common-btn">Reset Password</button>--%>
                                    <asp:Label ID="lblMsg" runat="server" Text=""></asp:Label>
                                </form>
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
                       <a href="about.aspx"> About  </a>
                   </li>
                     <li>
                       <a href="contact.aspx"> Contact  </a>
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
