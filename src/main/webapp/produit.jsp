<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
    	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    	<title>JSP Page</title>
        <script>
function validateForm() {
  var x = document.forms["myForm"]["nom"].value;
  if (x == "" || x == null) {
    alert("Veuillez entrer un terme de recherche.");
    return false;
  }
}
function validateForm2() {
  var y = document.forms["myForm2"]["prix"].value;
  if (y == "" || y == null) {
    alert("Veuillez entrer un terme de recherche.");
    return false;
  }
}
</script>
	</head>
	<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<body>
           <center>  
            <table>
       
             <tr>
    	<form action="Affichage.jsp" name="myForm"  onsubmit="return validateForm()" method="post" required>
        	
                    <center>
            	
                    	<h1>Chercher un Produit</h1><br><br>
                	
                <br><br>
                    </center>
           
            	<tbody>
                	
                    	<td><label>Veuillez saisir le Nom de Produit</label></td>
                    	<td><input type="text" name="nom"/></td>
                    	<td><input type="submit" value="Chercher par nom" /></td>
                        <td><input type="reset" value="reset" /></td>
                	
            	</tbody>
    	</form>
             </tr>
             <tr>
        <form action="Affichage2.jsp"  name="myForm2"  onsubmit="return validateForm2()" method="post" required>
            	<tbody>
                	
                    	<td><label>Veuillez saisir le Prix de produit</label></td>
                    	<td><input type="text" name="prix"/></td>
                    	<td><input type="submit" value="Chercher par prix" /></td>
                        <td><input type="reset" value="reset" /></td>
                	
            	</tbody>
    	</form>
        </tr>
        <tr>
        <form action="Affichage3.jsp"  method="post">
                
                <td><label>Veuillez choisir la Catégorie de Produit</label></td>
                <td>
                        <select name="select">
                             <option value="1"> <c:if test="${param.select == '1'}"/>Fruit</option>
                            <option value="2"> <c:if test="${param.select == '2'}"/>Boisson</option>

                           <option value="3"> <c:if test="${param.select == '3'}"/>Electronique</option>
                            <option value="4"><c:if test="${param.select == '4'}"/>Bijoux et Accessoires</option>
                            <option value="5"> <c:if test="${param.select == '5'}"/>Sac et Chaussures</option>
                            <option value="6"> <c:if test="${param.select == '6'}" />Joués et Acessoiress</option>
                            <option value="7"> <c:if test="${param.select == '7'}" />Bricolage et Outils</option>
                            <option value="8" ><c:if test="${param.select == '8'}" />Téléphoneset et Télécommunication</option>
                            <option value="9" ><c:if test="${param.select == '9'}" />Ordinateur Tablette</option> 
                            <option value="10"> <c:if test="${param.select == '10'}" />Fitness et Sport</option>
                        </select>  
                    </td>  
                     <td><input type="submit" value="Chercher par categorie" /></td>
               </form>
                </tr>

            </table>
        
                        

        </center>
</body>
</html>