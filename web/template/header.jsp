<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="header" style="height:110px;width: 100%;color: antiquewhite">
    <img id="logo" src="images/Logo_Ensaj.png" alt="logo" style="width:100px;height:100px;"/>     
    <span id="horloge" style="font-family: Courier New;text-align: center; width:100%;"></span>
</div>
<script src="script/horloge.js" type="text/javascript"></script>

<script>
    function showMachineConfirmation(machineId) {
        var result = confirm("CONFIRMER LA SUPPRESSION");
        if (result) {
            // L'utilisateur a cliqué sur "OK", redirigez vers la servlet pour effectuer la suppression.
            window.location.href = "MachineController?op=delete&id=" + machineId;
        } else {
            // L'utilisateur a cliqué sur "Annuler", ne rien faire.
        }
    }

    function updateMachine(machineId) {
        var result = confirm("CONFIRMER LA MODIFICATION");
        if (result) {
            // L'utilisateur a cliqué sur "OK", redirigez vers la servlet pour effectuer la modification.
            window.location.href = "MachineController?op=update&id=" + machineId;
        } else {
            // L'utilisateur a cliqué sur "Annuler", ne rien faire.
        }
    }

    function showEtudiantConfirmation(etudiantId) {
        var result = confirm("CONFIRMER LA SUPPRESSION");
        if (result) {
            // L'utilisateur a cliqué sur "OK", redirigez vers la servlet pour effectuer la suppression.
            window.location.href = "EtudiantController?op=delete&id=" + etudiantId;
        } else {
            // L'utilisateur a cliqué sur "Annuler", ne rien faire.
        }
    }

    function updateEtudiant(etudiantId) {
        var result = confirm("CONFIRMER LA MODIFICATION");
        if (result) {
            // L'utilisateur a cliqué sur "OK", redirigez vers la servlet pour effectuer la modification.
            window.location.href = "EtudiantController?op=update&id=" + etudiantId;
        } else {
            // L'utilisateur a cliqué sur "Annuler", ne rien faire.
        }
    }

    function showMarqueConfirmation(marqueId) {
        var result = confirm("CONFIRMER LA SUPPRESSION");
        if (result) {
            // L'utilisateur a cliqué sur "OK", redirigez vers la servlet pour effectuer la suppression.
            window.location.href = "MarqueController?op=delete&id=" + marqueId;
        } else {
            // L'utilisateur a cliqué sur "Annuler", ne rien faire.
        }
    }

    function updateMarque(marqueId) {
        var result = confirm("CONFIRMER LA MODIFICATION");
        if (result) {
            // L'utilisateur a cliqué on "OK", redirigez vers la servlet pour effectuer la modification.
            window.location.href = "MarqueController?op=update&id=" + marqueId;
        } else {
            // L'utilisateur a cliqué sur "Annuler", ne rien faire.
        }
    }
</script>

