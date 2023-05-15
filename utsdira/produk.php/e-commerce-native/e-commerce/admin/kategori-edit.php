<?php
  require "../functions.php";

  $idKategori = $_GET["idKategori"];
  $data = query("SELECT * FROM `kategori_produk` WHERE id='$idKategori'")[0];
  if(isset($_POST["edit"])){
    $id = $_POST["id"];
    $nama = htmlspecialchars($_POST["nama"]);
    $query = "UPDATE `kategori_produk` SET nama = '$nama' WHERE id = $id";
    $result = mysqli_query($conn, $query);

    if($result){
      header("Location: kategori.php");
      exit;
    }
  }
?>


<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Edit Kategori</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous" />
    <!-- css -->
    <link rel="stylesheet" href="css/editKategori.css" />
    <!-- icon -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.4/font/bootstrap-icons.css" />
  </head>
  <body>
    <!-- Navbar -->
    <?php require "navbar.php" ?>

    <!-- slide -->
    <section id="slide">
      <div id="carouselExampleAutoplaying" class="carousel slide" data-bs-ride="carousel">
        <div class="carousel-inner">
          <div class="carousel-item active">
            <img src="wardah1.jpeg" class="d-block w-100" alt="img" />
          </div>
          <div class="carousel-item">
            <img src="wardah2.jpeg" class="d-block w-100" alt="img" />
          </div>
        </div>
        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleAutoplaying" data-bs-slide="prev">
          <span class="carousel-control-prev-icon" aria-hidden="true"></span>
          <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleAutoplaying" data-bs-slide="next">
          <span class="carousel-control-next-icon" aria-hidden="true"></span>
          <span class="visually-hidden">Next</span>
        </button>
      </div>
    </section>

    <section id="header-tambahProduk">
      <div class="container-fluid card shadow-lg">
        <div class="row mt-3">
          <div class="col-2">
            <a href="kategori.php"
              ><button type="button" class="btn btn-primary"><i class="bi bi-arrow-left-circle"></i></button
            ></a>
          </div>
          <div class="col-12 text-center">
            <h3>Edit Kategori</h3>
            <p>Edit Kategori pada colom dibawah</p>
          </div>
        </div>
      </div>
    </section>

    <section id="editKategori">
      <div class="container-fluid">
        <div class="row m-4 justify-content-center">
          <div class="col-md-6 mb-3">
            <div class="card">
              <div class="login-box">
                <form action="" method="post">
                  <h4 class="mb-4 text-center">Kategori</h4>
                  <div class="user-box">
                    <input type="hidden" name="id" value="<?= $data['id']; ?>">
                    <input type="text" name="nama" value="<?= $data['nama']; ?>" required="" />
                    <label class="text-black">Nama Seri</label>
                  </div>
                  <div class="row text-center mb-4">
                    <div class="col-md-12">
                      <div class="login-box">
                        <button type="submit" name="edit" class="card">
                          Ubah
                          <span></span>
                        </button>
                      </div>
                    </div>
                  </div>
                </form>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
  </body>
</html>
