
<%@page import="java.lang.String"%>
<%@page import="ma.school.beans.Machine"%>
<%@page import="ma.school.service.MachineService"%>
<%@page import="ma.school.beans.Marque"%>
<%@page import="ma.school.service.MarqueService"%>
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
        <link href="style/css.css" rel="stylesheet" type="text/css"/>
        <link href="style/csslocal.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <%@include file="template/header.jsp" %>
        <%@include file="template/menu.jsp" %>
        <div class="content">
            <form method="GET" action="MachineController">
                <fieldset>
                    <legend>Informations Machine</legend>
                    <table border="0">
                        <tr>
                            <td>Reference</td>
                            <td><input id="ref" type="text" name="ref" value=""  required=""/></td>
                        </tr>
                        <tr>
                            <td>Prix</td>
                            <td><input id="prix" type="text" name="prix" value="" required="" /></td>
                        </tr>
                        <tr>
                            <td>Marque</td>
                            <td>
                                <select id="marque" name="marque">
                                    <%
                                        MarqueService ms = new MarqueService();
                                        for(Marque m : ms.findAll()){
                                    %>
                                    <option value="<%=m.getId()%>"><%=m.getLibelle()%></option>
                                    <%}%>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>Date Achat</td>
                            <td><input id="date" type="date" name="dateAchat" value="" required="" /></td>
                        </tr>
                        
                        <tr>
                            <td></td>
                            <td>
                                <input name="op" type="submit" value="Envoyer" />
                            </td>
                        </tr>
                    </table>
                </fieldset>
            </form>
            <%
                MachineService mms = new MachineService();
            %>
            
            
          
            <fieldset>
                
                <legend>Liste des Machines</legend>

                <table border="1" class="tab">
                 
                    <thead>
                        
                        <tr>
                            <th>Id</th>
                            <th>Reference <br>
                                <input id="f" type="text" name="f" value="" onkeyup="filterMachines()" /></th>
                            <script type="text/javascript">
    function filterMachines() {
        var input = document.getElementById("f");
        var filter = input.value.toLowerCase();
        var table = document.getElementsByClassName("tab")[0];
        var rows = table.getElementsByTagName("tr");

        for (var i = 0; i < rows.length; i++) {
            var referenceCell = rows[i].getElementsByTagName("td")[1];
            if (referenceCell) {
                var reference = referenceCell.textContent || referenceCell.innerText;
                if (reference.toLowerCase().indexOf(filter) > -1) {
                    rows[i].style.display = "";
                } else {
                    rows[i].style.display = "none";
                }
            }
        }
    }
</script>
                            <th>Prix</th>
                            <th>Marque</th>
                            <th>Date d'achat</th>
                       
                            <th>Supprimer</th>
                            <th>Modifier</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            for (Machine mm : mms.findAll()) {
                        %>
                        <tr>
                            <td><%=mm.getId()%></td>
                            <td><%=mm.getReference()%></td>
                            <td><%=mm.getPrix()%></td>
                            <td><%=mm.getMarque().getLibelle()%></td>
                            <td><%=mm.getDateAchat()%></td>
                        <td><a class="bndelete" href="#" onclick="showMachineConfirmation(<%=mm.getId()%>)">Supprimer</a></td>
                        <td> <a class="bnupdate" href="#" onclick="showMachineUpdateForm(<%=mm.getId()%>)">Modifier</a></td>
                        </tr>
                        <%}%>
                    </tbody>
                </table>
<fieldset id="update-form" style="display: none;">
    <legend>Modifier la machine</legend>
    <form method="POST" action="MachineController">
        <input type="hidden" id="id_modification" name="id" value="" />
        <table border="0">
            <tr>
                <td>Référence</td>
                <td><input id="ref_modification" type="text" name="reference" value="" required="" /></td>
            </tr>
            <tr>
                <td>Prix</td>
                <td><input id="prix_modification" type="text" name="prix" value="" required="" /></td>
            </tr>
            <tr>
                <td>Marque</td>
                <td>
                    <select id="marque_modification" name="marque">
                        <%
                            MarqueService mas = new MarqueService();
                            for (Marque m : ms.findAll()) {
                        %>
                        <option value="<%=m.getId()%>"><%=m.getLibelle()%></option>
                        <%
                            }
                        %>
                    </select>
                </td>
            </tr>
            <tr>
                <td>Date d'achat</td>
                <td><input id="date_modification" type="date" name="dateAchat" value="" required="" /></td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <input type="submit" value="Modifier" />
                </td>
            </tr>
        </table>
    </form>
</fieldset>


<script>
   
    function showMachineUpdateForm(id, reference, prix, marque, dateAchat) {
        document.getElementById('id_modification').value = id;
        document.getElementById('ref_modification').value = reference;
        document.getElementById('prix_modification').value = prix;
        document.getElementById('marque_modification').value = marque;
        document.getElementById('date_modification').value = dateAchat;

        document.getElementById('update-form').style.display = 'block';
    }
</script>

</script>
            </fieldset>
        </form>            
</body>
</html>
