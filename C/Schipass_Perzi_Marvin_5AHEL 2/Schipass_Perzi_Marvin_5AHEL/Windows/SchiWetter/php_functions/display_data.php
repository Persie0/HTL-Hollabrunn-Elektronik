<?php

//gibt ganzen Daten des übergebenen Datensatz als Table aus + Erledigt "Button"
function display_data_erledigt($data) {
    $output = "<table class='data_table'>";
    foreach($data as $col => $var) {//alle "Zeilen" der Tabelle durchgehen
        $output .= '<tr>';
        if($col===0) {//in Zeile 0 sind die table headers (Name der Entitäten)
            foreach($var as $row => $val) {//alle "Reihen" der Zeile durchgehen
                $output .= "<td>" . $row . '</td>';
            }
            $output .= '</tr>';
        }
        foreach($var as $val) {//alle "Reihen" der Zeile durchgehen
            $output .= '<td>' . $val . '</td>';
        }
        //am Ende der "Reihe" Erledigt "Button"
        $output .= '<td>' . '<form action="../../php_functions/erledigt.php" method="post">' . '<input type="hidden" value='. $var["ID"] .' name="auftrag_id" /><input type="submit" value="Auftrag erledigen"> </form>' . '</td>';
        $output .= '</tr>';
    }
    $output .= '</table>';
    echo $output;
}

//gibt ganzen Daten des übergebenen Datensatz als Table aus
function display_data($data) {
    $output = "<table class='data_table'>";
    foreach($data as $column => $var) {
        $output .= '<tr>';
        if($column===0) {
            foreach($var as $row => $val) {
                $output .= "<td>" . $row . '</td>';
            }
            $output .= '</tr>';
        }
        foreach($var as $val) {
            $output .= '<td>' . $val . '</td>';
        }
        $output .= '</tr>';
    }
    $output .= '</table>';
    echo $output;
}

//gibt ganzen Daten des übergebenen Datensatz als Optionen aus
function display_options($data) {
    $output ="";
    foreach($data as $var) {//alle "Zeilen" der Tabelle durchgehen
        foreach($var as $val) {//alle "Reihen" der Zeile durchgehen
            $output .= ' <option value="';
            $output .= $val . '">'. $val . "</option>";
        }
    }
    echo $output;
}



//gibt ganzen Daten des übergebenen Datensatz als Table aus + Auswahl von Arbeiter und Button um auswahl zu speichern
function display_data_edit($data, $options) {
    $output = "<table class='data_table'>";
    foreach($data as $column => $variable) {//alle "Zeilen" der Data Tabelle durchgehen
        $output .= '<tr>';
        if($column===0) {//in Zeile 0 sind die table headers (Name der Entitäten)
            foreach($variable as $row => $val) {//alle "Reihen" der Zeile durchgehen
                $output .= "<td>" . $row . '</td>';
            }
            $output .= "<td> Arbeiter auswählen:</td>";
            $output .= '</tr>';
        }
        foreach($variable as $val) {//alle "Reihen" der Zeile durchgehen
            $output .= '<td>' . $val . '</td>';
        }
        //Vorletzte "Reihe" Arbeiter Auswahl
        $output .= '<td>' . '<form action="../../php_functions/edit_arbeiter.php" method="post"><select class="arbeiter_select" name="arbeiter_id" id="arbeiter_id">';
        foreach($options as $var2) {//alle "Zeilen" der Option Tabelle durchgehen
            $i=0;
            $temp="";
            //Arbeiter als Optionen
            foreach($var2 as $val) {//alle "Reihen" der Zeile durchgehen
                if($i===2) {
                    $output .= ' <option value="' . $val . '">';
                }
                else {
                    $temp .= $val . " ";
                    $i++;
                }
            }
            $output .= $temp . "</option>";
        }
        //am Ende der "Reihe" "Button"
        $output .= '<td>' . '<input type="hidden" value='. $variable ["AuftragID"] .' name="auftrag_id" /><input type="submit" value="Arbeiter zuweisen"> </form>'  . '</td>';
        $output .= '</tr>';
    }
    $output .= '</table>';
    echo $output;
}