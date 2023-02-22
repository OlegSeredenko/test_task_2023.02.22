/*
Вставить $a в индексный (простой) массив целых чисел после всех элементов, в которых есть цифра 2. Новый массив создавать нельзя. Использовать функцию array_splice нельзя.
*/ 
<?php
$numbers = [980, 145, 478, 126, 852, 456, 745, 62, 7, 990];
$a = 1;
for($i = 0; $i < count($numbers); $i++) {
    $pos = strpos((string)$numbers[$i], '2');
    if($pos != false) {
        $numbers[] = $a;
        $last = count($numbers) - 1;
        $count_step = $last - $i;
        for($y = 0; $y < ($count_step-1); $y++) {
            list($numbers[$last], $numbers[$last-1]) = array($numbers[$last-1], $numbers[$last]);
            $last = $last - 1;
            if ($last == $i) {
                $pos = false;
            }
        }
    }
}
var_dump($numbers);
?>
