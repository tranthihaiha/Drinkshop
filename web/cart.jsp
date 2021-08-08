
<%@page import="entity.ShoppingCartItem"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta http-equiv="x-ua-compatible" content="ie=edge">

        <title>E-Commerce - MDBootstrap</title>

        <!-- Font Awesome -->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css">

        <!-- Bootstrap core CSS -->
        <link href="https://mdbootstrap.com/previews/templates/e-commerce/css/bootstrap.min.css" rel="stylesheet">

        <!-- Material Design Bootstrap -->
        <link href="https://mdbootstrap.com/previews/templates/e-commerce/css/mdb.min.css" rel="stylesheet">

        <!-- Custom style cart-v1-->
        <style>
            @media only screen and (max-width: 768px) {

                /* Force table to not be like tables anymore */
                table,
                thead,
                tbody,
                th,
                td,
                tr {
                    display: block;
                    text-align: center;
                }
                table.table td {
                    padding-top: 1.5rem;
                    padding-bottom: .4rem;

                }
                img {}
                /* Hide table headers (but not display: none;, for accessibility) */
                thead tr {
                    position: absolute;
                    top: -9999px;
                    left: -9999px;
                }

                img {
                    display: block;
                    margin: 0 auto;
                }
                td {
                    /* Behave  like a "row" */
                    border: none;
                    position: relative;
                    padding-left: 50%;

                }

                td:before {
                    /* Now like a table header */
                    position: absolute;
                    /* Top/left values mimic padding */
                    top: 6px;
                    left: 6px;
                    white-space: nowrap;
                }

                td:nth-of-type(1):before {
                    content: "Product";
                    font-weight: 400;
                    left: 50%;
                    transform: translate(-50%);
                }
                td:nth-of-type(2):before {
                    content: "Color";
                    font-weight: 400;
                    left: 50%;
                    transform: translate(-50%);
                }
                td:nth-of-type(3) {
                    position: absolute;
                    border: none !important;
                }
                td:nth-of-type(4):before {
                    content: "Price";
                    left: 50%;
                    transform: translate(-50%);
                    font-weight: 400;
                }
                td:nth-of-type(5):before {
                    content: "QTY";
                    left: 50%;
                    transform: translate(-50%);
                    font-weight: 400;
                }
                td:nth-of-type(5) {
                    display: flex;
                    justify-content: center;
                    align-items: center;
                    flex-direction: column;
                    padding-top: 1.9rem !important;
                }
                td:nth-of-type(6):before {
                    content: "Amount";
                    left: 50%;
                    transform: translate(-50%);
                    font-weight: 400;
                }
                td:nth-of-type(7):before {
                    content: "Remove item";
                    left: 50%;
                    transform: translate(-50%);
                    font-weight: 400;
                }
                .btn-group {
                    margin-left: 0 !important;
                }
                tr:nth-child(4) td:nth-of-type(4):before,
                tr:nth-child(4) td:nth-of-type(1):before,
                tr:nth-child(4) td:nth-of-type(2):before {
                    content: '';
                }
                tr:nth-child(4) td:nth-of-type(1) {
                    position: absolute;
                    border: none !important;
                }
                tr:nth-child(4) td:nth-of-type(3) {
                    position: relative;
                    display: flex;
                    justify-content: center;
                }
                tr:nth-child(4) td:nth-of-type(4) {
                    border-top: none !important;
                    display: flex;
                    justify-content: center;
                    border-bottom : 1px solid #dee2e6;
                }

            }
        </style>
    </head>

    <body class="cart-v1 hidden-sn white-skin animated">

        <!--Navigation-->
        <header>
            <!-- Sidebar navigation -->
            <ul id="slide-out" class="side-nav custom-scrollbar">
                <!-- Logo -->
                <li>
                    <div class="logo-wrapper waves-light">
                        <a href="#">
                            <img src="https://mdbootstrap.com/img/logo/mdb-transparent.png" class="img-fluid flex-center">
                        </a>
                    </div>
                </li>



            </ul>

            <!--/. Side navigation links -->
            <div class="sidenav-bg mask-strong"></div>
        </ul>
        <!--/. Sidebar navigation -->
        <!-- Navbar -->
        <nav class="navbar fixed-top navbar-expand-lg navbar-light scrolling-navbar white">
            <div class="container">
                <!-- SideNav slide-out button -->

                <a class="navbar-brand font-weight-bold" href="home">
                    <strong>SHOP</strong>
                </a>


            </div>
        </nav>
        <!-- /.Navbar -->

    </header>
    <!-- /.Navigation -->


    <!--Main Layout-->
    <main>
       
        <!-- Main Container -->
        <div class="container">

            <section class="section my-5 pb-5">
 
                <!-- Shopping Cart table -->
                <div class="table-responsive">

                    <table class="table  product-table">

                        <!-- Table head -->
                        <thead>
                            <tr>
                                <th></th>
                                <th class="font-weight-bold">
                                    <strong>Product</strong>
                                </th>

                                <th></th>
                                <th class="font-weight-bold">
                                    <strong>Price</strong>
                                </th>
                                <th class="font-weight-bold">
                                    <strong>QTY</strong>
                                </th>
                                <th class="font-weight-bold">
                                    <strong>Amount</strong>
                                </th>
                                <th></th>
                            </tr>
                        </thead>
                        <!-- /.Table head -->

                        <!-- Table body -->
                        <tbody>
