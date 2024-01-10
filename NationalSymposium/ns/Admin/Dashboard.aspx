<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="NationalSymposium.ns.Admin.Dashboard" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../../Styles/bootstrap.min.css">
    <link rel="stylesheet" href="../../Styles/font-awesome.css">
    <link href="../../Styles/datatable.min.css" rel="stylesheet" />
    <link href="../../Styles/main.css" rel="stylesheet" />
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <title>Jal Jeevan Mission</title>
</head>

<body class="sb-nav-fixed">
    <header>
        <div class="header-top">
            <div class="container">
                <div class="row justify-content-center align-items-lg-center mobile--bg py-2 py-md-3">
                    <div class="col-5 col-sm-4 col-md-4 col-lg-3">
                        <a href="../../index.aspx" class="logo">
                            <img src="../../images/logo.png" alt="logo" class="img-fluid"></a>
                    </div>
                    <div class="col-6 col-sm-6 col-md-6 col-lg-7">
                        <h2 class="dash-main-title text-center">National Symposium on Safe Water &amp; Disinfection Chlorination Initiatives</h2>
                    </div>
                    <div class="col-1 col-sm-2 col-md-2 col-lg-2 text-end">
                        <span>
                            <img src="../../images/swachBharatlogo.png" alt="swachBharatlogo" class="swachBharatlogo img-fluid"></span>
                    </div>
                </div>
            </div>
        </div>
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <!-- Sidebar Toggle-->
            <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i class="fa fa-bars"></i></button>
            <!-- Navbar Search-->
            <div class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
                <%--<div class="input-group">
                    <input class="form-control" type="text" placeholder="Search for..." aria-label="Search for..." aria-describedby="btnNavbarSearch" />
                    <button class="btn btn-primary search-btn" id="btnNavbarSearch" type="button"><i class="fa fa-search"></i></button>
                </div>--%>
            </div>
            <!-- Navbar-->
            <ul class="navbar-nav ms-auto ms-md-0">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><span>Welcome <strong>Admin</strong></span><i class="fa fa-user fa-fw"></i></a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" href="#!">Profile</a></li>
                        <li><a class="dropdown-item" href="#!">Signout</a></li>
                    </ul>
                </li>
            </ul>
        </nav>
    </header>

    <div id="layoutSidenav">
        <div id="layoutSidenav_nav">
            <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                <div class="sb-sidenav-menu">
                    <div class="nav"> 
                        <div class="sb-sidenav-menu-heading">Dashboard</div>
                        <a class="nav-link" href="Dashboard.aspx">
                            <div class="sb-nav-link-icon">
                                <i class="fa fa-tachometer" aria-hidden="true"></i>
                            </div>
                            Dashboard
                         </a> 
                        <a class="nav-link" href="SpeakerandPanelist.aspx">
                            <div class="sb-nav-link-icon">
                                <i class="fa fa-user" aria-hidden="true"></i>
                            </div>
                            Panelist/Speakers
                            </a> 
                           <a class="nav-link" href="Participants.aspx">
                            <div class="sb-nav-link-icon">
                                <i class="fa fa-users" aria-hidden="true"></i>
                            </div>
                            Participants
                          </a>

                        

                    </div>
                </div>
                <div class="sb-sidenav-footer">
                    <div class="small">Logged in as:</div>
                    Start Bootstrap
                   
                </div>
            </nav>
        </div>
        <div id="layoutSidenav_content">
            <main>
                <div class="container-fluid px-4">
                    <h2 class="dashboard-title">Dashboard</h2>
                    <ol class="breadcrumb mb-4">
                        <li class="breadcrumb-item">Home</li>
                        <li class="breadcrumb-item active">Dashboard</li>
                    </ol>
                    <div class="row">
                        <div class="col-xl-6 col-md-6">
                            <div class="card bg-blue text-white mb-4">
                                <div class="card-body d-flex justify-content-between">
                                    <span class="count-title"><i class="fa fa-user" aria-hidden="true"></i>
                                        Total Panelist/Speakers </span><span class="count"><small  id="data" runat="server"></small> </span>
                                </div>
                                <%--<div class="card-footer d-flex align-items-center justify-content-between">
                                    <a class="small text-white stretched-link" href="#">View Details</a>
                                    <div class="small text-white"></div>
                                </div>--%>
                            </div>
                        </div>
                        <div class="col-xl-6 col-md-6">
                            <div class="card bg-green text-white mb-4">
                                <div class="card-body d-flex justify-content-between"><span class="count-title"><i class="fa fa-users" aria-hidden="true"></i>Total Participants</span> 
                                    <span class="count"><small  id="data1" runat="server"></small> </span></div>
                                <%--<div class="card-footer d-flex align-items-center justify-content-between">
                                    <a class="small text-white stretched-link" href="#">View Details</a>
                                    <div class="small text-white"></div>
                                </div>--%>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-xl-6 col-md-6">
                            <div class="card mb-4">
                                <div class="card-header">
                                    <i class="fa fa-pie-chart me-1"></i>
                                    Panelist/Speakers Statewise
                                   
                                </div>
                                <div class="card-body">
                                   
                                    <canvas id="speakersChart" width="100" height="50"></canvas>
                                    <%--<canvas id="myPieChart2" width="100%" height="50"></canvas>--%>

                                </div>
                            </div>
                        </div>
                        <div class="col-xl-6 col-md-6">
                            <div class="card mb-4">
                                <div class="card-header">
                                    <i class="fa fa-pie-chart me-1"></i>
                                    Total no. of participants registered
                                   
                                </div>
                                <div class="card-body">
                                    <canvas id="participantsChart" width="100" height="50"></canvas>
                                   <%-- <canvas id="myPieChart" width="100%" height="50"></canvas>--%>
                                </div>
                            </div>
                        </div>
                    </div>


                     <script>

                         // This function will be called from code-behind to initialize the charts.
                         function initializeChart(labels, data, chartId, colors) {
                             var ctx = document.getElementById(chartId).getContext('2d');
                             var myPieChart = new Chart(ctx, {
                                 type: 'pie',
                                 data: {
                                     labels: labels,
                                     datasets: [{
                                         data: data,
                                         backgroundColor: colors,
                                     }]
                                 },
                                 options: {
                                     legend: {
                                         display: true,
                                         position: 'top',
                                         labels: {
                                             fontColor: 'black',
                                             fontSize: 12,
                                             fontStyle: 'normal',
                                             fontFamily: "'Helvetica Neue', 'Helvetica', 'Arial', sans-serif",
                                             boxWidth: 40,
                                             padding: 10
                                         }
                                     }
                                 }
                             });
                         }

                         // Call this function to initialize the speakers chart
                         function initializeSpeakersChart(labels, speakerData, colors) {
                             initializeChart(labels, speakerData, 'speakersChart', colors);
                         }

                         // Call this function to initialize the participants chart
                         function initializeParticipantsChart(labels, participantData, colors) {
                             initializeChart(labels, participantData, 'participantsChart', colors);
                         }
                     </script>
                       
                        
                     
                    <div class="row">
                        <div class="col-12 col-xl-12 col-md-12">
                                <form id="form1" runat="server">
                            <div class="card mb-4">
                                <div class="card-header">
                                    <div class="row">
                                        <div class="col-12 col-md-4 col-xl-4">
                                            <div class="datatable-title">
                                                <i class="fa fa-table me-1"></i>
                                                User Details
                                       
                                            </div>
                                        </div>
                                        <div class="col-12 col-md-8 col-xl-8">
                                            <div class="row align-items-center">
                                                <div class="col-12 col-md-4 col-xl-5">
                                                    <asp:DropDownList ID="ddlOptions" runat="server" CssClass="form-select">
                                                        <asp:ListItem Text="Speaker/ Panelist" Value="0"></asp:ListItem>
                                                        <asp:ListItem Text="Participants" Value="1"></asp:ListItem>
                                                        <asp:ListItem Text="All" Value="2"></asp:ListItem>
                                                    </asp:DropDownList>
                                                </div>
                                                <div class="col-12 col-md-4 col-xl-5">
                                                    <asp:DropDownList ID="ddlStates" runat="server" CssClass="form-select"></asp:DropDownList>
                                                </div>
                                                <div class="col-12 col-md-4 col-xl-2">
                                                    <asp:Button ID="btnGetData" runat="server" Text="Get Data" OnClick="btnGetData_Click" CssClass="btn btn-primary common-btn" />
                                                 <%--  <asp:Button ID="btnShowData" runat="server" Text="Show Data" OnClick="btnShowData_Click" />--%>
                                               </div>
                                           </div>
                                        </div>
                                      </div>
                                    
                                    <%--<select class="form-select select-datatable">
                                        <option selected>All</option>
                                        <option value="1">Presenter</option>
                                        <option value="2">Speaker/Panelist</option>
                                    </select>--%>

                                </div>
                                <div class="card-body"> 
                                            <asp:GridView ID="gvData" runat="server" AutoGenerateColumns="True">
                                                </asp:GridView>
                                </div>
                            </div>
                            </form>
                        </div>
                    </div>
                </div>
            </main>
             <footer class="footer">
   <div class="container">
       <div class="row">
           <div class="col-12 col-sm-12">
               <p class="copy-right text-center">
                   &copy; Copyrights 2023, Lead. All right are reserved.
               </p>
           </div>
            <%--<div class="col-12 col-sm-6">
                <ul class="footer-nav"> 
                    <li>
                        <a href="../AboutUs.aspx">About us</a> 
                   </li>
                     <li>
                         <a href="../ContactUs.aspx">Contact us</a> 
                   </li>
                </ul>
            </div>--%>
       </div>
   </div>
