<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <!-- Material Design Bootstrap -->
  <link href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.19.1/css/mdb.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/css/all.min.css" integrity="sha512-1PKOgIY59xJ8Co8+NE6FZ+LOAZKjy+KY8iq0G4B3CyeY6wYHN3yt9PW0XpSriVlkMXe40PTKnXrLnZ9+fkDaog==" crossorigin="anonymous">

  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
  <script script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js" integrity="sha384-w1Q4orYjBQndcko6MimVbzY0tgp4pWB4lZ7lr30WKz0vr/aWKhXdBNmNb5D92v7s" crossorigin="anonymous"></script>
  <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
  <!-- FONT AWESOME -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" integrity="sha512-+4zCK9k+qNFUR5X+cKL9EIR+ZOhtIloNl9GIKS57V1MyNsYpYcUrUeQc9vNfzsWfV28IaLL3i96P9sdNyeRssA==" crossorigin="anonymous" />

  <!-- SELECT2 -->
  <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.2/css/select2.min.css" />
  <link rel="stylesheet" type="text/css" href="https://select2.github.io/select2-bootstrap-theme/css/select2-bootstrap.css">
  <script src="https://code.jquery.com/jquery-2.2.0.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.2/js/select2.min.js"></script>

  <!-- GG FORNT -->
  <link rel="preconnect" href="https://fonts.gstatic.com">
  <link href="https://fonts.googleapis.com/css2?family=Quicksand:wght@300;400;500;600;700&display=swap" rel="stylesheet">


  <!-- Slick -->
  <link rel="stylesheet" href="./assets/css/slick.css">
  <link rel="stylesheet" href="./assets/css/slick-theme.css">


  <link rel="stylesheet" href="./assets/css/style.css">
  <title><?php echo $title; ?></title>


</head>

