<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
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
    <br>
    <h1 style="margin-left: 20px;background-color: scrollbar">Miola e-Commerce</h1>
    <center>
        <hr style=" border: 2px solid gray;">
        <div style="background-color: #E6F8E0;">
        <br><br><br><br>
        <div class="bg-light border rounded mx-5 my-3 p-3" style="box-shadow: 2px 4px 6px #00000099; width: 70%;">
            <h4 class="card-title mb-3 pb-2 pl-3 border-bottom">Chercher un Produit</h4>
            <form class="form-inline" action="Affichage1.jsp" name="myForm"  onsubmit="return validateForm()" method="post" required>
                <div class="form-group mb-2 mr-5">
                    <label for="name" class="mr-4" class="sr-only" >Veuillez saisir le Nom de Produit: </label>
                    <input type="text" class="form-control" name="nom"/>
                </div>
                <div class="mx-sm3 mb-2">
                    <input class="btn btn-primary" type="submit" value="Chercher par nom" />
                    <input class="btn btn-dark" type="reset" value="reset"/>
                </div>
            </form>
            <form class="form-inline" action="Affichage2.jsp"  name="myForm2"  onsubmit="return validateForm2()" method="post" required>
                <div class="form-group mb-2 mr-5">
                    <label class="mr-4" style="padding-right: 8px">Veuillez saisir le Prix de produit: </label>
                    <input type="text" class="form-control" name="prix"/>
                </div>
                <div class="mx-sm3 mb-2">
                    <input class="btn btn-primary" style="padding-right: 20px" type="submit" value="Chercher par prix" />
                    <input type="reset" class="btn btn-dark" value="reset" />
                </div>
            </form>
            <form class="form-inline" action="Affichage3.jsp"  method="post">
                <div class="form-group mb-2 mr-5">
                <label class="mr-4" >Veuillez choisir la Catégorie de Produit: </label>
                <select class="form-control" name="select">
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
                </div>
                <div class="mx-sm3 mb-2">
                <input type="submit" class="btn btn-primary" value="Chercher par categorie" />
                </div>
            </form>  
        </div>               
        <br><br><br>
        <br><br><br>
        <br><br><b   
        </div>
    </center>           
    </body>      
    </html>