</footer>

        </div>
    </div>
    <script src="../../Scripts/bootstrap.bundle.min.js"></script>
    <script src="../../Scripts/chart2.js"></script>
    <%--<script src="../../Scripts/chart.min-static.js"></script>
    <script src="../../Scripts/chart-pie.js"></script>--%>
    <script src="../../Scripts/datatables.min.js"></script>
    <script src="../../Scripts/datatables.js"></script>
    <script type="text/javascript">
        window.addEventListener('DOMContentLoaded', event => {

            // Toggle the side navigation
            const sidebarToggle = document.body.querySelector('#sidebarToggle');
            if (sidebarToggle) {
                // Uncomment Below to persist sidebar toggle between refreshes
                // if (localStorage.getItem('sb|sidebar-toggle') === 'true') {
                //     document.body.classList.toggle('sb-sidenav-toggled');
                // }
                sidebarToggle.addEventListener('click', event => {
                    event.preventDefault();
                    document.body.classList.toggle('sb-sidenav-toggled');
                    localStorage.setItem('sb|sidebar-toggle', document.body.classList.contains('sb-sidenav-toggled'));
                });
            }

        });
        </script>

    <%--<script>

        // This function will be called from code-behind to initialize the charts.
        function initializeChart(labels, data, chartId, colors) {
            var ctx = document.getElementById(chartId).getContext('2d');
            var myPieChart = new Chart(ctx, {
                type: 'pie',
                data: {
                    labels: labels,
                    datasets: [{
                        data: data,
                        backgroundColor: colors,
                    }]
                },
                options: {
                    legend: {
                        display: true,
                        position: 'top',
                        labels: {
                            fontColor: 'black',
                            fontSize: 12,
                            fontStyle: 'normal',
                            fontFamily: "'Helvetica Neue', 'Helvetica', 'Arial', sans-serif",
                            boxWidth: 40,
                            padding: 10
                        }
                    }
                }
            });
        }

        // Call this function to initialize the speakers chart
        function initializeSpeakersChart(labels, speakerData, colors) {
            initializeChart(labels, speakerData, 'speakersChart', colors);
        }

        // Call this function to initialize the participants chart
        function initializeParticipantsChart(labels, participantData, colors) {
            initializeChart(labels, participantData, 'participantsChart', colors);
        }
    </script>--%>

    <script>

        // This function will be called from code-behind to initialize the charts.
        function initializeChart(labels, data, chartId, colors) {
            var ctx = document.getElementById(chartId).getContext('2d');
            var myPieChart = new Chart(ctx, {
                type: 'pie',
                data: {
                    labels: labels,
                    datasets: [{
                        data: data,
                        backgroundColor: colors,
                    }]
                },
                options: {
                    legend: {
                        display: true,
                        position: 'top',
                        labels: {
                            fontColor: 'black',
                            fontSize: 12,
                            fontStyle: 'normal',
                            fontFamily: "'Helvetica Neue', 'Helvetica', 'Arial', sans-serif",
                            boxWidth: 40,
                            padding: 10
                        }
                    }
                }
            });
        }

        // Call this function to initialize the speakers chart
        function initializeSpeakersChart(labels, speakerData, colors) {
            initializeChart(labels, speakerData, 'speakersChart', colors);
        }

        // Call this function to initialize the participants chart
        function initializeParticipantsChart(labels, participantData, colors) {
            initializeChart(labels, participantData, 'participantsChart', colors);
        }
    </script>
</body>
</html>