<body>
  <!-- HEADER-PC -->
  <!--Đã đăng nhập-->
  <div class="header container-fluid d-none d-lg-block ">
    <div class="row">
      <ul class="header__menu list-unstyled d-flex mb-0 w-100 justify-content-end">
        <li class="header__item"><a class="header__item--link" href="./login.php"><i class="fas fa-clipboard-list header__item-icon"></i>Tra cứu đơn hàng</a></li>
        <li class="header__item"><a class="header__item--link" href="./index.php"><i class="fas fa-map-marker-alt header__item-icon"></i> Tìm cửa hàng</a></li>
        <!-- ĐÃ đăng Nhập -->
        <?php if ($currentUser) : ?>
          <li class="header__item"><a class="header__item--link" href="./wishList.php"><i class="fas fa-heart header__item-icon"></i>Yêu thích</a></li>
          <li class="header__item"><a class="header__item--link" href="./yourCart.php"><i class="fas fa-shopping-cart header__item-icon"></i>
              Giỏ hàng (<span class="countProduct"><?php echo getCountCartDetail($id_cart); ?></span>)</a></li>
          <li class="header__item"><a class="header__item--link" href="./profile.php"><i class="fas fa-user header__item-icon"></i><?php echo $currentUser['full_name']; ?></a></li>
          <li class="header__item"><a class="header__item--link" href="./logout.php"><i class="fas fa-user header__item-icon"></i>Đăng xuất</a></li>

          <!-- Chưa đăng Nhập -->
        <?php else : ?>
          <li class="header__item"><a class="header__item--link" href="./login.php"><i class="fas fa-user header__item-icon"></i>Đăng nhập</a></li>
        <?php endif; ?>
      </ul>
    </div>



    <!-- NAVBAR -->
    <div class="row">
      <nav class=" navbar navbar-expand-lg navbar-light container">
        <!-- LOGO -->
        <a class="navbar-brand" href="index.php"><img src="./assets/img/Logo_haki.svg"></a>

        <!-- MENU -->
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
          <ul class="nav navbar-nav m-auto">
            <li class=" nav-item dropdown">

              <a class="nav-link dropdown-toggle" href="./productList.php" id="navbarDropdown">SẢN PHẨM <span class="caret"></span></a>
              <!-- Sub menu 1 -->
              <ul class="dropdown-menu">

                <li class="dropdown-item dropdown">
                  <a href="./productList.php?gender=1">CHO NAM <i class="fas fa-chevron-right dropdown-icon"></i></a>
                  <!-- Sub menu level 2 -->
                  <ul class="dropdown-menu">
                    <li class="dropdown-item "><a href="./productList.php?gender=1&type=2">Sữa rửa mặt</a></li>
                    <li class="dropdown-item"><a href="./productList.php?gender=1&type=4">Kem chống nắng</a></li>
                    <li class="dropdown-item"><a href="./productList.php?gender=1&type=5">Nước hoa </a></li>
                    <li class="dropdown-item "><a href="./productList.php?gender=1&type=6"> PHỤ KIỆN</a></li>
                  </ul>
                </li>

                <li class="dropdown-item dropdown">
                  <a href="./productList.php?gender=2">CHO Nữ <i class="fas fa-chevron-right dropdown-icon"></i></a>
                  <!-- Sub menu level 2 -->
                  <ul class="dropdown-menu">
                    <li class="dropdown-item "><a href="./productList.php?gender=2&type=1">Tẩy trang</a></li>
                    <li class="dropdown-item"><a href="./productList.php?gender=2&type=2">Sữa rửa mặt</a></li>
                    <li class="dropdown-item"><a href="./productList.php?gender=2&type=4">Kem chống nắng </a></li>
                    <li class="dropdown-item "><a href="./productList.php?gender=2&type=3">Serum & Kem dưỡng </a></li>
                  </ul>
                </li>

               
                
              </ul>
            </li>

            <li class="line"></li>
            <li class=" nav-item dropdown">
              <a class="nav-link dropdown-toggle" href="./productList.php?gender=1" id="navbarDropdown">NAM <span class="caret"></span></a>
              <ul class="dropdown-menu">
                <li class="dropdown-item "><a href="./productList.php?gender=1&type=2">Sữa rửa mặt</a></li>
                <li class="dropdown-item"><a href="./productList.php?gender=1&type=4">Kem chống nắng </a></li>
                <li class="dropdown-item"><a href="./productList.php?gender=1&type=5">Nước hoa</a></li>
                <li class="dropdown-item "><a href="./productList.php?gender=1&type=6"> PHỤ KIỆN</a></li>
              </ul>
            </li>

            <li class="line"></li>
            <li class=" nav-item dropdown">
              <a class="nav-link dropdown-toggle" href="./productList.php?gender=2" id="navbarDropdown">NỮ<span class="caret"></span></a>
              <ul class="dropdown-menu">
                <li class="dropdown-item "><a href="./productList.php?gender=2&type=1">Tẩy trang</a></li>
                <li class="dropdown-item"><a href="./productList.php?gender=2&type=2">Sữa rửa mặt</a></li>
                <li class="dropdown-item"><a href="./productList.php?gender=2&type=4">Kem chống nắng </a></li>
                <li class="dropdown-item "><a href="./productList.php?gender=2&type=3">Serum & Kem dưỡng</a></li>
              </ul>
            </li>

            <li class="line"></li>
            <li><a class="nav-link" href="#"><img src="./assets/img/Logo_phu.svg"></a></li>
          </ul>
          <!-- END MENU -->

          <!-- SEARCH BOX -->
          <form class="col-lg-3 col-12 search-box form-inline my-2 my-lg-0" action="productSearch.php" method="get">
            <input class="search-box__input form-control" type="search" placeholder="Search" aria-label="Search" name="search">
            <button class="search-box__btn" type="submit"><i class="fas fa-search"></i></button>
          </form>
        </div>
        <!-- END MENU -->



      </nav>
    </div>
    <!-- END NAVBAR -->

    <!-- HOT NEWS SLIDE -->
    <div class="row">
      <div class="hot-news-cont">
        <div class="hot-news-slide">
          <div id="carouselExampleInterval" class="carousel slide" data-ride="carousel">
            <div class="carousel-inner">
              <div class="carousel-item active" data-interval="3000">
                <div class="cont-item d-block w-100 text-center"><a href="./productList.php">FREE SHIPPING VỚI HOÁ ĐƠN TỪ 500K !</a></div>
              </div>
              <div class="carousel-item" data-interval="3000">
                <div class="cont-item d-block w-100  text-center"><a href="./productList.php">NHẬN ĐỔI TRẢ SẢN PHẨM TRONG VÒNG 3 NGÀY </a></div>
              </div>
              <div class="carousel-item" data-interval="3000">
                <div class="cont-item d-block w-100  text-center"><a href="./productList.php">NGUYỄN ĐỨC VINH-1911548048</a></div>
              </div>
            </div>
            <a class="carousel-control-prev" href="#carouselExampleInterval" role="button" data-slide="prev">
              <span class="text-black carousel-control-prev-icon" aria-hidden="true"></span>
              <span class="sr-only">Previous</span>
            </a>
            <a class="carousel-control-next" href="#carouselExampleInterval" role="button" data-slide="next">
              <span class="text-black carousel-control-next-icon" aria-hidden="true"></span>
              <span class="sr-only">Next</span>
            </a>
          </div>
        </div>
      </div>
    </div>
    <!-- END HOT NEWS SLIDE -->

  </div>
  <!-- END HEADER-PC -->

  