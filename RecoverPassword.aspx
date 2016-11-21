<%@ Page Language="C#" AutoEventWireup="true" CodeFile="RecoverPassword.aspx.cs" Inherits="RecoverPassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>Reset Your Password</title>

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
                <asp:Label ID="lblEmailSettings" runat="server" CssClass="text-danger"></asp:Label>
                <h2>Reset Password</h2>
                <hr />
                <div class="form-group">
                    <asp:Label ID="lblMsg" runat="server" CssClass="col-md-2 control-label" Font-Size="Large" Font-Bold="true"></asp:Label>
                </div>
                <div class="form-group">
                    <asp:Label ID="lblPassword" runat="server" CssClass="col-md-2 control-label" Text="New Password" Visible="False"></asp:Label>
                    <div class="col-md-3">
                        <asp:TextBox ID="tbNewPass" TextMode="Password" CssClass="form-control" runat="server" Visible="False"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorPass" runat="server" CssClass="text-danger" 
                            ErrorMessage="Please enter your new password!" ControlToValidate="tbNewPass" Visible="False"></asp:RequiredFieldValidator>
                    </div>
                </div>

                 <div class="form-group">
                    <asp:Label ID="lblRetypePass" runat="server" CssClass="col-md-2 control-label" Text="Confirm Password" Visible="False"></asp:Label>
                    <div class="col-md-3">
                        <asp:TextBox ID="tbConfirmPass" TextMode="Password" CssClass="form-control" runat="server" Visible="False"></asp:TextBox>
                        
                        <asp:CompareValidator ID="CompareValidatorPass" runat="server" CssClass="text-danger" ControlToValidate="tbConfirmPass" ControlToCompare="tbNewPass" ErrorMessage="Password do not match" Visible="False"></asp:CompareValidator>
                    </div>
                </div>

                
                <div class="form-group">
                    <div class="col-md-2"></div>
                    <div class="col-md-6">
                        <asp:Button ID="btRecPass" runat="server" Text="Reset" CssClass="btn btn-default navbar-btn" OnClick="btRecPass_Click" Visible="False" />
                       
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