<% ArrayList<ShoppingCartItem> ldt = new ArrayList<ShoppingCartItem>();
            ldt = (ArrayList<ShoppingCartItem>) session.getAttribute("cart");
            double total = 0;
            if (ldt != null) {
                for (ShoppingCartItem dt : ldt) {

                    total = total + (dt.getProduct().getPrice() * dt.getQuantity());

        %>
                            <!-- First row -->
                            <tr>
                                <th scope="row">
                                    <img src="image/<%=dt.getProduct().getImageUrl()%>" alt="" class="img-fluid z-depth-0">
                                </th>
                                <td>
                                    <h5 class="mt-3">
                                        <strong><%=dt.getProduct().getNameProduct()%></strong>
                                    </h5>
                                   <!-- <p class="text-muted">Apple</p>-->
                                </td>

                                <td></td>
                                <td><%=dt.getProduct().getPrice()%></td>
                                <td class="text-center text-md-left">
                                    <%=dt.getQuantity()%>
                                    
                                </td>
                                <td class="font-weight-bold">
                                    <strong><%=dt.getProduct().getPrice()*dt.getQuantity()%></strong>
                                </td>
                                <td>
                                    <a href="CartControl?action=remove&id=<%=dt.getProduct().getIdProduct()%>" onclick="return confirm('Are you sure delete product?')" type="button" class="btn btn-sm btn-primary"> Remove item
                                    </a>
                                    
                                </td>
                            </tr>
                            <!-- /.First row -->
 <% }
     }%>
                           

                            <!-- Fourth row -->
                            <tr>
                                <td colspan="3"></td>
                                <td>
                                    <h4 class="mt-2">
                                        <strong>Total</strong>
                                    </h4>
                                </td>
                                <td class="text-right">
                                    <h4 class="mt-2">
                                        <strong><%=total%></strong>
                                    </h4>
                                </td>
                                <td colspan="3" class="text-right">
                                    <button onclick="myFunction()" type="button" class="btn btn-primary btn-rounded">Complete purchase
                                        <i class="fas fa-angle-right right"></i>
                                    </button>
                                </td>
                            </tr>
                            <!-- Fourth row -->

                        </tbody>
                        <!-- /.Table body -->

                    </table>

                </div>
                <!-- Shopping Cart table -->
    
            </section>

        </div>
        <!-- /Main Container -->
   
    </main>
    <!--Main Layout-->






    <!-- /.Cart Modal -->


    <!-- SCRIPTS -->

    <!-- JQuery -->
    <script type="https://mdbootstrap.com/previews/templates/e-commerce/js/jquery-3.3.1.min.js"></script>

    <!-- Bootstrap tooltips -->
    <script type="text/javascript" src="https://mdbootstrap.com/previews/templates/e-commerce/js/popper.min.js"></script>

    <!-- Bootstrap core JavaScript -->
    <script type="text/javascript" src="https://mdbootstrap.com/previews/templates/e-commerce/js/bootstrap.min.js"></script>

    <!-- MDB core JavaScript -->
    <script type="text/javascript" src="https://mdbootstrap.com/previews/templates/e-commerce/js/mdb.min.js"></script>
    <script type="text/javascript">
        /* WOW.js init */
        new WOW().init();

        // MDB Lightbox Init
        $(function () {
            $("#mdb-lightbox-ui").load("mdb-addons/mdb-lightbox-ui.html");
        });

        // Tooltips Initialization
        $(function () {
            $('[data-toggle="tooltip"]').tooltip()
        })

        // SideNav Initialization
        $(".button-collapse").sideNav();

        // Material Select Initialization
        $(document).ready(function () {
            $('.mdb-select').material_select();
        });
function myFunction() {
                                                            alert("Em khong lam duoc phan này!");
                                                        }
    </script>

</body>

</html>
