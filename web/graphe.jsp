<%@page import="ma.school.beans.Marque"%>
<%@page import="ma.school.service.MarqueService"%>
<%@page import="ma.school.service.MachineService"%>
<%@page import="ma.school.beans.Machine"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Date"%>
<%@page import="ma.school.beans.Etudiant"%>
<%@page import="ma.school.service.EtudiantService"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <script src="script/script.js" type="text/javascript"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="script/jsonExemple.js" type="text/javascript"></script>
        <link href="style/css.css" rel="stylesheet" type="text/css"/>
        <link href="style/csslocal.css" rel="stylesheet" type="text/css"/>


    </head>
    <body>

        <%@include file="template/header.jsp" %>
        <%@include file="template/menu.jsp" %>


        <div class="content">
            <form method="GET" action="EtudiantController">

            </form>

            <div class="chart-title" >Le nombre des machines par marque</div>
            <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

            <canvas id="myChart" width="400" height="200"></canvas>



            <style>
                /* Style the chart container */
                #myChart {
                    width: 100%; /* Make the chart container responsive to its parent */
                    max-width: 600px; /* Limit the maximum width */
                    max-height: 450px;
                    margin: 0 auto; /* Center the chart horizontally */
                    border: 1px solid #ccc; /* Add a border for clarity */
                    border-radius: 5px; /* Add rounded corners */

                }


                /* Style the chart title */
                .chart-title {

                    text-align: center;
                    font-weight: bold;
                    color: brown;
                }

                /* Style the chart legend */
                .chart-legend {
                    list-style: none;
                    padding: 0;
                }

                .chart-legend li {
                    margin-right: 20px;
                    display: inline-block;
                }

                .chart-legend li::before {
                    content: '\25A0'; /* Add a square bullet for each legend item */
                    color: brown; /* Customize the color of the bullet */
                    margin-right: 5px;
                }
            </style>
            <%

                // Remplacez cette partie avec le code Java pour récupérer les données de la base de données
                MachineService ms = new MachineService();
                MarqueService mrs = new MarqueService();
                List<Machine> machines = ms.findAll();
                List<Marque> marques = mrs.findAll();
            %>

            %>

            <script>
                var labels = [];
                var data = [];

                <%
     for (Marque marque : marques) {
         String libelle = marque.getLibelle();
         int nombreMachines = ms.findByMarque(marque).size();
                %>
                labels.push("<%= libelle%>"); // Ajoutez le libellé de la marque
                data.push(<%= nombreMachines%>);
                <%
        }
                %>

                var ctx = document.getElementById('myChart').getContext('2d');
                var myChart = new Chart(ctx, {
                    type: 'bar', // Type of chart (e.g., bar, line, pie)
                    data: {
                        labels: labels,
                        datasets: [{
                                label: 'machines',
                                data: data , // Your chart data
                                backgroundColor: [
                                    'rgba(255, 99, 132, 0.2)',
                                    'rgba(54, 162, 235, 0.2)',
                                    'rgba(255, 206, 86, 0.2)',
                                    'rgba(75, 192, 192, 0.2)',
                                ],
                                borderColor: [
                                    'rgba(255, 99, 132, 1)',
                                    'rgba(54, 162, 235, 1)',
                                    'rgba(255, 206, 86, 1)',
                                    'rgba(75, 192, 192, 1)',
                                ],
                                borderWidth: 1
                            }]

                    },
                    options: {
                        scales: {
                            y: {
                                beginAtZero: true
                            }
                        }
                    }
                   });
            </script>



        </form>            
</body>
</html>