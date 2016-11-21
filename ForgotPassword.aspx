<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ForgotPassword.aspx.cs" Inherits="ForgotPassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>Forgot Password!</title>

    <!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet"/>
    <link href="css/custom.css" rel="stylesheet" />
     <link href="images/africa.jpg" rel="shortcut icon" />

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
    <form id="form1" runat="server">
    <div class=" navbar navbar-default navbar-fixed-top" role="navigation">
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="#"> <span><img src="images/africa.jpg" /> </span> From Africa</a>
            </div>
            <div class="navbar-collapse collapse">
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="Default.aspx">Home</a></li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">Products<b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li class="dropdown-header">Men</li>
                            <li class="divider" role="separator"></li>
                            <li><a href="#">Wallets</a></li>
                            <li><a href="#">Belts</a></li>
                            <li><a href="#">Sandals</a></li>
                            <li class="divider" role="separator"></li>
                             <li class="dropdown-header">Women</li>
                            <li class="divider" role="separator"></li>
                            <li><a href="#">Bracelets</a></li>
                            <li><a href="#">Purses</a></li>
                            <li><a href="#">Sandals</a></li>
                        </ul>
                    </li>
                    <li><a href="#">About</a></li>
                    <li><a href="#">Contact</a></li>
                    <li class="active"><a href="SignIn.aspx">Sign In</a></li>
                </ul>
            </div>
        </div>
    </div>

        <div class="container">
            <div class="form-horizontal">
                <asp:Label ID="lblEmailSettings" runat="server" CssClass="text-danger" Font-Bold="true" Font-Size="Large"></asp:Label>
                <h2>Recover Password</h2>
                <hr />
                <h4>Please enter your email address and we will send you the instructions to reset your password.</h4>
                <div class="form-group">
                    <asp:Label ID="lblEmail" runat="server" CssClass="col-md-2 control-label" Text="Email Address"></asp:Label>
                    <div class="col-md-3">
                        <asp:TextBox ID="tbEmailId" CssClass="form-control" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorEmail" runat="server" CssClass="text-danger" 
                            ErrorMessage="Please enter your email ID!" ControlToValidate="tbEmailId"></asp:RequiredFieldValidator>
                    </div>
                </div>               

                <div class="form-group">
                    <div class="col-md-2"></div>
                    <div class="col-md-6">
                        <asp:Button ID="BtPassRec" runat="server" Text="Send" CssClass="btn btn-default navbar-btn" OnClick="BtPassRec_Click" />
                        <asp:Label ID="lblPassRec" runat="server"></asp:Label>
                    </div>
                </div>

                
                    
            </div>
        </div>

       
    </form>

       <!-- Footer -->
        <hr />

        <footer>
            <div class="container">
            <p class="pull-right"><a href="#">Back to Top</a></p>
            <p>&copy; 2016 FromAfrica.com | <a href="Default.aspx">Home |</a> 
                <a href="Products.aspx">Products |</a> <a href="Abut.aspx">About |</a> <a href="Contact.aspx">Contact</a></p>
        </div>
        </footer>
    

     <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>
</body>
</html>
