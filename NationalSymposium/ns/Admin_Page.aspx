<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin_Page.aspx.cs" Inherits="NSSWC.Admin_Page" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <%--<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>--%>
  <%-- <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.6.0/Chart.min.js" type="text/javascript"></script>--%>
   <%-- <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
<script src="//cdn.jsdelivr.net/excanvas/r3/excanvas.js" type="text/javascript"></script>
<script src="//cdn.jsdelivr.net/chart.js/0.2/Chart.js" type="text/javascript"></script>--%>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

</head>
<body>
    <form id="form1" runat="server">
          <%--  <div><a href="Admin_Page.aspx">Admin_Page.aspx</a>
                <asp:LinkButton ID="btnLogout" runat="server" Text="Logout" OnClick="btnLogout_Click"></asp:LinkButton>
            </div>--%>
       <div>
            <canvas id="participantsChart" width="100" height="100"></canvas>
        </div>
        <div>
            <canvas id="speakersChart" width="100" height="100"></canvas>
            
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
     <div>
         <asp:DropDownList ID="ddlOptions" runat="server">
        <asp:ListItem Text="Speaker/ Panelist" Value="0"></asp:ListItem>
                <asp:ListItem Text="Participants" Value="1"></asp:ListItem>
              <asp:ListItem Text="All" Value="2"></asp:ListItem>
         </asp:DropDownList>

   
         <asp:DropDownList ID="ddlStates" runat="server" CssClass="form-select"></asp:DropDownList>
               <asp:Button ID="btnGetData" runat="server" Text="Get Data" OnClick="btnGetData_Click" />
         <%--  <asp:Button ID="btnShowData" runat="server" Text="Show Data" OnClick="btnShowData_Click" />--%>
            <asp:GridView ID="gvData" runat="server" AutoGenerateColumns="True">
            </asp:GridView>
        </div>
        
       


     
       
     
     
   </form>
 
      
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
