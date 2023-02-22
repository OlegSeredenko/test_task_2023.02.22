<?php
$message = '';
if (!empty($_FILES['fileCSV']) && $_SERVER['REQUEST_METHOD'] == 'POST') {
    $file = $_FILES['fileCSV'];
    $srcFileName = $file['name'];
    $extensionsrcFileName = pathinfo($srcFileName, PATHINFO_EXTENSION);
    if (strtolower($extensionsrcFileName) != 'csv') {
        $message = "Разрешена загрузка файлов только с расширением 'csv'";
        unset($_FILES['fileCSV']);
    } elseif ($file['error'] !== UPLOAD_ERR_OK) {
        $message = 'Ошибка при загрузке файла.';
        unset($_FILES['fileCSV']);
    } else {
        $data = trim(htmlspecialchars(file_get_contents($_FILES['fileCSV']['tmp_name'], true)));
        $data = explode(PHP_EOL, $data);
        $number = 1;
        foreach($data as $value) { 
            $value = trim($value);
            $extension = substr($value, (stripos($value, '.')+1), (stripos($value, ';') - stripos($value, '.') - 1));
            $content = substr($value, (stripos($value, ';')+1));
            file_put_contents(__DIR__ . '/upload/' . $number . '.' . $extension, $content);
            $number += 1;
        }
        $message = 'Файл загружен успешно';
    }
}
?>
<!doctype html>
<html lang="ru">
   <body>
        <main>
            <form action="" method="post" enctype="multipart/form-data" >
                <div>
                    <label class="form-label" >Загрузить CSV-файл</label><br>
                    <input type="file" name="fileCSV" class="form-control">
                </div>
                <div>
                    <button type="submit">Отправить</button>
                    </div>
                <div>
                <?php
                    if (!empty($message)) {
                        echo  $message;
                    }
                    unset($message);
                ?>
                </div>
        </main>
    </body>
</html>