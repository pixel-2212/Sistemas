<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Sistemas.Default1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <meta name="description" content=""/>
    <meta name="author" content=""/>
    <link type="text/css" rel="stylesheet" href="css/materialize.min.css"  media="screen,projection"/>
    <script type="text/javascript" src="js/materialize.min.js"></script>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet"/>
    <title></title>
    <style>
    body {
      display: flex;
      min-height: 100vh;
      flex-direction: column;
    }

    main {
      flex: 1 0 auto;
    }

    body {
      background: #fff;
    }

    .input-field input[type=date]:focus + label,
    .input-field input[type=text]:focus + label,
    .input-field input[type=email]:focus + label,
    .input-field input[type=password]:focus + label {
      color: #e91e63;
    }

    .input-field input[type=date]:focus,
    .input-field input[type=text]:focus,
    .input-field input[type=email]:focus,
    .input-field input[type=password]:focus {
      border-bottom: 2px solid #e91e63;
      box-shadow: none;
    }
  </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="section">
            <main>
                <center><br /><br />
                    <img class="responsive-img" style="width: 100px;" src="images/logo.png" />
                    <h5 class="indigo-text">Bienvenido!</h5><br />
                    <div class="container">
                        <div class="z-depth-1 grey lighten-4 row" style="display: inline-block; padding: 32px 48px 0px 48px; border: 1px solid #EEE;">
                            <div class="col s12">
                                <div class="row">
                                    <div class="col s12">
                                        <h5 class="blue-grey-text">Iniciar Sesion</h5>
                                    </div>
                                </div>
                                <asp:Literal ID="Literal1" runat="server"></asp:Literal>
                                <div class="row">
                                    <div class="input-field col s12">
                                        <i class="material-icons prefix">account_circle</i>
                                        <asp:TextBox ID="email" runat="server" CssClass="validate" TextMode="Email"></asp:TextBox>
                                        <label for='email'>Correo</label>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="input-field col s12">
                                        <i class="material-icons prefix">vpn_key</i>
                                        <asp:TextBox ID="password" runat="server" CssClass="validate" TextMode="password"></asp:TextBox>
                                        <label for='password'>Contraseña</label>
                                    </div>
                                </div>
                                <br />
                                <center>
                                    <div class='row'>
                                        <asp:Button ID="Login" runat="server" Text="Iniciar Sesion" CssClass="col s12 btn btn-large waves-effect indigo" OnClick="Login_Click"></asp:Button>
                                    </div>
                                </center>
                            </div>
                        </div>
                    </div>
                </center>
            </main>
        </div>
    </form>
</body>
</html>
    