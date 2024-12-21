<?php
include('connect.php');

function fetchIslands($conn) {
    $sql = "SELECT * FROM `islandsofpersonality` ORDER BY `islandOfPersonalityID` ASC";
    $result = $conn->query($sql);

    if (!$result) {
        die("Error in query: " . $conn->error);
    }

    return $result;
}

function fetchContents($conn) {
    $sql = "SELECT * FROM `islandcontents`";
    $result = $conn->query($sql);

    if (!$result) {
        die("Error in query: " . $conn->error);
    }

    return $result;
}

function getIslandName($conn, $island_id) {
    $stmt = $conn->prepare("SELECT name FROM `islandsofpersonality` WHERE islandOfPersonalityID = ?");
    $stmt->bind_param("i", $island_id);
    $stmt->execute();
    $result = $stmt->get_result();
    $island_name = $result->fetch_assoc()['name'];
    $stmt->close();

    return $island_name;
}

$result_islands = fetchIslands($conn);
$result_contents = fetchContents($conn);
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Jairo's Islands of Personality</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/w3-css/4.1.0/w3.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
    <link rel="icon" href="images/tabIcon.jpg">
    <link rel="stylesheet" href="style.css">
</head>

<body>
    <div class="nav-bar w3-top">
        <div class="w3-xlarge" style="max-width: 100%; margin:auto">
            <div class="w3-right w3-padding-16"></div>
            <div class="w3-center w3-padding-16"><strong>Islands of Personality</strong></div>
        </div>
    </div>

    <div class="container-fluid mb-5" id="home"></div>

    <div class="container text-center my-5" id="about">
        <h3>What's going on inside his head?</h3><br>
        <img src="images/jairoEmotions.png" class="emotions img-fluid" style="display:block;margin:auto" width="800" height="550">
        <h4 class="my-3"><b>Core Memories and Island Personality</b></h4>
        <p>Jairo’s mind is a dynamic realm powered by passion, curiosity, and determination. It is home to four unique Personality Islands, each representing a vital aspect of who he is. These islands are energized by his Core Memories, glowing with defining moments that have shaped his journey.</p>
    </div>

    <div class="container-fluid my-5 mt-5" id="person">
        <h1 class="text-center mb-4 pt-4"><b>Island Personality</b></h1>
        <div class="row row-cols-1 row-cols-md-2 row-cols-lg-4">
            <?php while ($island = $result_islands->fetch_assoc()): ?>
                <div class="col-md-6 mb-4">
                    <div class="island-card">
                        <img src="<?= $island['image'] ?>" alt="<?= $island['name'] ?>" class="img-fluid">
                        <div class="p-3">
                            <h3><?= $island['name'] ?></h3>
                            <p><?= $island['shortDescription'] ?></p>
                        </div>
                    </div>
                </div>
            <?php endwhile; ?>
        </div>
    </div>

    <div class="container my-5 mt-5" id="content">
        <h1 class="text-center mb-4"><b>Island Content</b></h1>
        <?php
        $islands_contents = [];
        while ($content = $result_contents->fetch_assoc()) {
            $islands_contents[$content['islandOfPersonalityID']][] = $content;
        }

        foreach ($islands_contents as $island_id => $contents):
            $island_name = getIslandName($conn, $island_id);
        ?>
            <h3 class='text-center my-4'><?= $island_name ?></h3>
            <div class="row row-cols-1 row-cols-md-3 g-4">
                <?php foreach ($contents as $content): ?>
                    <div class="col mb-4">
                        <div class="card shadow-sm h-100">
                            <img src="<?= $content['image'] ?: '/w3images/sandwich.jpg' ?>" alt="Content Image" class="card-img-top">
                            <div class="card-body">
                                <h5 class="card-title"><?= $content['content'] ?></h5>
                            </div>
                        </div>
                    </div>
                <?php endforeach; ?>
            </div>
        <?php endforeach; ?>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
<?php $conn->close(); ?>