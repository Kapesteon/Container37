<!DOCTYPE html>
<html lang="fr">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>noVNC</title>
  <link rel="stylesheet" href="styles.css" />
  <script type="module" src="app.js"></script>
</head>

<body>
  <?php header('Access-Control-Allow-Origin: *'); ?>
  <div>
    <h1>Liste des machines actives</h1>
    <ul>
      <!-- Insertion du template -->
    </ul>
  </div>
</body>

</html>

<template id="container">
  <li>
    <a class="machine">
      <img src="./assets/images/pc.png" alt="PC icon" />
      poste <span></span><br>
      adresse : <span></span>
    </a>
  </li>
</template>